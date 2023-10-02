import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/gen/assets.gen.dart';
import '../../../../../../core/utils/extensions.dart';
import '../../../../../core/utils/custom_input_decoration.dart';
import '../../bloc/login_cubit/login_cubit.dart';
import '../../bloc/password_visibility_cubit/passowrd_visibility_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Form(
      key: cubit.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
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

    return TextFormField(
      decoration: CustomInputDecoration(
        labelText: "البريد الإلكتروني",
        prefixIcon: Assets.solarIcons.broken.mentionCircle,
        // fillColor: Colors.white,
      ),
      autocorrect: false,
      controller: cubit.emailController,
      textDirection: TextDirection.ltr,
      autofillHints: const [AutofillHints.email],
      keyboardType: TextInputType.emailAddress,
      validator: cubit.emailValidator,
      textInputAction: TextInputAction.next,
    );
  }

  Widget _passwordTextField(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return BlocProvider(
      create: (context) => PassowrdVisibilityCubit(),
      child: BlocBuilder<PassowrdVisibilityCubit, PassowrdVisibilityState>(
        builder: (context, state) {
          final signupCubit = context.read<LoginCubit>();
          final visibility = context.read<PassowrdVisibilityCubit>();

          bool isObsecure = state is PasswordInvisible;

          return TextFormField(
            decoration: CustomInputDecoration(
              labelText: "كلمة المرور",
              prefixIcon: Assets.solarIcons.broken.lockPassword,
              suffixIcon: isObsecure
                  ? Assets.solarIcons.lineDuotone.eye
                  : Assets.solarIcons.lineDuotone.eyeClosed,
              onSuffixIconPressed: visibility.toggle,
            ),
            controller: signupCubit.passwordController,
            obscureText: isObsecure,
            keyboardType: TextInputType.visiblePassword,
            textDirection: TextDirection.ltr,
            autofillHints: const [AutofillHints.password],
            validator: signupCubit.passwordValidator,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (value) {
              cubit.login();
            },
          );
        },
      ),
    );
  }
}
