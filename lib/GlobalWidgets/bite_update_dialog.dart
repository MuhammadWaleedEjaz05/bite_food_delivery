import 'package:bite_food_delivery/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class BiteUpdateDialog extends StatelessWidget {
  final String latestVersion;
  final String updateUrl;

  const BiteUpdateDialog({
    super.key,
    required this.latestVersion,
    required this.updateUrl,
  });

  static Future<void> show(
    BuildContext context, {
    required String latestVersion,
    required String updateUrl,
  }) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: S.of(context).updateDialog,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 350),
      transitionBuilder: (context, anim1, anim2, child) {
        final curved = CurvedAnimation(
          parent: anim1,
          curve: Curves.easeOutBack,
        );
        return ScaleTransition(
          scale: curved,
          child: FadeTransition(opacity: anim1, child: child),
        );
      },
      pageBuilder: (context, _, __) =>
          BiteUpdateDialog(latestVersion: latestVersion, updateUrl: updateUrl),
    );
  }

  Future<void> _launchUpdate() async {
    final uri = Uri.parse(updateUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withOpacity(isDark ? 0.15 : 0.08),
                  blurRadius: 40,
                  spreadRadius: 2,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 28.h),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        colorScheme.primary,
                        colorScheme.primary.withOpacity(0.8),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.r),
                      topRight: Radius.circular(24.r),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 64.w,
                        height: 64.w,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.system_update_rounded,
                          size: 34.sp,
                          color: Colors.white,
                        ),
                      ),
                      12.verticalSpace,
                      Text(
                        S.of(context).updateAvailable,
                        style: GoogleFonts.sen(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 8.h),
                  child: Column(
                    children: [
                      Text(
                        S.of(context).aNewVersionOfBiteIsReady,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sen(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      8.verticalSpace,
                      Text(
                        S.of(context).versionLatestversionIncludesNewFeatures,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sen(
                          fontSize: 13.5.sp,
                          color: colorScheme.onSurfaceVariant,
                          height: 1.5,
                        ),
                      ),
                      20.verticalSpace,

                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.new_releases_rounded,
                              size: 16.sp,
                              color: colorScheme.primary,
                            ),
                            8.horizontalSpace,
                            Text(
                              'v$latestVersion',
                              style: GoogleFonts.sen(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                                color: colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 24.h),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 50.h,
                        child: ElevatedButton(
                          onPressed: _launchUpdate,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorScheme.primary,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.r),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.download_rounded, size: 20.sp),
                              8.horizontalSpace,
                              Text(
                                S.of(context).updateNow,
                                style: GoogleFonts.sen(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      12.verticalSpace,

                      SizedBox(
                        width: double.infinity,
                        height: 50.h,
                        child: TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          style: TextButton.styleFrom(
                            foregroundColor: colorScheme.onSurfaceVariant,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.r),
                              side: BorderSide(
                                color: colorScheme.secondary.withOpacity(0.3),
                              ),
                            ),
                          ),
                          child: Text(
                            S.of(context).maybeLater,
                            style: GoogleFonts.sen(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
