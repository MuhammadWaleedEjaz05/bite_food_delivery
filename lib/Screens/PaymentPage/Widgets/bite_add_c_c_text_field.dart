import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';

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
          style: GoogleFonts.sen(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
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
            fillColor: Colors.grey.shade200,
            hintText: 'Enter $title',
            hintStyle: GoogleFonts.sen(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
      ],
    );
  }
}
