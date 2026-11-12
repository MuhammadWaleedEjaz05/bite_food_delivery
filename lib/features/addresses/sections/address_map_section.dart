import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/addresses/bloc/address_editor_cubit.dart';
import 'package:bite_food_delivery/features/addresses/bloc/map_location_cubit.dart';
import 'package:bite_food_delivery/features/addresses/widgets/address_map_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressMapSection extends StatefulWidget {
  final LatLng? initialLocation;

  const AddressMapSection({super.key, this.initialLocation});

  @override
  State<AddressMapSection> createState() => _AddressMapSectionState();
}

class _AddressMapSectionState extends State<AddressMapSection> {
  GoogleMapController? _controller;
  LatLng? _currentCenter;
  bool _isMoving = false;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _onCameraMove(CameraPosition position) {
    _currentCenter = position.target;
    if (!_isMoving) {
      setState(() => _isMoving = true);
    }
  }

  void _onCameraIdle() {
    if (_isMoving && _currentCenter != null) {
      setState(() => _isMoving = false);
      context.read<MapLocationCubit>().pickLocation(
        _currentCenter!.latitude,
        _currentCenter!.longitude,
      );
      context.read<AddressEditorCubit>().setLocation(_currentCenter!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MapLocationCubit, MapLocationState>(
      listener: (context, state) {
        if (state is MapLocationPicked) {
          context.read<AddressEditorCubit>().updateFromLocationPick(
            latitude: state.latitude,
            longitude: state.longitude,
            street: state.street,
            city: state.city,
            zipCode: state.zipCode,
            country: state.country,
          );
        } else if (state is MapLocationLoaded &&
            state.latitude != null &&
            state.longitude != null) {
          final pos = LatLng(state.latitude!, state.longitude!);
          _controller?.animateCamera(CameraUpdate.newLatLng(pos));
          context.read<AddressEditorCubit>().setLocation(pos);
        }
      },
      child: SliverPadding(
        padding: context.contentInsets(bottom: 20),
        sliver: SliverToBoxAdapter(
          child: AddressMapPicker(
            initialPosition:
                widget.initialLocation ??
                const LatLng(31.5204, 74.3587), // Default coordinate
            onMapCreated: (c) => _controller = c,
            onCameraMove: _onCameraMove,
            onCameraIdle: _onCameraIdle,
            onMyLocationTap: () =>
                context.read<MapLocationCubit>().getCurrentLocation(),
            isMoving: _isMoving,
          ),
        ),
      ),
    );
  }
}
