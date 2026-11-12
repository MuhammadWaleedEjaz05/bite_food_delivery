import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    super.key,
    required this.url,
    this.height,
    this.width,
    this.radius = 20,
  });
  final String url;
  final double? height;
  final double? width;
  final double radius;
  @override
  Widget build(BuildContext context) {
    final uri = Uri.tryParse(url);
    final valid =
        uri != null &&
        (uri.scheme == 'https' || uri.scheme == 'http') &&
        uri.host.isNotEmpty;
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius).r,
      child: SizedBox(
        width: width,
        height: height,
        child: valid
            ? CachedNetworkImage(
                imageUrl: url,
                width: width,
                height: height,
                fit: BoxFit.cover,
                placeholder: (_, _) => const _ImagePlaceholder(),
                errorWidget: (_, _, _) => const _ImagePlaceholder(),
              )
            : const _ImagePlaceholder(),
      ),
    );
  }
}

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder();
  @override
  Widget build(BuildContext context) => ColoredBox(
    color: context.appColors.surfaceContainerHighest,
    child: Center(
      child: Icon(
        Icons.restaurant_outlined,
        size: 28.r,
        color: context.appColors.onSurfaceVariant,
      ),
    ),
  );
}
