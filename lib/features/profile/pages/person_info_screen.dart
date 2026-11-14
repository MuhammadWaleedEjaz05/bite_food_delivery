import 'package:bite_food_delivery/features/profile/sections/person_info_avatar_section.dart';
import 'package:bite_food_delivery/features/profile/sections/person_info_details_section.dart';
import 'package:bite_food_delivery/features/profile/sections/person_info_header_section.dart';
import 'package:material_ui/material_ui.dart';

class PersonInfoScreen extends StatelessWidget {
  const PersonInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          key: PageStorageKey('person_info_screen'),
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            PersonInfoHeaderSection(),
            PersonInfoAvatarSection(),
            PersonInfoDetailsSection(),
          ],
        ),
      ),
    );
  }
}
