import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/faq/widgets/support_channel_card.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/core/services/phone_call/phone_call_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaqContactSection extends StatelessWidget {
  const FaqContactSection({super.key});

  static const _supportPhone = '+923186384283';

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return SliverPadding(
      padding: context.contentInsets(bottom: 24),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            Expanded(
              child: SupportChannelCard(
                icon: Icons.phone_in_talk_rounded,
                title: t.call,
                subtitle: '24/7 Hotline',
                onTap: () {
                  try {
                    context.read<PhoneCallCubit>().makePhoneCall(_supportPhone);
                  } catch (_) {}
                },
              ),
            ),
            12.horizontalSpace,
            Expanded(
              child: SupportChannelCard(
                icon: Icons.email_outlined,
                title: t.email,
                subtitle: 'support@bite.com',
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
