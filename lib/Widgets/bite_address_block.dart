import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteAddressBlock extends StatelessWidget {
  const BiteAddressBlock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 25.r,
        child: Icon(
          Icons.home_outlined,
          size: 25.sp,
          color: Theme.of(context).primaryColor,
        ),
      ),
      title: Text(
        'Home',
        style: GoogleFonts.sen(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        '123 Main St, City, Country',
        style: GoogleFonts.sen(
          fontSize: 14.sp,
          color: Colors.black54,
        ),
      ),
      trailing: SizedBox(
        width: 100.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              iconSize: 20.sp,
              color: Theme.of(context).primaryColor,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.delete),
              iconSize: 20.sp,
              color: Colors.red,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
