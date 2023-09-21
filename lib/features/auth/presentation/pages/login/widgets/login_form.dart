import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/gen/assets.gen.dart';
import '../../../../../../core/utils/extensions.dart';
import '../../../../../../shared/widgets/custom_text_field.dart';
import '../../../bloc/password_visibility_cubit/passowrd_visibility_cubit.dart';
import '../cubit/login_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Form(
      key: cubit.formKey,
      child: AutofillGroup(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _emailTextField(context),
            _passwordTextField(context),
          ].withGap(height: 16.0),
        ),
      ),
    );
  }

  Widget _emailTextField(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return CustomTextField(
      controller: cubit.emailController,
      prefixIcon: Assets.solarIcons.broken.mentionCircle,
      labelText: "البريد الإلكتروني",
      textDirection: TextDirection.ltr,
      autofillHints: const [AutofillHints.email],
      autoCorrect: false,
      validator: cubit.emailValidator,
    );
  }

  Widget _passwordTextField(BuildContext context) {
    return BlocProvider(
      create: (context) => PassowrdVisibilityCubit(),
      child: BlocBuilder<PassowrdVisibilityCubit, PassowrdVisibilityState>(
        builder: (context, state) {
          final signupCubit = context.read<LoginCubit>();
          final visibility = context.read<PassowrdVisibilityCubit>();

          bool isObsecure = state is PasswordInvisible;

          return CustomTextField(
            controller: signupCubit.passwordController,
            obsecureText: isObsecure,
            prefixIcon: Assets.solarIcons.broken.lockPassword,
            labelText: "كلمة المرور",
            textDirection: TextDirection.ltr,
            autofillHints: const [AutofillHints.password],
            validator: signupCubit.passwordValidator,
            suffixIcon: isObsecure
                ? Assets.solarIcons.bold.eye
                : Assets.solarIcons.bold.eyeClosed,
            onSuffixIconPressed: visibility.toggle,
          );
        },
      ),
    );
  }
}
