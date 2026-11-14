import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/widgets/app_network_image.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAvatar extends StatelessWidget {
  final String? photoUrl;
  final String fullName;
  final double radius;
  final VoidCallback? onEditTap;

  const ProfileAvatar({
    super.key,
    this.photoUrl,
    required this.fullName,
    this.radius = 45,
    this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final diameter = radius * 2;
    final initial = fullName.trim().isNotEmpty
        ? fullName.trim().substring(0, 1).toUpperCase()
        : 'U';

    Widget avatarChild;
    if (photoUrl != null && photoUrl!.trim().isNotEmpty) {
      avatarChild = AppNetworkImage(
        url: photoUrl!,
        width: diameter.r,
        height: diameter.r,
        radius: radius,
      );
    } else {
      avatarChild = Container(
        width: diameter.r,
        height: diameter.r,
        decoration: BoxDecoration(
          color: colors.primary.withValues(alpha: 0.15),
          shape: BoxShape.circle,
          border: Border.all(
            color: colors.primary.withValues(alpha: 0.3),
            width: 2,
          ),
        ),
        alignment: Alignment.center,
        child: AppText(
          initial,
          style: AppTextStyles.headlineLarge(
            context,
          ).copyWith(color: colors.primary, fontWeight: FontWeight.bold),
        ),
      );
    }

    if (onEditTap == null) return avatarChild;

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        avatarChild,
        GestureDetector(
          onTap: onEditTap,
          child: Container(
            padding: const EdgeInsets.all(6).r,
            decoration: BoxDecoration(
              color: colors.primary,
              shape: BoxShape.circle,
              border: Border.all(color: colors.surface, width: 2),
            ),
            child: Icon(
              Icons.camera_alt_rounded,
              size: 16.r,
              color: colors.onPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
