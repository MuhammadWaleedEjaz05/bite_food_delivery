import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/addresses/bloc/address_cubit.dart';
import 'package:bite_food_delivery/features/addresses/bloc/address_editor_cubit.dart';
import 'package:bite_food_delivery/features/addresses/bloc/address_editor_state.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/core/services/firebase/firebase_auth_conn.dart';
import 'package:bite_food_delivery/widgets/app_primary_button.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressSaveSection extends StatelessWidget {
  final bool isUpdate;
  final String? addressId;

  const AddressSaveSection({super.key, required this.isUpdate, this.addressId});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final cubit = context.read<AddressEditorCubit>();
    return BlocConsumer<AddressEditorCubit, AddressEditorState>(
      listenWhen: (prev, curr) =>
          prev.isSaved != curr.isSaved ||
          prev.errorMessage != curr.errorMessage,
      listener: (context, state) {
        if (state.isSaved) {
          Navigator.of(context).pop();
        } else if (state.errorMessage != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
        }
      },
      builder: (context, state) {
        return SafeArea(
          top: false,
          child: Padding(
            padding: context.contentInsets(top: 12, bottom: 12),
            child: AppPrimaryButton(
              label: isUpdate ? t.updateAddress : t.saveAddress,
              busy: state.isSubmitting,
              onTap: () {
                final user = getCurrentUser();
                cubit.save(
                  addressCubit: context.read<AddressCubit>(),
                  userId: user?.uid ?? '',
                  addressId: addressId,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
