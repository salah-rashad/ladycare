import 'package:flutter/material.dart';

import '../../../../core/utils/extensions.dart';
import '../../../../global/widgets/custom_app_bar.dart';

class SalonSearchPage extends StatelessWidget {
  const SalonSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "بحث الصالونات",
        // leading: IconButton(
        //   onPressed: context.read<HomeCubit>().goToHome,
        //   icon: Assets.solarIcons.linear
        //       .closeCircle(color: context.colors.primaryText),
        // ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(130),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32.0,
                vertical: 8.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(),
                  TextFormField(),
                ].withGap(height: 8.0),
              ),
            )),
      ),
    );
  }
}
