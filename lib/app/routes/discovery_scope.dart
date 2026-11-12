import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bite_food_delivery/core/di/di.dart';
import 'package:bite_food_delivery/features/discovery/bloc/discovery_cubit.dart';
import 'package:bite_food_delivery/features/discovery/pages/discovery_screen.dart';
import 'package:bite_food_delivery/features/favourites/pages/favourites_screen.dart';

class DiscoveryScope extends StatelessWidget {
  const DiscoveryScope({super.key, this.category = '', this.savedOnly = false});
  final String category;
  final bool savedOnly;
  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => Di.sl<DiscoveryCubit>()
      ..category(category)
      ..load(),
    child: savedOnly ? const FavouriteScreen() : const DiscoveryScreen(),
  );
}
