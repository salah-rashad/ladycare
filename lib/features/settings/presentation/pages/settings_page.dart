import 'package:flutter/material.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../global/blocs/theme_mode_cubit/theme_mode_cubit.dart';
import '../../../../global/widgets/buttons/custom_elevated_button.dart';
import '../../../../global/widgets/custom_app_bar.dart';
import '../../../../injection_container.dart';
import '../../../auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import '../../../home/presentation/bloc/home_cubit/home_cubit.dart';
import '../widgets/settings_tile.dart';
import '../widgets/theme_mode_setting_dialog.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = sl<ThemeModeCubit>();

    return Scaffold(
      appBar: const CustomAppBar(
        title: "الإعدادات",
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SettingsTile(
            onPressed: () {},
            title: "تعديل بيانات الإتصال",
            icon: Assets.solarIcons.boldDuotone.userId,
          ),
          SettingsTile(
            onPressed: () {},
            title: "تغيير الصورة الشخصية",
            icon: Assets.solarIcons.boldDuotone.userCircle,
          ),
          SettingsTile(
            onPressed: () {},
            title: "تغيير كلمة المرور",
            icon: Assets.solarIcons.boldDuotone.lockPassword,
          ),
          // SettingsTile(
          //   onPressed: () {},
          //   title: "كوبونات الخصم",
          //   icon: Assets.solarIcons.boldDuotone.ticketSale,
          // ),
          SettingsTile(
            onPressed: () {},
            title: "توصيل الحساب بـ Google",
            icon: Assets.solarIcons.boldDuotone.google,
          ),
          SettingsTile(
            onPressed: () => selectThemeMode(context),
            title: "تغيير المظهر",
            icon: Assets.solarIcons.boldDuotone.paintRoller,
            subtitle: themeMode.currentModeName,
          ),
          _divider(context),
          SettingsTile(
            onPressed: () {},
            title: "كيفية الاستخدام",
            icon: Assets.solarIcons.boldDuotone.lightbulbMinimalistic,
          ),
          SettingsTile(
            onPressed: () {},
            title: "مركز المساعدة",
            icon: Assets.solarIcons.boldDuotone.mailbox,
          ),
          SettingsTile(
            onPressed: () {},
            title: "حذف الحساب",
            icon: Assets.solarIcons.boldDuotone.trashBinTrash,
          ),
          _divider(context),
          SettingsTile(
            onPressed: () {},
            title: "سياسة الخصوصية",
            icon: Assets.solarIcons.boldDuotone.clipboard,
          ),
          SettingsTile(
            onPressed: () {},
            title: "شروط الإستخدام",
            icon: Assets.solarIcons.boldDuotone.infoCircle,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomElevatedButton.icon(
              onPressed: () async {
                await sl<AuthCubit>().logout();
                sl<HomeCubit>().setSelected(0);
              },
              text: "تسجيل الخروج",
              icon: Assets.solarIcons.boldDuotone.exit,
              background: context.colors.error,
            ),
          )
        ],
      ),
    );
  }

  Widget _divider(BuildContext context) {
    return Divider(
      thickness: 1,
      height: 32.0,
      indent: 32.0,
      endIndent: 32.0,
      color: context.colors.primaryText.withOpacity(0.1),
    );
  }

  void selectThemeMode(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const ThemeModeSettingDialog(),
    );
  }
}
