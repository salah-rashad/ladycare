import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../global/blocs/theme_mode_cubit/theme_mode_cubit.dart';
import '../../../../injection_container.dart';

class ThemeModeSettingDialog extends StatelessWidget {
  const ThemeModeSettingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final themeModeCubit = sl<ThemeModeCubit>();
    final iconColor = context.colors.tertiaryText;
    final selectedIconColor = context.colors.primaryText;
    final systemSelected = themeModeCubit.state.mode == ThemeMode.system;
    final lightSelected = themeModeCubit.state.mode == ThemeMode.light;
    final darkSelected = themeModeCubit.state.mode == ThemeMode.dark;
    return Dialog(
      clipBehavior: Clip.hardEdge,
      backgroundColor: context.colors.container,
      surfaceTintColor: context.colors.container,
      child: ListTileTheme(
        data: ListTileThemeData(
          textColor: context.colors.tertiaryText,
          selectedColor: context.colors.primaryText,
          selectedTileColor: context.colors.container,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () =>
                  applyTheme(context, themeModeCubit, ThemeMode.system),
              selected: systemSelected,
              leading: Assets.solarIcons.boldDuotone.starsMinimalistic(
                color: systemSelected ? selectedIconColor : iconColor,
              ),
              title: const Text("النظام"),
            ),
            ListTile(
              onTap: () => applyTheme(context, themeModeCubit, ThemeMode.light),
              selected: lightSelected,
              leading: Assets.solarIcons.bold.sun(
                color: lightSelected ? selectedIconColor : iconColor,
              ),
              title: const Text("فاتح"),
            ),
            ListTile(
              onTap: () => applyTheme(context, themeModeCubit, ThemeMode.dark),
              selected: darkSelected,
              leading: Assets.solarIcons.bold.moon(
                color: darkSelected ? selectedIconColor : iconColor,
              ),
              title: const Text("داكن"),
            ),
          ],
        ),
      ),
    );
  }

  void applyTheme(
    BuildContext context,
    ThemeModeCubit cubit,
    ThemeMode mode,
  ) async {
    context.pop();
    await Future.delayed(const Duration(milliseconds: 150));
    cubit.setThemeMode(mode);
  }
}
