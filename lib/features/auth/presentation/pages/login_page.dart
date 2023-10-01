import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/enums/icon_alignment.dart';
import '../../../../core/gen/assets.gen.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../global/blocs/theme_mode_cubit/theme_mode_cubit.dart';
import '../../../../global/widgets/buttons/custom_text_button.dart';
import '../../../../global/widgets/flexible_page.dart';
import '../../../../injection_container.dart';
import '../bloc/login_cubit/login_cubit.dart';
import '../widgets/form_errors_list.dart';
import '../widgets/lady_care_logo_full.dart';
import '../widgets/login/login_button.dart';
import '../widgets/login/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => LoginCubit(sl()),
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSucceed) {
              context.replaceNamed(Routes.HOME.name);
            }
          },
          child: _build(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final theme = sl<ThemeModeCubit>();
          theme.toggle();
        },
      ),
    );
  }

  Widget _build(BuildContext context) {
    return FlexiblePage(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          const LadyCareLogoFull(),
          FormErrorsList<LoginCubit, LoginState, LoginFailed>(
            messages: (state) => [state.message],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const LoginForm(),
                  CustomTextButton(
                    onPressed: () {
                      context.goNamed(Routes.RESET_PASSWORD.name);
                    },
                    text: "إسترجاع كلمة المرور",
                  )
                ].withGap(height: 16.0),
              ),
            ),
          ),
          const LoginButton(),
          CustomTextButton.icon(
            onPressed: () {
              context.replaceNamed(Routes.SIGN_UP.name);
            },
            text: "إنشاء حساب جديد",
            icon: Assets.solarIcons.outline.arrowLeft,
            iconAlignment: IconAlignment.left,
          ),
        ].withGap(height: 16.0),
      ),
    );
  }
}
