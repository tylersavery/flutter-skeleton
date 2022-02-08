bool isValidEmail(String email) {
  return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
      .hasMatch(email);
}

bool isValidUrl(String url) {
  var urlPattern =
      r"^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$";
  return RegExp(urlPattern, caseSensitive: false).hasMatch(url);
}

bool isValidUsername(String username) {
  // 3 - 20 characters (alpha numberic + hyphen and underbar)
  return RegExp(r'^(?!\s*$)[a-zA-Z0-9_-]{3,20}$').hasMatch(username);
}

bool isValidPassword(String password) {
  return password.length > 7;

  // 8+ chars, number, symbol, 1 uppercase

  // return RegExp(
  //         r'^(?=[^A-Z\n]*[A-Z])(?=[^a-z\n]*[a-z])(?=[^0-9\n]*[0-9])(?=[^#?!@$%^&*\n-]*[#?!@$%^&*-]).{8,}$')
  //     .hasMatch(password);
}

bool isValidPhoneNumber(String value) {
  String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = RegExp(patttern);
  if (!regExp.hasMatch(value)) {
    return false;
  }

  return true;
}

String? formValidatorEmail(String? value) {
  if (value == null || value.isEmpty) {
    return "Email required.";
  }
  if (!isValidEmail(value)) {
    return "Invalid email.";
  }
  return null;
}

String? formValidatorUsername(String? value) {
  if (value == null || value.isEmpty) {
    return "Username required.";
  }

  if (!isValidUsername(value)) {
    return "Username not valid.";
  }

  return null;
}

String? formValidatorPhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return "Phone Number required.";
  }
  if (!isValidPhoneNumber(value)) {
    return "Invalid Phone Number.";
  }
  return null;
}

String? formValidatorPassword(String? value) {
  if (value == null || value.isEmpty) {
    return "Password required.";
  }

  if (!isValidPassword(value)) {
    return "Password not strong enough.";
  }

  return null;
}

String? formValidatorNotEmpty(String? value, String label) {
  if (value == null || value.isEmpty) {
    return "$label is required.";
  }

  return null;
}
