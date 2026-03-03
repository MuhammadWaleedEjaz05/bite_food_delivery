import 'package:bite_food_delivery/Cubits/CreditCardCubit/credit_card_cubit.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/configs/firebase_auth_conn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final _cardHolderNameController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvcController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    _cardHolderNameController.dispose();
    _cardNumberController.dispose();
    _expiryController.dispose();
    _cvcController.dispose();
    super.dispose();
  }

  Future<void> _handleAddCard() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final cardNumber = _cardNumberController.text.replaceAll(' ', '');
    final expiryParts = _expiryController.text.split('/');
    final expMonth = expiryParts[0];
    final expYear = expiryParts.length > 1 ? expiryParts[1] : '';
    final cvc = _cvcController.text;

    await context.read<CreditCardCubit>().addCreditCard(
      getCurrentUser()!.uid,
      cardHolderName: _cardHolderNameController.text.trim(),
      cardNumber: cardNumber,
      expMonth: expMonth,
      expYear: expYear,
      cvc: cvc,
    );

    if (!mounted) return;
    setState(() => _isLoading = false);

    final state = context.read<CreditCardCubit>().state;
    if (state is! CreditCardError) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: _AppBarSection(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    20.verticalSpace,
                    _CardDetailsSection(
                      cardNumberController: _cardNumberController,
                      expiryController: _expiryController,
                      cvcController: _cvcController,
                    ),
                    25.verticalSpace,
                    _CardHolderSection(controller: _cardHolderNameController),
                    25.verticalSpace,
                    _SecurityInfoSection(),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: _AddCardButton(
              isLoading: _isLoading,
              onPressed: _handleAddCard,
            ),
          ),
          20.verticalSpace,
        ],
      ),
    );
  }
}

class _CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll(' ', '');
    final buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      if (i > 0 && i % 4 == 0) buffer.write(' ');
      buffer.write(text[i]);
    }
    final formatted = buffer.toString();
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class _ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll('/', '');
    final buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      if (i == 2) buffer.write('/');
      buffer.write(text[i]);
    }
    final formatted = buffer.toString();
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class _CardDetailsSection extends StatelessWidget {
  final TextEditingController cardNumberController;
  final TextEditingController expiryController;
  final TextEditingController cvcController;

  const _CardDetailsSection({
    required this.cardNumberController,
    required this.expiryController,
    required this.cvcController,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(
          icon: Icons.credit_card_rounded,
          title: 'Card Information',
        ),
        12.verticalSpace,
        // Card Number
        TextFormField(
          controller: cardNumberController,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(16),
            _CardNumberFormatter(),
          ],
          validator: (value) {
            final digits = value?.replaceAll(' ', '') ?? '';
            if (digits.isEmpty) return 'Card number is required';
            if (digits.length < 13) return 'Card number is too short';
            return null;
          },
          style: textTheme.titleMedium,
          decoration: _inputDecoration(
            context,
            hintText: '4242 4242 4242 4242',
            icon: Icons.credit_card_rounded,
          ),
        ),
        14.verticalSpace,
        // Expiry + CVC row
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: expiryController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
                  _ExpiryDateFormatter(),
                ],
                validator: (value) {
                  final text = value?.replaceAll('/', '') ?? '';
                  if (text.isEmpty) return 'Required';
                  if (text.length < 4) return 'MM/YY';
                  final month = int.tryParse(text.substring(0, 2)) ?? 0;
                  if (month < 1 || month > 12) return 'Invalid month';
                  return null;
                },
                style: textTheme.titleMedium,
                decoration: _inputDecoration(
                  context,
                  hintText: 'MM/YY',
                  icon: Icons.calendar_today_rounded,
                ),
              ),
            ),
            12.horizontalSpace,
            Expanded(
              child: TextFormField(
                controller: cvcController,
                keyboardType: TextInputType.number,
                obscureText: true,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Required';
                  if (value.length < 3) return 'Invalid CVC';
                  return null;
                },
                style: textTheme.titleMedium,
                decoration: _inputDecoration(
                  context,
                  hintText: 'CVC',
                  icon: Icons.lock_outline_rounded,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  InputDecoration _inputDecoration(
    BuildContext context, {
    required String hintText,
    required IconData icon,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return InputDecoration(
      filled: true,
      fillColor: colorScheme.onSecondaryFixed,
      hintText: hintText,
      hintStyle: textTheme.titleMedium!.copyWith(
        color: colorScheme.onSecondary,
      ),
      prefixIcon: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 10.w),
        child: Icon(icon, color: colorScheme.primary, size: 22.r),
      ),
      prefixIconConstraints: BoxConstraints(minHeight: 0, minWidth: 0),
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: BorderSide(
          color: colorScheme.primary.withAlpha(100),
          width: 1.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: BorderSide(color: Colors.red.shade200, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: BorderSide(color: Colors.red.shade300, width: 1.5),
      ),
    );
  }
}

class _CardHolderSection extends StatelessWidget {
  final TextEditingController controller;

  const _CardHolderSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(
          icon: Icons.person_outline_rounded,
          title: 'Card Holder',
        ),
        12.verticalSpace,
        TextFormField(
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textCapitalization: TextCapitalization.words,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
          ]),
          style: textTheme.titleMedium,
          decoration: InputDecoration(
            filled: true,
            fillColor: colorScheme.onSecondaryFixed,
            hintText: 'Full name on card',
            hintStyle: textTheme.titleMedium!.copyWith(
              color: colorScheme.onSecondary,
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 10.w),
              child: Icon(
                Icons.badge_outlined,
                color: colorScheme.primary,
                size: 22.r,
              ),
            ),
            prefixIconConstraints: BoxConstraints(minHeight: 0, minWidth: 0),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 16.h,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(
                color: colorScheme.primary.withAlpha(100),
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(color: Colors.red.shade200, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(color: Colors.red.shade300, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}

class _SecurityInfoSection extends StatelessWidget {
  const _SecurityInfoSection();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: colorScheme.primary.withAlpha(12),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          Icon(
            Icons.lock_outline_rounded,
            color: colorScheme.primary,
            size: 22.r,
          ),
          14.horizontalSpace,
          Expanded(
            child: Text(
              'Your card details are securely handled by Stripe. We never store your full card number.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: colorScheme.onSecondary,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddCardButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;

  const _AddCardButton({required this.isLoading, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreditCardCubit, CreditCardState>(
      listener: (context, state) {
        if (state is CreditCardError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
          print('CreditCardCubit Error: ${state.error}');
        }
      },
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: isLoading ? null : onPressed,
              icon: isLoading
                  ? SizedBox(
                      height: 20.r,
                      width: 20.r,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Icon(Icons.add_card_rounded, size: 22.r),
              label: Text(isLoading ? 'Adding...' : 'Add Card'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                disabledBackgroundColor: Theme.of(
                  context,
                ).colorScheme.primary.withAlpha(180),
                disabledForegroundColor: Colors.white70,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r),
                ),
                textStyle: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;

  const _SectionHeader({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary, size: 22.r),
        8.horizontalSpace,
        Text(title, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}

class _AppBarSection extends StatelessWidget implements PreferredSizeWidget {
  const _AppBarSection();

  @override
  Size get preferredSize => Size.fromHeight(100.h);

  @override
  Widget build(BuildContext context) {
    return BiteAppBar(
      backButton: true,
      title: Text(
        'Add Card',
        style: GoogleFonts.sen(
          fontSize: Theme.of(context).textTheme.displaySmall!.fontSize,
          fontWeight: Theme.of(context).textTheme.displaySmall!.fontWeight,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      actions: [],
    );
  }
}
