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
