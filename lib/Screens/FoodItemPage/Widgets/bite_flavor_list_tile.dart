import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BiteFlavorListTile extends StatelessWidget {
  const BiteFlavorListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          value: true,
          onChanged: (value) {},
          activeColor: Theme.of(context).colorScheme.primary,
          checkColor: Colors.white,

          title: Row(
            children: [
              Text(
                'Beef Burger',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Spacer(),
              Container(
                height: 60.h,
                width: 60.w,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ],
          ),
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
          checkboxShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        Divider(),
      ],
    );
  }
}
