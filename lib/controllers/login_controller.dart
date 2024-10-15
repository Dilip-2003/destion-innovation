import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:validators/validators.dart'; // For email validation

class LoginController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isPasswordVisible = false.obs;
  var isLoading = false.obs;

  // Toggles the password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Validates the email and password before login
  bool validateFields() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty) {
      Get.snackbar(
        'Error', 'Email cannot be empty',
        // duration: const Duration(
        //   microseconds: 500,
        // )
      );
      return false;
    }
    if (!isEmail(email)) {
      Get.snackbar('Error', 'Please enter a valid email');
      return false;
    }
    if (password.isEmpty) {
      Get.snackbar('Error', 'Password cannot be empty');
      return false;
    }
    if (password.length < 6) {
      Get.snackbar('Error', 'Password must be at least 6 characters long');
      return false;
    }
    return true;
  }

  // Simulates the login process
  void login() {
    if (validateFields()) {
      isLoading.value = true;

      // Simulate login delay (API call)
      Future.delayed(const Duration(seconds: 1), () {
        isLoading.value = false;
        // Get.snackbar('Success', 'Logged in successfully');

        // Navigate to the product page
        Get.offAllNamed('/products');
        // Get.toNamed('/products');
      });
    }
  }

  // Forgot password functionality
  void forgotPassword() {
    String email = emailController.text.trim();
    if (email.isEmpty || !isEmail(email)) {
      Get.snackbar('Error', 'Please enter a valid email for password reset');
    } else {
      // Implement forgot password logic here (API call or redirection)
      Get.snackbar('Info', 'Password reset link sent to $email');
      print('Forgot Password for Email: $email');
    }
  }

  // Navigate to the register screen
  void register() {
    Get.toNamed('/register');
    print('Navigating to Register Screen');
  }

  // Dispose controllers when not needed
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
