import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class BiteAddCCTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String title;
  const BiteAddCCTextField({super.key, required this.title, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        5.verticalSpace,
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
            if (title == 'Card Number') FormBuilderValidators.creditCard(),
            if (title == 'Card Holder Name') FormBuilderValidators.required(),
            if (title == 'Expiry Date')
              FormBuilderValidators.creditCardExpirationDate(
                checkForExpiration: true,
              ),
            if (title == 'CVV')
              FormBuilderValidators.creditCardCVC(
                errorText: 'Please enter a valid CVV',
              ),
          ]),
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).colorScheme.onSecondaryFixed,
            hintText: 'Enter $title',
            hintStyle: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(color: Colors.grey),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
