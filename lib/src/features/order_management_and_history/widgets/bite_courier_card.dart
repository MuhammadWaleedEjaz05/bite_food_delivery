import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BiteCourierCard extends StatelessWidget {
  final String courierName;
  final String? courierImageUrl;
  final VoidCallback onCallTap;

  const BiteCourierCard({
    super.key,
    required this.courierName,
    required this.onCallTap,
    this.courierImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Row(
      children: [
        CircleAvatar(
          radius: 26.r,
          backgroundColor: Colors.grey.shade200,
          backgroundImage: courierImageUrl != null
              ? NetworkImage(courierImageUrl!)
              : null,
          child: courierImageUrl == null
              ? Icon(
                  Icons.person,
                  size: 28.r,
                  color: Theme.of(context).colorScheme.onSecondary,
                )
              : null,
        ),
        12.horizontalSpace,

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(courierName, style: Theme.of(context).textTheme.titleMedium),
              Text(
                AppLocalizations.of(context)!.courier,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ],
          ),
        ),

        _ActionCircleButton(
          color: primaryColor,
          icon: Icons.call,
          onTap: onCallTap,
        ),
      ],
    );
  }
}

class _ActionCircleButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onTap;

  const _ActionCircleButton({
    required this.color,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45.r,
        width: 45.r,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child: Icon(icon, color: Colors.white, size: 22.r),
      ),
    );
  }
}
