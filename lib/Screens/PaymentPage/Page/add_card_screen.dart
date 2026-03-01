import 'package:bite_food_delivery/Cubits/CreditCardCubit/credit_card_cubit.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/Models/credit_card_model.dart'
    as credit_card_model
    show CreditCardType;
import 'package:bite_food_delivery/Models/credit_card_model.dart'
    hide CreditCardType;
import 'package:bite_food_delivery/Screens/PaymentPage/Widgets/bite_add_c_c_text_field.dart';
import 'package:bite_food_delivery/configs/firebase_auth_conn.dart';
import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:credit_card_type_detector/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final _cardNumberController = TextEditingController();
  final _cardHolderNameController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();
  final _creditCardFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _cardHolderNameController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _AppBarSection(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    20.verticalSpace,
                    _CardDetailsSection(
                      formKey: _creditCardFormKey,
                      cardNumberController: _cardNumberController,
                      cardHolderNameController: _cardHolderNameController,
                      expiryDateController: _expiryDateController,
                      cvvController: _cvvController,
                    ),
                  ],
                ),
              ),
            ),
            _AddCardSection(
              formKey: _creditCardFormKey,
              cardNumberController: _cardNumberController,
              cardHolderNameController: _cardHolderNameController,
              expiryDateController: _expiryDateController,
              cvvController: _cvvController,
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}

class _AddCardSection extends StatelessWidget {
  const _AddCardSection({
    required this.formKey,
    required this.cardNumberController,
    required this.cardHolderNameController,
    required this.expiryDateController,
    required this.cvvController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController cardNumberController;
  final TextEditingController cardHolderNameController;
  final TextEditingController expiryDateController;
  final TextEditingController cvvController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                final CreditCardModel newCreditCard;
                final cardTypes = detectCCType(cardNumberController.text);
                final cardTypeStr = cardTypes.isNotEmpty
                    ? cardTypes.first.type
                    : '';
                switch (cardTypeStr) {
                  case TYPE_VISA:
                    newCreditCard = CreditCardModel(
                      cardNumber: cardNumberController.text,
                      cardHolderName: cardHolderNameController.text,
                      expiryDate: expiryDateController.text,
                      cvv: cvvController.text,
                      cardType: credit_card_model.CreditCardType.visa,
                    );
                    break;
                  case TYPE_MASTERCARD:
                    newCreditCard = CreditCardModel(
                      cardNumber: cardNumberController.text,
                      cardHolderName: cardHolderNameController.text,
                      expiryDate: expiryDateController.text,
                      cvv: cvvController.text,
                      cardType: credit_card_model.CreditCardType.mastercard,
                    );
                    break;
                  default:
                    newCreditCard = CreditCardModel(
                      cardNumber: cardNumberController.text,
                      cardHolderName: cardHolderNameController.text,
                      expiryDate: expiryDateController.text,
                      cvv: cvvController.text,
                      cardType: credit_card_model.CreditCardType.onCash,
                    );
                    break;
                }
                context
                    .read<CreditCardCubit>()
                    .addCreditCard(getCurrentUser()!.uid, newCreditCard)
                    .then((_) => Navigator.pop(context));
              }
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              textStyle: Theme.of(context).textTheme.headlineLarge,
            ),
            child: Text('Add Card'),
          ),
        ),
      ],
    );
  }
}

class _CardDetailsSection extends StatelessWidget {
  const _CardDetailsSection({
    required this.formKey,
    required this.cardNumberController,
    required this.cardHolderNameController,
    required this.expiryDateController,
    required this.cvvController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController cardNumberController;
  final TextEditingController cardHolderNameController;
  final TextEditingController expiryDateController;
  final TextEditingController cvvController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          BiteAddCCTextField(
            title: 'Card Number',
            controller: cardNumberController,
          ),
          10.verticalSpace,
          BiteAddCCTextField(
            title: 'Card Holder Name',
            controller: cardHolderNameController,
          ),
          10.verticalSpace,
          Row(
            children: [
              Expanded(
                child: BiteAddCCTextField(
                  title: 'Expiry Date',
                  controller: expiryDateController,
                ),
              ),
              20.horizontalSpace,
              Expanded(
                child: BiteAddCCTextField(
                  title: 'CVV',
                  controller: cvvController,
                ),
              ),
            ],
          ),
        ],
      ),
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
          color: Colors.deepOrange,
        ),
      ),
      actions: [],
    );
  }
}
