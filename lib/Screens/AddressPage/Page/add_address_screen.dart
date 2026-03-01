import 'package:bite_food_delivery/Cubits/MapLocationCubit/map_location_cubit.dart';
import 'package:bite_food_delivery/Cubits/AddressCubit/address_cubit.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_address_text_field.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/Models/address_model.dart';
import 'package:bite_food_delivery/configs/firebase_auth_conn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
  final List<String> _addressLabels = const ['Home', 'Work', 'Other'];
  String _selectedLabel = 'Home';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MapLocationCubit(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: Colors.blueGrey),
                child: Stack(
                  children: [
                    BlocBuilder<MapLocationCubit, MapLocationState>(
                      builder: (context, state) {
                        if (state is MapLocationLoading) {
                          return Center(child: CircularProgressIndicator());
                        }

                        if (state is MapLocationPermissionDenied) {
                          return Center(
                            child: Text(
                              'Location permission is required',
                              style: Theme.of(context).textTheme.titleSmall!
                                    .copyWith(fontWeight: FontWeight.normal),
                            ),
                          );
                        }

                        if (state is MapLocationError) {
                          return Center(
                            child: Text(
                              'Error: ${state.message}',
                              style: Theme.of(context).textTheme.titleSmall!
                                    .copyWith(fontWeight: FontWeight.normal),
                            ),
                          );
                        }

                        if (state is MapLocationLoaded) {
                          return GoogleMap(
                            onMapCreated: _onMapCreated,
                            initialCameraPosition: CameraPosition(
                              target: LatLng(state.latitude, state.longitude),
                              zoom: 15,
                            ),
                            myLocationEnabled: true,
                            myLocationButtonEnabled: true,
                            compassEnabled: true,
                            zoomControlsEnabled: true,
                          );
                        }

                        return GoogleMap(
                          onMapCreated: _onMapCreated,
                          initialCameraPosition: CameraPosition(
                            target: LatLng(37.7749, -122.4194),
                            zoom: 15,
                          ),
                          myLocationEnabled: true,
                          myLocationButtonEnabled: true,
                          compassEnabled: true,
                          zoomControlsEnabled: true,
                        );
                      },
                    ),
                    _AppBarSection(),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
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
                      selectedLabel: _selectedLabel,
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
                      selectedLabel: _selectedLabel,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
        BiteAddressTextField(title: 'Address', controller: addressController),
        10.verticalSpace,
        Row(
          children: [
            Expanded(
              child: BiteAddressTextField(
                title: 'Street No.',
                controller: streetController,
              ),
            ),
            10.horizontalSpace,
            Expanded(
              child: BiteAddressTextField(
                title: 'ZIP Code',
                controller: zipController,
              ),
            ),
          ],
        ),
        10.verticalSpace,
        BiteAddressTextField(title: 'City', controller: cityController),
        10.verticalSpace,
        BiteAddressTextField(title: 'Country', controller: countryController),
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
    final primaryColor = Colors.deepOrange;
    final backgroundColor = Colors.white;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Label', style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.normal)),
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
  });

  final TextEditingController addressController;
  final TextEditingController streetController;
  final TextEditingController zipController;
  final TextEditingController cityController;
  final TextEditingController countryController;
  final String selectedLabel;

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
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please fill all required fields'),
                  ),
                );
                return;
              }
              final street = [
                streetNo,
                addressLine,
              ].where((part) => part.isNotEmpty).join(' ');

              final locationState = context.read<MapLocationCubit>().state;
              LatLng? location;
              if (locationState is MapLocationLoaded) {
                location = LatLng(
                  locationState.latitude,
                  locationState.longitude,
                );
              }

              final currentUser = getCurrentUser();
              if (currentUser == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('User not authenticated'),
                    backgroundColor: Colors.red,
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
                location: location,
              );

              context
                  .read<AddressCubit>()
                  .addAddress(address)
                  .then((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Address added successfully!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.pop(context);
                  })
                  .catchError((error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Failed to add address: $error'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  });
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              textStyle: Theme.of(context).textTheme.headlineLarge,
            ),
            child: Text('Save'),
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
    return Stack(
      children: [
        BiteAppBar(
          title: SizedBox.shrink(),
          actions: [],
          backButton: true,
          isDarkMode: true,
        ),
      ],
    );
  }
}
