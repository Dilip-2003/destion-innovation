import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/controllers/register_controller.dart';

class RegistrationPage extends StatelessWidget {
  final RegistrationController controller = Get.put(RegistrationController());
  RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.jpg', // Replace with your logo path
                    height: 80,
                  ),
                  const Text(
                    '!DealMart',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome to !DealMart',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                      endIndent: 8,
                    ),
                  ),
                  Text(
                    'Create an Account',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                      indent: 8,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildTextField(
                label: 'Email',
                hint: 'Enter your email',
                icon: Icons.email,
                onChanged: controller.validateEmail,
                isValid: controller.isEmailValid,
              ),
              _buildTextField(
                label: 'Full Name',
                hint: 'Enter your full name',
                icon: Icons.person,
                onChanged: controller.validateFullName,
                isValid: controller.isFullNameValid,
              ),
              _buildTextField(
                label: 'Phone',
                hint: 'Enter your phone number',
                icon: Icons.phone,
                onChanged: controller.validatePhone,
                isValid: controller.isPhoneValid,
              ),
              _buildTextField(
                label: 'Password',
                hint: 'Enter your password',
                icon: Icons.lock,
                onChanged: controller.validatePassword,
                isValid: controller.isPasswordValid,
                isObscure: true,
                isPasswordField: true,
              ),
              _buildTextField(
                label: 'Retype Password',
                hint: 'Re-enter your password',
                icon: Icons.lock,
                onChanged: controller.validateConfirmPassword,
                isValid: controller.isConfirmPasswordValid,
                isObscure: true,
                isPasswordField: true,
                isConfirmPassword: true,
              ),
              _buildTextField(
                label: 'Postal Code',
                hint: 'Enter your postal code',
                icon: Icons.location_on,
                onChanged: controller.validatePostalCode,
                isValid: controller.isPostalCodeValid,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: Get.width * 0.9,
                height: Get.height * 0.06,
                child: ElevatedButton(
                  onPressed: () {
                    controller.validateAllFields();

                    // Check if all fields are valid before navigating
                    if (controller.isEmailValid.value &&
                        controller.isFullNameValid.value &&
                        controller.isPhoneValid.value &&
                        controller.isPasswordValid.value &&
                        controller.isConfirmPasswordValid.value &&
                        controller.isPostalCodeValid.value) {
                      // Get.toNamed('/products');
                      Get.offNamed('/products');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: const TextStyle(color: Colors.black54),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Login',
                        style: const TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed('/login');
                          },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: 'By continuing, you agree to our ',
                  style: TextStyle(color: Colors.black54),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Terms of Service ',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: 'and '),
                    TextSpan(
                      text: 'Privacy Policy.',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required IconData icon,
    required Function(String) onChanged,
    required RxBool isValid,
    bool isObscure = false,
    bool isPasswordField = false,
    bool isConfirmPassword = false,
    bool isOptional = false,
  }) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label ${isOptional ? '' : '*'}',
            style: TextStyle(
              color: isValid.value ? Colors.black : Colors.red,
            ),
          ),
          TextField(
            onChanged: onChanged,
            obscureText: isPasswordField
                ? (isConfirmPassword
                    ? !controller.isConfirmPasswordVisible.value
                    : !controller.isPasswordVisible.value)
                : isObscure,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              prefixIcon: Icon(icon),
              suffixIcon: isPasswordField
                  ? IconButton(
                      onPressed: isConfirmPassword
                          ? controller.toggleConfirmPasswordVisibility
                          : controller.togglePasswordVisibility,
                      icon: Icon(
                        (isConfirmPassword
                                ? controller.isConfirmPasswordVisible.value
                                : controller.isPasswordVisible.value)
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    )
                  : null,
              hintText: hint,
              errorText: isValid.value ? null : 'Invalid $label',
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
