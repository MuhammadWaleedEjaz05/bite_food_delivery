import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bite_food_delivery/features/app_update/bloc/update_check_cubit.dart';
import 'package:bite_food_delivery/features/app_update/bloc/update_check_state.dart';
import 'package:bite_food_delivery/features/app_update/widgets/update_dialog.dart';

class DashboardBodySection extends StatelessWidget {
  const DashboardBodySection({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) =>
      BlocListener<UpdateCheckCubit, UpdateCheckState>(
        listener: (context, state) {
          if (state is UpdateRequired) {
            BiteUpdateDialog.show(
              context,
              latestVersion: state.latestVersion,
              updateUrl: state.updateUrl,
            );
          }
        },
        child: child,
      );
}
