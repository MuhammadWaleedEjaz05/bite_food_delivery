import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/discovery_cubit.dart';

class DiscoveryRefreshSection extends StatelessWidget {
  const DiscoveryRefreshSection({super.key});
  @override
  Widget build(BuildContext context) => CupertinoSliverRefreshControl(
    onRefresh: context.read<DiscoveryCubit>().load,
  );
}
