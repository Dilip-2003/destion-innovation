import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/controllers/product_controller.dart';
import 'package:grocery_app/widgets/product_card.dart';

class ProductPage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "All Products",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Obx(() {
        // Using Obx to reactively rebuild the widget when products change
        if (productController.products.isEmpty) {
          return const Center(
              child:
                  CircularProgressIndicator()); // Show loading spinner if no products
        }
        return GridView.builder(
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of products per row
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.8, // Adjust this for product card size
          ),
          itemCount: productController.products.length,
          itemBuilder: (context, index) {
            final product = productController.products[index];
            return ProductCard(product: product);
          },
        );
      }),
    );
  }
}
