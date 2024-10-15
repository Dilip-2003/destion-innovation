import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.jpg', // Replace with your actual image asset
              fit: BoxFit.cover,
            ),
          ),
          // Main content
          SingleChildScrollView(
            // Added SingleChildScrollView for better usability on small screens
            child: Container(
              height: Get.height,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo and slogan
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/logo.jpg', // Replace with your actual logo asset
                        height: 100,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Shop Smart, Save Big on Groceries!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: Get.height * 0.1,
                  // ),
                  // Login form card
                  Card(
                    color: Colors.white.withOpacity(0.9),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Email field
                          TextField(
                            controller: controller.emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon: const Icon(Icons.email),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Password field
                          Obx(
                            () => TextField(
                              controller: controller.passwordController,
                              obscureText: !controller.isPasswordVisible.value,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    controller.isPasswordVisible.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed:
                                      controller.togglePasswordVisibility,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Login button with loading state
                          Obx(
                            () => ElevatedButton(
                              onPressed: controller.isLoading.value
                                  ? null // Disable button while loading
                                  : controller.login,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[700],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: controller.isLoading.value
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : const Text(
                                      'Login',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),
                          // Forgot Password button
                          TextButton(
                            onPressed: controller.forgotPassword,
                            child: const Text('Forgot Password?'),
                          ),
                          const SizedBox(height: 10),
                          // Register option
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account? "),
                              GestureDetector(
                                onTap: controller.register,
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                    color: Colors.green[700],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
