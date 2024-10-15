import 'dart:async';
import 'package:get/get.dart';

class CarouselControllers extends GetxController {
  var currentIndex = 0.obs;
  List<String> imagePaths = [
    'assets/images/image1.jpeg', // Replace with your image paths
    'assets/images/image2.jpeg',
    'assets/images/image3.jpeg',
  ];

  List<String> captions = [
    'Explore Deals',
    'Find Best Offers',
    'Save More',
  ];

  List<String> descriptions = [
    'Checkout list of deals available for preferred store and choose what best for you.',
    'Discover the best offers available now!',
    'Save more on your purchases with exclusive deals.',
  ];

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startCarousel();
  }

  void startCarousel() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      currentIndex.value = (currentIndex.value + 1) % imagePaths.length;
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
