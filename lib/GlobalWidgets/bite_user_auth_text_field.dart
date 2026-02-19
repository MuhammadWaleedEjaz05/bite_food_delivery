import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
        Text(widget.title, style: GoogleFonts.sen(fontSize: 20.sp)),
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
                      shape: CircleBorder(),
                      padding: EdgeInsets.zero,
                      backgroundColor: isPasswordVisible
                          ? Colors.deepOrange
                          : Colors.white,
                      foregroundColor: isPasswordVisible
                          ? Colors.white
                          : Colors.deepOrange,
                    ),
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  )
                : SizedBox.shrink(),
            hintText: 'Enter ${widget.title}',
            hintStyle: GoogleFonts.sen(fontSize: 20.sp),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey.shade200,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter ${widget.title}';
            }
            if (widget.isEmail &&
                !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
              return 'Please enter a valid email address';
            }
            if (widget.isPhone &&
                !RegExp(r'^\+?[0-9]{7,15}$').hasMatch(value)) {
              return 'Please enter a valid phone number';
            }
            if (widget.isPassword && value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
        ),
      ],
    );
  }
}
