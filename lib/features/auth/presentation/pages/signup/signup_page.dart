import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/enums/icon_alignment.dart';
import '../../../../../core/gen/assets.gen.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../injection_container.dart';
import '../../../../../global/widgets/buttons/custom_text_button.dart';
import '../../../../../global/widgets/flexible_page.dart';
import '../../widgets/form_errors_list.dart';
import '../../widgets/lady_care_logo_full.dart';
import 'cubit/signup_cubit.dart';
import 'widgets/signup_button.dart';
import 'widgets/signup_form.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => SignupCubit(sl()),
        child: BlocListener<SignupCubit, SignupState>(
          listener: (context, state) {
            if (state is SignupSucceed) {
              context.replaceNamed(Routes.HOME.name);
            }
          },
          child: _build(context),
        ),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return FlexiblePage(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          const LadyCareLogoFull(),
          FormErrorsList<SignupCubit, SignupState, SignupError>(
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
                  const SignupForm(),
                ].withGap(height: 16.0),
              ),
            ),
          ),
          const SignupButton(),
          CustomTextButton.icon(
            onPressed: () {
              context.replaceNamed(Routes.LOGIN.name);
            },
            text: "لدي حساب بالفعل ، تسجيل الدخول",
            icon: Assets.solarIcons.outline.arrowLeft,
            iconAlignment: IconAlignment.left,
          ),
        ].withGap(height: 16.0),
      ),
    );
  }
}
