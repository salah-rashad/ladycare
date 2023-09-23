// ignore_for_file: constant_identifier_names

import '../error/failures.dart';

class FailureMessages {
  // ~ Custom ~ //
  static const String unknown_error =
      "حدث خطأ ما، يرجى الاتصال بالدعم لمزيد من المساعدة.";
  static const String no_internet_connection =
      "لا يوجد اتصال بالإنترنت. الرجاء التحقق من اتصالك بالإنترنت والمحاولة مرة أخرى.";
  static const String logout_failed =
      "فشلت عملية تسجيل الخروج. الرجاء التحقق من اتصالك بالإنترنت والمحاولة مرة أخرى. إذا استمرت المشكلة، يرجى الاتصال بالدعم.";

  // ~ Authentication ~ //
  static const String invalid_email =
      "البريد الإلكتروني غير صالح. الرجاء التحقق من صحة البريد الإلكتروني وإعادة المحاولة.";
  static const String user_disabled =
      "تم تعطيل حساب المستخدم. يرجى الاتصال بالدعم لمزيد من المساعدة.";
  static const String user_not_found =
      "لم يتم العثور على المستخدم. الرجاء التحقق من البريد الإلكتروني أو إنشاء حساب جديد إذا لم يكن لديك حساب.";
  static const String wrong_password =
      "كلمة المرور غير صحيحة. الرجاء التحقق من كلمة المرور والمحاولة مرة أخرى.";
  static const String email_already_in_use =
      "هذا البريد الإلكتروني مستخدم بالفعل. الرجاء استخدام بريد إلكتروني آخر أو قم بتسجيل الدخول باستخدام هذا البريد الإلكتروني.";
  static const String operation_not_allowed =
      "هذه العملية غير مسموح بها. الرجاء الاتصال بالدعم للمزيد من المساعدة.";
  static const String weak_password =
      "كلمة المرور ضعيفة. الرجاء استخدام كلمة مرور أقوى تحتوي على أحرف كبيرة وصغيرة وأرقام.";

  // ~ Database ~ //
  static const String read_failed = "فشلت عملية قراءة البيانات.";
  static const String write_failed = "فشلت عملية كتابة البيانات.";
  static const String update_failed = "فشلت عملية التحديث.";
  static const String delete_failed = "فشلت عملية الحذف.";
  static const String database_error =
      "حدث خطأ في قاعدة البيانات. الرجاء الاتصال بالدعم للمزيد من المساعدة.";

  static String fromCode(String code) {
    switch (code) {
      case "invalid-email":
        return invalid_email;
      case "user-disabled":
        return user_disabled;
      case "user-not-found":
        return user_not_found;
      case "wrong-password":
        return wrong_password;
      case "email-already-in-use":
        return email_already_in_use;
      case "operation-not-allowed":
        return operation_not_allowed;
      case "weak-password":
        return weak_password;
      default:
        return unknown_error;
    }
  }

  static String from(Failure failure) {
    return switch (failure) {
      OfflineFailure() => no_internet_connection,
      AuthFailure() => failure.message,
      DatabaseReadFailure() => read_failed,
      DatabaseWriteFailure() => write_failed,
      DatabaseUpdateFailure() => update_failed,
      DatabaseDeleteFailure() => delete_failed,
      UnknownFailure() => unknown_error,
    };
  }
}



/* class ArabicExceptionMessages extends ExceptionMessages {
  @override
  String get unknown_error =>
      "حدث خطأ ما، يرجى الاتصال بالدعم لمزيد من المساعدة.";

  @override
  String get invalid_email =>
      "البريد الإلكتروني غير صالح. الرجاء التحقق من صحة البريد الإلكتروني وإعادة المحاولة.";

  @override
  String get user_disabled =>
      "تم تعطيل حساب المستخدم. يرجى الاتصال بالدعم لمزيد من المساعدة.";

  @override
  String get user_not_found =>
      "لم يتم العثور على المستخدم. الرجاء التحقق من البريد الإلكتروني أو إنشاء حساب جديد إذا لم يكن لديك حساب.";

  @override
  String get wrong_password =>
      "كلمة المرور غير صحيحة. الرجاء التحقق من كلمة المرور والمحاولة مرة أخرى.";
}
 */
