import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class BiteAddressTextField extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  const BiteAddressTextField({super.key, required this.title, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.normal)),
        5.verticalSpace,
        TextFormField(
          controller: controller,
          validator: FormBuilderValidators.street(
            errorText: 'Please enter a valid address',
          ),
          decoration: InputDecoration(
            hintText: 'Enter $title',
            hintStyle: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.normal),
            labelText: title,
            labelStyle: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.normal),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey.shade200,
          ),
        ),
      ],
    );
  }
}
