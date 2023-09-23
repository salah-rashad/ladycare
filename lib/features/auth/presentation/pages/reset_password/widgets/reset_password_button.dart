import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/enums/icon_alignment.dart';
import '../../../../../../core/gen/assets.gen.dart';
import '../../../../../../core/utils/extensions.dart';
import '../../../../../../global/widgets/buttons/custom_elevated_button.dart';
import '../cubit/reset_password_cubit.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      builder: (context, state) {
        if (state is ResetPasswordLoading) {
          return CircularProgressIndicator(
            color: context.colors.primary,
          );
        } else {
          return CustomElevatedButton.icon(
            onPressed: () {
              context.read<ResetPasswordCubit>().resetPassword();
            },
            icon: Assets.solarIcons.boldDuotone.roundArrowLeft,
            text: "المتابعة",
            iconAlignment: IconAlignment.left,
          );
        }
      },
    );
  }
}
