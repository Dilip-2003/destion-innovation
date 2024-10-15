import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/controllers/carousel_controller.dart';

class CarouselViewScreen extends StatelessWidget {
  const CarouselViewScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CarouselControllers controller = Get.put(CarouselControllers());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Obx(
            () => Container(
              height: Get.height * 0.8,
              padding: EdgeInsets.only(
                top: Get.height * 0.1,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.teal,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(
                        110,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage(
                        controller.imagePaths[controller.currentIndex.value],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    controller.captions[controller.currentIndex.value],
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text(
                      controller.descriptions[controller.currentIndex.value],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        List.generate(controller.imagePaths.length, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.currentIndex.value == index
                              ? Colors.teal
                              : Colors.grey,
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: Get.height * 0.1),
                ],
              ),
            ),
          ),
          SizedBox(
            width: Get.width * 0.9,
            height: Get.height * 0.06,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed('register');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Signup',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: Get.width * 0.9,
            height: Get.height * 0.06,
            child: OutlinedButton(
              onPressed: () {
                Get.toNamed('login');
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: const BorderSide(color: Colors.teal),
              ),
              child: const Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}
