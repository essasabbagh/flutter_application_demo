final RegExp emailRegEx = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final RegExp numRegEx = RegExp(r'.*[0-9].*');
final RegExp letterRegEx = RegExp(r'.*[A-Za-z].*');
final RegExp lowercaseregEx = RegExp(r'.*[a-z].*');
final RegExp uppercaseRegEx = RegExp(r'.*[A-Z].*');
final RegExp nonAlphanumericRegEx = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

final RegExp userNameRegEx = RegExp(r'^(?=.*[a-z])[A-Za-z ]{2,}$');
final RegExp companyNameRegEx = RegExp(r'^[a-zA-Z][a-zA-Z0-9\-]*$');
final passwordRegEx = RegExp(r'^[A-Za-z\d@$!%*?&]{8,}$');
