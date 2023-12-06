// ignore_for_file: constant_identifier_names

enum Routes {
  HOME("/"),
  LOGIN("/auth/login"),
  SIGN_UP("/auth/sign_up"),
  RESET_PASSWORD("reset_password"),
  SALON_PROFILE("/salon_profile");

  final String path;
  const Routes(this.path);

  static Routes get initial => HOME;
}
