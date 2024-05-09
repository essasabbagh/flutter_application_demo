// import 'package:dars_app/configs/constants/regex.dart';
// import 'package:dars_app/generated/l10n.dart';

// String? passwordValidator(String? val) {
//   if (val == null || val.isEmpty) {
//     return S.current.passwordRequired;
//   }
//   if (val.length < 8) {
//     return S.current.passwordTooShort;
//   }

//   /// Check for lowercase
//   if (!val.contains(lowerCaseRegex)) {
//     return S.current.passwordLowerCaseRequired;
//   }

//   /// Check for uppercase
//   if (!val.contains(upperCaseRegex)) {
//     return S.current.passwordUpperCaseRequired;
//   }

//   /// Check for a number
//   if (!val.contains(numberRegex)) {
//     return S.current.passwordNumberRequired;
//   }

//   /// Check for special characters
//   if (!val.contains(specialCharRegex)) {
//     return S.current.passwordCharsRequired;
//   }
//   return null;
// }
