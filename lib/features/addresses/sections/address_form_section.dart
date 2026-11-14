import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/addresses/bloc/address_editor_cubit.dart';
import 'package:bite_food_delivery/features/addresses/bloc/address_editor_state.dart';
import 'package:bite_food_delivery/features/addresses/models/address_model.dart';
import 'package:bite_food_delivery/features/addresses/widgets/address_text_field.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressFormSection extends StatefulWidget {
  final bool isUpdate;
  final AddressModel? initialAddress;

  const AddressFormSection({
    super.key,
    required this.isUpdate,
    this.initialAddress,
  });

  @override
  State<AddressFormSection> createState() => _AddressFormSectionState();
}

class _AddressFormSectionState extends State<AddressFormSection> {
  late final TextEditingController _streetController;
  late final TextEditingController _cityController;
  late final TextEditingController _zipController;
  late final TextEditingController _countryController;

  @override
  void initState() {
    super.initState();
    final a = widget.initialAddress;
    _streetController = TextEditingController(text: a?.street ?? '');
    _cityController = TextEditingController(text: a?.city ?? '');
    _zipController = TextEditingController(text: a?.zipCode ?? '');
    _countryController = TextEditingController(text: a?.country ?? '');
  }

  @override
  void dispose() {
    _streetController.dispose();
    _cityController.dispose();
    _zipController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final cubit = context.read<AddressEditorCubit>();
    return BlocListener<AddressEditorCubit, AddressEditorState>(
      listenWhen: (prev, curr) =>
          prev.street != curr.street ||
          prev.city != curr.city ||
          prev.zipCode != curr.zipCode ||
          prev.country != curr.country,
      listener: (context, state) {
        if (_streetController.text != state.street) {
          _streetController.text = state.street;
        }
        if (_cityController.text != state.city) {
          _cityController.text = state.city;
        }
        if (_zipController.text != state.zipCode) {
          _zipController.text = state.zipCode;
        }
        if (_countryController.text != state.country) {
          _countryController.text = state.country;
        }
      },
      child: SliverPadding(
        padding: context.contentInsets(bottom: 20),
        sliver: SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddressTextField(
                label: t.street,
                hintText: t.enterStreet,
                controller: _streetController,
                prefixIcon: const Icon(Icons.signpost_outlined),
                onChanged: cubit.setStreet,
              ),
              16.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: AddressTextField(
                      label: t.city,
                      hintText: t.enterCity,
                      controller: _cityController,
                      prefixIcon: const Icon(Icons.location_city_outlined),
                      onChanged: cubit.setCity,
                    ),
                  ),
                  14.horizontalSpace,
                  Expanded(
                    child: AddressTextField(
                      label: t.zipCode,
                      hintText: t.enterZipCode,
                      controller: _zipController,
                      prefixIcon: const Icon(Icons.numbers_outlined),
                      keyboardType: TextInputType.number,
                      onChanged: cubit.setZipCode,
                    ),
                  ),
                ],
              ),
              16.verticalSpace,
              AddressTextField(
                label: t.country,
                hintText: t.enterCountry,
                controller: _countryController,
                prefixIcon: const Icon(Icons.public_outlined),
                onChanged: cubit.setCountry,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
