// import 'dart:developer' as dev;

// /// Prints a custom color message in the debug console.
// /// <br><br>
// /// Usage: `Logger.red.log(name: "Error", data: "An Error Occured!");`<br>
// /// Output: "\[Error\] An Error Occured!" (in red text)
// enum Logger {
//   black('30'),
//   red('31'),
//   green('32'),
//   yellow('33'),
//   blue('34'),
//   magenta('35'),
//   cyan('36'),
//   white('37');

//   final String _code;
//   const Logger(this._code);

//   void log({
//     String name = 'Logger',
//     dynamic data,
//     Object? error,
//     StackTrace? stackTrace,
//   }) =>
//       dev.log(
//         _(data),
//         name: name,
//         error: error != null ? _(error) : null,
//         time: DateTime.now(),
//         stackTrace: stackTrace,
//       );

//   String _(obj) => '\x1B[${_code}m$obj\x1B[0m';
// }
