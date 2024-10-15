import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';

class ProductCard extends StatelessWidget {
  final ProductItem product;
  final ProductController productController = Get.find<ProductController>();

  ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // Get the screen height
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate a suitable height for the image based on the screen height
    final imageHeight =
        screenHeight * 0.15; // 25% of the screen height, adjust as needed

    return InkWell(
      onTap: () {
        Get.snackbar('product id ${product.id}', 'the product card pressed',
            duration: const Duration(
              seconds: 1,
            ));
        print('product details open');
      },
      child: Card(
        elevation: 0.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0)),
              child: Image.asset(
                product.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: imageHeight, // Use the calculated height
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (product.isDiscountAvailable)
                            Text(
                              "\$${product.price}",
                              style: const TextStyle(
                                color: Colors.teal,
                                decoration: TextDecoration.lineThrough,
                                fontSize: 12,
                              ),
                            ),
                          Text(
                            "\$${(product.isDiscountAvailable ? (product.price * (1 - (product.discountPrice / 100))) : product.price).toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.teal,
                            ),
                          ),
                        ],
                      ),
                      Obx(() {
                        // Observe the favorite state and update the icon accordingly
                        return IconButton(
                          onPressed: () {
                            productController.toggleFavoriteStatus(product.id);
                            productController.isFavorite(product.id)
                                ? Get.snackbar(
                                    'product id ${product.id}',
                                    'the item is marked as favourite',
                                    duration: const Duration(
                                      seconds: 1,
                                    ),
                                  )
                                : Get.snackbar(
                                    'product id ${product.id}',
                                    'the item is removed from favourite',
                                    duration: const Duration(
                                      seconds: 1,
                                    ),
                                  );
                          },
                          icon: Icon(
                            productController.isFavorite(product.id)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.teal,
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
