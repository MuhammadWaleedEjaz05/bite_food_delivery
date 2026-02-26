import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteAddressBlock extends StatelessWidget {
  const BiteAddressBlock({
    super.key,
    required this.label,
    required this.addressText,
    this.onEdit,
    this.onDelete,
  });

  final String label;
  final String addressText;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  IconData _iconForLabel() {
    switch (label.toLowerCase()) {
      case 'home':
        return Icons.home_outlined;
      case 'work':
        return Icons.work_outline;
      default:
        return Icons.place_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 25.r,
        child: Icon(_iconForLabel(), size: 25.sp, color: Colors.deepOrange),
      ),
      title: Text(
        label,
        style: GoogleFonts.sen(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        addressText,
        style: GoogleFonts.sen(fontSize: 14.sp, color: Colors.black54),
      ),
      trailing: SizedBox(
        width: 100.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              iconSize: 20.sp,
              color: Colors.deepOrange,
              onPressed: onEdit,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              iconSize: 20.sp,
              color: Colors.red,
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
