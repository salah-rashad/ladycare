import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/messages.dart';
import '../../../../../core/gen/assets.gen.dart';
import '../../../../../core/theme/colors/palette.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../injection_container.dart';
import '../../../../../shared/widgets/buttons/custom_filled_button.dart';
import '../../../../../shared/widgets/buttons/custom_text_button.dart';
import '../../../../../shared/widgets/flexible_page.dart';
import '../../widgets/form_errors_list.dart';
import 'cubit/reset_password_cubit.dart';
import 'widgets/reset_password_button.dart';
import 'widgets/reset_password_form.dart';
import '../../../../../shared/widgets/custom_alert_dialog.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => ResetPasswordCubit(sl()),
        child: BlocListener<ResetPasswordCubit, ResetPasswordState>(
          listener: (context, state) {
            if (state is ResetPasswordSucceed) {
              _showSuccessDialog(context);
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: Text(
              "إسترجاع كلمة المرور",
              style: context.textTheme.headlineMedium,
            ),
          ),
          FormErrorsList<ResetPasswordCubit, ResetPasswordState,
              ResetPasswordError>(
            messages: (state) => [state.message],
          ),
          const ResetPasswordForm(),
          const ResetPasswordButton(),
          CustomTextButton.icon(
            onPressed: () {
              context.pop();
            },
            text: "الرجوع",
            icon: Assets.solarIcons.outline.doubleAltArrowRight,
          ),
        ].withGap(height: 16.0),
      ),
    );
  }

  Future<void> _showSuccessDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return CustomAlertDialog(
          surfaceTintColor: context.palette.success,
          icon: Assets.lottie.emailSent,
          title: "تم الإرسال",
          message: Messages.resetPasswordEmailSent,
          button: CustomFilledButton.icon(
            onPressed: context.pop,
            icon: Assets.solarIcons.boldDuotone.closeSquare,
            text: "حسناً",
            background: context.palette.accent2,
            foreground: Palette.white,
          ),
        );
      },
    );
  }
}
