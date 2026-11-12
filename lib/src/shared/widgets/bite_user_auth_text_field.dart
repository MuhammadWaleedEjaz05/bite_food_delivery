import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class BiteUserAuthTextField extends StatefulWidget {
  final bool isPassword;
  final bool isEmail;
  final bool isPhone;
  final String title;
  final TextEditingController? controller;
  const BiteUserAuthTextField({
    super.key,
    required this.title,
    this.isPassword = false,
    this.isEmail = false,
    this.isPhone = false,
    this.controller,
  });
  @override
  State<BiteUserAuthTextField> createState() => _BiteUserAuthTextFieldState();
}

class _BiteUserAuthTextFieldState extends State<BiteUserAuthTextField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.normal),
        ),
        5.verticalSpace,
        TextFormField(
          controller: widget.controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: widget.isPassword
              ? (isPasswordVisible ? false : true)
              : false,
          obscuringCharacter: String.fromCharCode(0x2022),
          keyboardType: widget.isEmail
              ? TextInputType.emailAddress
              : widget.isPhone
              ? TextInputType.phone
              : TextInputType.text,
          decoration: InputDecoration(
            suffix: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    style: IconButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: const CircleBorder(),
                      padding: EdgeInsets.zero,
                      backgroundColor: isPasswordVisible
                          ? Theme.of(context).colorScheme.primary
                          : Colors.white,
                      foregroundColor: isPasswordVisible
                          ? Colors.white
                          : Theme.of(context).colorScheme.primary,
                    ),
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  )
                : const SizedBox.shrink(),
            hintText: AppLocalizations.of(context)!.editTitle(widget.title),
            hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.normal,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Theme.of(context).colorScheme.onSecondaryFixed,
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
              errorText: AppLocalizations.of(
                context,
              )!.pleaseEnterWidgettitletolowercase(widget.title.toLowerCase()),
            ),
            if (widget.isEmail)
              FormBuilderValidators.email(
                errorText: AppLocalizations.of(
                  context,
                )!.pleaseEnterAValidEmailAddress,
              ),
            if (widget.isPhone)
              FormBuilderValidators.phoneNumber(
                errorText: AppLocalizations.of(
                  context,
                )!.pleaseEnterAValidPhoneNumber,
              ),
            if (widget.isPassword)
              FormBuilderValidators.minLength(
                8,
                errorText: AppLocalizations.of(
                  context,
                )!.passwordMustBeAtLeast8CharactersLong,
              ),
          ]),
        ),
      ],
    );
  }
}
