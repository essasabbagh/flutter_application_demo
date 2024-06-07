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

/// Validates a password based on certain criteria.
///
/// This function checks if the given password meets the following requirements:
/// - It is not null or empty.
/// - It is at least 8 characters long.
/// - It contains at least one number.
/// - It contains at least one letter.
/// - It contains at least one capital letter.
/// - It contains at least one number and letter.
///
/// @param val The password to be validated.
/// @return A [String] message indicating the validation result. If the password is valid, it returns `null`.
String? passwordValidator(String? val) {
  if (val == null || val.isEmpty) {
    return 'Password cannot be empty';
  }

  if (val.length < 8) {
    return 'Password must be at least 8 characters long';
  }

  if (!val.contains(RegExp(r'\d'))) {
    return 'Password must contain at least one number';
  }

  // Add more validation rules as needed
  if (!val.contains(RegExp(r'[a-zA-Z]'))) {
    return 'Password must contain at least one letter';
  }
  if (!val.contains(RegExp(r'[A-Z]'))) {
    return 'Password must contain at least one capital letter';
  }
  if (!val.contains(RegExp(r'[a-zA-Z0-9]'))) {
    return 'Password must contain at least one number and letter';
  }

  return null; // Return null if validation passes
}
