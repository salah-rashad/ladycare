import 'package:flutter/material.dart';

import '../../core/constants/failure_messages.dart';
import '../../core/gen/assets.gen.dart';
import '../../core/utils/extensions.dart';

class NoInternetView extends StatelessWidget {
  const NoInternetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints.loose(const Size.square(240)),
              child: Assets.lottie.noInternetError3.lottie(fit: BoxFit.contain),
            ),
            Text(
              FailureMessages.no_internet_connection,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge,
            ),
            // const SizedBox(
            //   height: 64.0,
            // ),
            // CustomFilledButton(
            //   text: "حسناً",
            //   onPressed: context.pop,
            //   background: context.palette.surface,
            // )
          ],
        ),
      ),
    );
  }
}

Future<void> showNoInternetDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        surfaceTintColor: context.colors.background,
        backgroundColor: context.colors.background,
        child: const NoInternetView(),
      );
    },
  );
}
