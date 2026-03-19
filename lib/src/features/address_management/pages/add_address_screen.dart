import 'package:bite_food_delivery/src/features/address_management/cubits/map_location_cubit/map_location_cubit.dart';
import 'package:bite_food_delivery/src/features/address_management/cubits/address_cubit/address_cubit.dart';
import 'package:bite_food_delivery/src/shared/widgets/bite_address_text_field.dart';
import 'package:bite_food_delivery/src/shared/widgets/bite_app_bar.dart';
import 'package:bite_food_delivery/src/features/address_management/models/address_model.dart';
import 'package:bite_food_delivery/src/services/firebase/firebase_auth_conn.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  late GoogleMapController mapController;
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  List<String> get _addressLabels => [
    AppLocalizations.of(context)!.home,
    AppLocalizations.of(context)!.work,
    AppLocalizations.of(context)!.other,
  ];
  String? _selectedLabel;
  LatLng? _selectedLocation;
  bool _isMapMoving = false;

  @override
  void dispose() {
    mapController.dispose();
    _addressController.dispose();
    _streetController.dispose();
    _zipController.dispose();
    _cityController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _onCameraMove(CameraPosition position) {
    _selectedLocation = position.target;
    if (!_isMapMoving) {
      setState(() => _isMapMoving = true);
    }
  }

  void _onCameraIdle() {
    if (_isMapMoving && _selectedLocation != null) {
      setState(() => _isMapMoving = false);
      context.read<MapLocationCubit>().pickLocation(
        _selectedLocation!.latitude,
        _selectedLocation!.longitude,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _selectedLabel ??= AppLocalizations.of(context)!.home;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(color: Colors.blueGrey),
              child: Stack(
                children: [
                  BlocConsumer<MapLocationCubit, MapLocationState>(
                    listener: (context, state) {
                      if (state is MapLocationPicked) {
                        _addressController.text = state.address ?? '';
                        _streetController.text = state.street ?? '';
                        _cityController.text = state.city ?? '';
                        _zipController.text = state.zipCode ?? '';
                        _countryController.text = state.country ?? '';
                      }
                    },
                    buildWhen: (previous, current) =>
                        current is! MapLocationPicked,
                    builder: (context, state) {
                      if (state is MapLocationLoading) {
                        return Center(
                          child: Lottie.asset(
                            'assets/animations/loading.json',
                            height: 75.h,
                            width: 75.w,
                          ),
                        );
                      }

                      if (state is MapLocationPermissionDenied) {
                        return Center(
                          child: Text(
                            AppLocalizations.of(
                              context,
                            )!.locationPermissionIsRequired,
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(fontWeight: FontWeight.normal),
                          ),
                        );
                      }

                      if (state is MapLocationError) {
                        return Center(
                          child: Text(
                            AppLocalizations.of(
                              context,
                            )!.errorStatemessage(state.message),
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(fontWeight: FontWeight.normal),
                          ),
                        );
                      }

                      if (state is MapLocationLoaded) {
                        final initialPos = LatLng(
                          state.latitude,
                          state.longitude,
                        );
                        _selectedLocation ??= initialPos;
                        return SafeArea(
                          child: GoogleMap(
                            onMapCreated: _onMapCreated,
                            initialCameraPosition: CameraPosition(
                              target: initialPos,
                              zoom: 15,
                            ),
                            onCameraMove: _onCameraMove,
                            onCameraIdle: _onCameraIdle,
                            myLocationEnabled: true,
                            myLocationButtonEnabled: true,
                            compassEnabled: true,
                            zoomControlsEnabled: true,
                          ),
                        );
                      }

                      return GoogleMap(
                        onMapCreated: _onMapCreated,
                        initialCameraPosition: const CameraPosition(
                          target: LatLng(37.7749, -122.4194),
                          zoom: 15,
                        ),
                        onCameraMove: _onCameraMove,
                        onCameraIdle: _onCameraIdle,
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                        compassEnabled: true,
                        zoomControlsEnabled: true,
                      );
                    },
                  ),
                  IgnorePointer(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 36.h),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          child: Icon(
                            Icons.location_pin,
                            size: _isMapMoving ? 48.r : 40.r,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: _AppBarSection(),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
              ),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                children: [
                  20.verticalSpace,
                  _NewAddressSection(
                    addressController: _addressController,
                    streetController: _streetController,
                    zipController: _zipController,
                    cityController: _cityController,
                    countryController: _countryController,
                  ),
                  20.verticalSpace,
                  _AddressLabelSection(
                    labels: _addressLabels,
                    selectedLabel: _selectedLabel!,
                    onSelected: (label) {
                      setState(() {
                        _selectedLabel = label;
                      });
                    },
                  ),
                  20.verticalSpace,
                  _SaveAddressSection(
                    addressController: _addressController,
                    streetController: _streetController,
                    zipController: _zipController,
                    cityController: _cityController,
                    countryController: _countryController,
                    selectedLabel: _selectedLabel!,
                    selectedLocation: _selectedLocation,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NewAddressSection extends StatelessWidget {
  const _NewAddressSection({
    required this.addressController,
    required this.streetController,
    required this.zipController,
    required this.cityController,
    required this.countryController,
  });

  final TextEditingController addressController;
  final TextEditingController streetController;
  final TextEditingController zipController;
  final TextEditingController cityController;
  final TextEditingController countryController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BiteAddressTextField(
          title: AppLocalizations.of(context)!.address,
          controller: addressController,
        ),
        10.verticalSpace,
        Row(
          children: [
            Expanded(
              child: BiteAddressTextField(
                title: AppLocalizations.of(context)!.streetNo,
                controller: streetController,
              ),
            ),
            10.horizontalSpace,
            Expanded(
              child: BiteAddressTextField(
                title: AppLocalizations.of(context)!.zipCode,
                controller: zipController,
              ),
            ),
          ],
        ),
        10.verticalSpace,
        BiteAddressTextField(
          title: AppLocalizations.of(context)!.city,
          controller: cityController,
        ),
        10.verticalSpace,
        BiteAddressTextField(
          title: AppLocalizations.of(context)!.country,
          controller: countryController,
        ),
      ],
    );
  }
}

class _AddressLabelSection extends StatelessWidget {
  const _AddressLabelSection({
    required this.labels,
    required this.selectedLabel,
    required this.onSelected,
  });

  final List<String> labels;
  final String selectedLabel;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final backgroundColor = Theme.of(context).colorScheme.surface;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.label,
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.normal),
        ),
        10.verticalSpace,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: labels
                .map(
                  (label) => Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: TextButton(
                      onPressed: () => onSelected(label),
                      style: TextButton.styleFrom(
                        backgroundColor: backgroundColor,
                        foregroundColor: primaryColor,
                        padding: EdgeInsets.symmetric(
                          horizontal: 18.w,
                          vertical: 8.h,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          side: BorderSide(
                            color: primaryColor,
                            width: label == selectedLabel ? 2 : 1,
                          ),
                        ),
                        textStyle: Theme.of(context).textTheme.titleSmall!
                            .copyWith(
                              fontWeight: label == selectedLabel
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                      ),
                      child: Text(label),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _SaveAddressSection extends StatelessWidget {
  const _SaveAddressSection({
    required this.addressController,
    required this.streetController,
    required this.zipController,
    required this.cityController,
    required this.countryController,
    required this.selectedLabel,
    required this.selectedLocation,
  });

  final TextEditingController addressController;
  final TextEditingController streetController;
  final TextEditingController zipController;
  final TextEditingController cityController;
  final TextEditingController countryController;
  final String selectedLabel;
  final LatLng? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              final streetNo = streetController.text.trim();
              final addressLine = addressController.text.trim();
              final city = cityController.text.trim();
              final zipCode = zipController.text.trim();
              final country = countryController.text.trim();
              if (city.isEmpty || zipCode.isEmpty || country.isEmpty) {
                showTopSnackBar(
                  Overlay.of(context),
                  CustomSnackBar.error(
                    message: AppLocalizations.of(
                      context,
                    )!.pleaseFillAllRequiredFields,
                  ),
                );
                return;
              }
              final street = [
                streetNo,
                addressLine,
              ].where((part) => part.isNotEmpty).join(', ');

              final currentUser = getCurrentUser();
              if (currentUser == null) {
                showTopSnackBar(
                  Overlay.of(context),
                  CustomSnackBar.error(
                    message: AppLocalizations.of(context)!.userNotAuthenticated,
                  ),
                );
                return;
              }
              final address = AddressModel(
                addressID: DateTime.now().millisecondsSinceEpoch.toString(),
                userID: currentUser.uid,
                label: selectedLabel,
                street: street,
                city: city,
                zipCode: zipCode,
                country: country,
                location: selectedLocation,
              );

              context
                  .read<AddressCubit>()
                  .addAddress(address)
                  .then((_) {
                    showTopSnackBar(
                      Overlay.of(context),
                      CustomSnackBar.success(
                        message: AppLocalizations.of(
                          context,
                        )!.addressAddedSuccessfully,
                      ),
                    );
                    Navigator.pop(context);
                  })
                  .catchError((error) {
                    showTopSnackBar(
                      Overlay.of(context),
                      CustomSnackBar.error(
                        message: AppLocalizations.of(
                          context,
                        )!.failedToAddAddressError(error.toString()),
                      ),
                    );
                  });
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              textStyle: Theme.of(context).textTheme.headlineLarge,
            ),
            child: Text(AppLocalizations.of(context)!.save),
          ),
        ),
      ],
    );
  }
}

class _AppBarSection extends StatelessWidget {
  const _AppBarSection();

  @override
  Widget build(BuildContext context) {
    return const BiteAppBar(
      title: SizedBox.shrink(),
      actions: [],
      backButton: true,
      isDarkMode: true,
    );
  }
}
