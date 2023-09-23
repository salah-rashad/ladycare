// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../../injection_container.dart';
// import '../../../../../shared/widgets/no_internet_view.dart';
// import '../../../../home/presentation/pages/home_page.dart';
// import '../login/login_page.dart';
// import 'auth_cubit/auth_cubit.dart';

// class RootPage extends StatelessWidget {
//   const RootPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider.value(
//       value: sl<AuthCubit>(),
//       child: BlocConsumer<AuthCubit, AuthState>(
//         listener: (context, state) {
//           if (state is OfflineState) {
//             showNoInternetDialog(context);
//           }
//         },
//         builder: (context, state) {
//           if (state is Authenticated) {
//             return const HomePage();
//           } else {
//             return const LoginPage();
//           }
//         },
//       ),
//     );
//   }
// }
