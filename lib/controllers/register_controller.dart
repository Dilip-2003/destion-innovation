import 'package:get/get.dart';

class RegistrationController extends GetxController {
  var email = ''.obs;
  var fullName = ''.obs;
  var phone = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;
  var postalCode = ''.obs;
  var referralCode = ''.obs;

  var isEmailValid = true.obs;
  var isFullNameValid = true.obs;
  var isPhoneValid = true.obs;
  var isPasswordValid = true.obs;
  var isConfirmPasswordValid = true.obs;
  var isPostalCodeValid = true.obs;

  // Variables to manage password visibility
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  void validateEmail(String value) {
    isEmailValid.value = GetUtils.isEmail(value);
    email.value = value;
  }

  void validateFullName(String value) {
    isFullNameValid.value = value.isNotEmpty;
    fullName.value = value;
  }

  void validatePhone(String value) {
    isPhoneValid.value = GetUtils.isPhoneNumber(value);
    phone.value = value;
  }

  void validatePassword(String value) {
    isPasswordValid.value = value.length >= 6;
    password.value = value;
  }

  void validateConfirmPassword(String value) {
    isConfirmPasswordValid.value = value == password.value;
    confirmPassword.value = value;
  }

  void validatePostalCode(String value) {
    isPostalCodeValid.value =
        value.isNotEmpty; // Add postal code pattern if needed
    postalCode.value = value;
  }

  // Toggle visibility of password fields
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  // Validate all fields at once when Sign-Up button is clicked
  void validateAllFields() {
    validateEmail(email.value);
    validateFullName(fullName.value);
    validatePhone(phone.value);
    validatePassword(password.value);
    validateConfirmPassword(confirmPassword.value);
    validatePostalCode(postalCode.value);
  }
}
