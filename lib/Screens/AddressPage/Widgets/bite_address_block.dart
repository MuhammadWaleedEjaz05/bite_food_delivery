import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        child: Icon(
          _iconForLabel(),
          size: 25.sp,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      title: Text(
        label,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      subtitle: Text(
        addressText,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: Theme.of(context).colorScheme.secondary,
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
              color: Theme.of(context).colorScheme.primary,
              onPressed: onEdit,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              iconSize: 20.sp,
              color: Theme.of(context).colorScheme.error,
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
