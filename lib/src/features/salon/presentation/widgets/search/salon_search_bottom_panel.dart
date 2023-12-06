import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/config/env.dart';
import '../../../../../core/gen/assets.gen.dart';
import '../../../../../core/utils/custom_input_decoration.dart';
import '../../../../../core/utils/extensions.dart';
import '../../bloc/salon_search_cubit/salon_search_cubit.dart';

class SalonSearchBottomPanel extends StatelessWidget {
  const SalonSearchBottomPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final searchCubit = sl<SalonSearchCubit>();

    return BlocBuilder<SalonSearchCubit, SalonSearchState>(
      bloc: searchCubit,
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _nameField(context),
              _locationField(context),
            ].withGap(height: 8.0),
          ),
        );
      },
    );
  }

  Widget _nameField(BuildContext context) {
    return TextFormField(
      decoration: CustomInputDecoration(
        // labelText: "بحث",
        hintText: "اسم الصالون ...",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Assets.solarIcons.broken.shop2,
        fillColor: context.colors.container,
      ).applyTint(context, tint: context.colors.accent2),
    );
  }

  Widget _locationField(BuildContext context) {
    return TextFormField(
      decoration: CustomInputDecoration(
        labelText: "الموقع الجغرافي",
        prefixIcon: Assets.solarIcons.broken.pointOnMap,
        suffixIcon: Assets.solarIcons.boldDuotone.gps,
        suffixIconColor: context.colors.accent2,
        fillColor: context.colors.container,
        onSuffixIconPressed: () {},
      ).applyTint(context, tint: context.colors.accent2),
    );
  }
}
