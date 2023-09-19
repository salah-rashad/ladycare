// ignore_for_file: constant_identifier_names

class AppRoute {
  final String path;
  final String name;
  final String title;

  const AppRoute({
    required this.path,
    required this.name,
    required this.title,
  });
}

class Routes {
  Routes._();
  static const AppRoute initial = HOME;

  static const AppRoute HOME =
      AppRoute(path: "/", name: "HOME", title: "الرئيسية");
  static const AppRoute LOGIN =
      AppRoute(path: "/auth/login", name: "LOGIN", title: "تسجيل الدخول");
  static const AppRoute SIGNUP =
      AppRoute(path: "/auth/signup", name: "SIGNUP", title: "إنشاء حساب جديد");
}
