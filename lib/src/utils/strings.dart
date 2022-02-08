String normalizePhoneNumber(String phoneNumber) {
  if (!phoneNumber.startsWith("+")) {
    phoneNumber = "+$phoneNumber";
  }

  phoneNumber.replaceAll("-", "");
  phoneNumber.replaceAll(" ", "");

  return phoneNumber;
}
