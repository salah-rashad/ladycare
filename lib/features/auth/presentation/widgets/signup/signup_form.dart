import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/gen/assets.gen.dart';
import '../../../../../../core/utils/extensions.dart';
import '../../../../../../global/widgets/custom_text_field.dart';
import '../../bloc/password_visibility_cubit/passowrd_visibility_cubit.dart';
import '../../bloc/signup_cubit/signup_cubit.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();

    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          _nameFields(context),
          _emailField(context),
          _passwordTextFields(context),
          _phoneNumberField(context),
          _dateOfBirthField(context),
        ].withGap(height: 16.0),
      ),
    );
  }

  Widget _nameFields(BuildContext context) {
    final cubit = context.read<SignupCubit>();

    return AutofillGroup(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: CustomTextField(
              labelText: "الاسم",
              controller: cubit.firstNameController,
              validator: cubit.nameValidator,
              prefixIcon: Assets.solarIcons.broken.user,
              autofillHints: const [AutofillHints.givenName],
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
            ),
          ),
          Flexible(
            child: CustomTextField(
              labelText: "اسم العائلة",
              controller: cubit.lastNameController,
              validator: cubit.nameValidator,
              prefixIcon: Assets.solarIcons.broken.user,
              autofillHints: const [AutofillHints.familyName],
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
            ),
          ),
        ].withGap(width: 16.0),
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    final cubit = context.read<SignupCubit>();

    return CustomTextField(
      autoCorrect: false,
      labelText: "البريد الإلكتروني",
      controller: cubit.emailController,
      validator: cubit.emailValidator,
      prefixIcon: Assets.solarIcons.broken.mentionCircle,
      textDirection: TextDirection.ltr,
      autofillHints: const [AutofillHints.email],
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }

  Widget _passwordTextFields(BuildContext context) {
    return BlocProvider(
      create: (context) => PassowrdVisibilityCubit(),
      child: BlocBuilder<PassowrdVisibilityCubit, PassowrdVisibilityState>(
        builder: (context, state) {
          final signup = context.read<SignupCubit>();
          final visibility = context.read<PassowrdVisibilityCubit>();

          bool isObsecure = state is PasswordInvisible;

          return Column(
            children: [
              CustomTextField(
                autoCorrect: false,
                labelText: "كلمة المرور",
                obsecureText: isObsecure,
                controller: signup.passwordController,
                validator: signup.passwordValidator,
                textDirection: TextDirection.ltr,
                autofillHints: const [AutofillHints.newPassword],
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: Assets.solarIcons.broken.lockPassword,
                suffixIcon: isObsecure
                    ? Assets.solarIcons.lineDuotone.eye
                    : Assets.solarIcons.lineDuotone.eyeClosed,
                onSuffixIconPressed: visibility.toggle,
                textInputAction: TextInputAction.next,
              ),
              CustomTextField(
                autoCorrect: false,
                labelText: "تأكيد كلمة المرور",
                obsecureText: isObsecure,
                controller: signup.passwordConfirmController,
                validator: signup.passwordConfirmValidator,
                textDirection: TextDirection.ltr,
                autofillHints: const [AutofillHints.newPassword],
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: Assets.solarIcons.broken.lockPassword,
                suffixIcon: isObsecure
                    ? Assets.solarIcons.lineDuotone.eye
                    : Assets.solarIcons.lineDuotone.eyeClosed,
                onSuffixIconPressed: visibility.toggle,
                textInputAction: TextInputAction.next,
              ),
            ].withGap(height: 16.0),
          );
        },
      ),
    );
  }

  Widget _phoneNumberField(BuildContext context) {
    final cubit = context.read<SignupCubit>();

    return CustomTextField(
      labelText: "رقم الجوال",
      controller: cubit.phoneNumberController,
      validator: cubit.phoneNumberValidator,
      textDirection: TextDirection.ltr,
      autofillHints: const [AutofillHints.telephoneNumber],
      keyboardType: TextInputType.phone,
      prefixIcon: Assets.solarIcons.broken.phone,
      inputFormatters: [
        PhoneInputFormatter(
          defaultCountryCode: Constants.saudiArabiaCountryCode,
          allowEndlessPhone: false,
        )
      ],
      suffix: Text(
        "${cubit.phoneCountryCode}  ",
        textDirection: TextDirection.ltr,
      ),
      textInputAction: TextInputAction.next,
    );
  }

  Widget _dateOfBirthField(BuildContext context) {
    final cubit = context.read<SignupCubit>();

    return CustomTextField(
      onTap: () => _openDatePicker(context),
      enabled: false,
      labelText: "تاريخ الميلاد",
      controller: cubit.dateOfBirthController,
      prefixIcon: Assets.solarIcons.broken.calendarMark,
      textInputAction: TextInputAction.next,
    );
  }

  Future<void> _openDatePicker(BuildContext context) async {
    final cubit = context.read<SignupCubit>();

    const audienceTargetAge = 30;
    const minAge = 13;
    const maxAge = 100;

    final selectedDate = await showDatePicker(
      context: context,
      initialDate: cubit.dateOfBirth ??
          DateTime(DateTime.now().year - audienceTargetAge),
      firstDate: DateTime(DateTime.now().year - maxAge),
      lastDate: DateTime(DateTime.now().year - minAge),
    );

    if (selectedDate != null) {
      cubit.dateOfBirth = selectedDate;
      final dateFormat =
          intl.DateFormat.yMMMMEEEEd(Constants.defaultLocaleString);
      cubit.dateOfBirthController.text = dateFormat.format(selectedDate);
    }
  }
}
