import 'package:get/get.dart';

class ProductItem {
  final String title;
  final String subtitle;
  final String imageUrl;
  final double price;
  final double discountPrice;
  final bool isDiscountAvailable;
  final int id;

  ProductItem({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.price,
    required this.discountPrice,
    required this.isDiscountAvailable,
    required this.id,
  });
}

class ProductController extends GetxController {
  var products = <ProductItem>[].obs;
  var favorites = <int, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() {
    // Dummy data (replace with your API fetching logic)
    products.assignAll([
      ProductItem(
        id: 1,
        title: "Pressure Cooker - Stainless Steel",
        subtitle: "Great Indian Grocery and Kerala Store",
        imageUrl: "assets/images/pressure_cooker.jpeg",
        price: 100,
        discountPrice: 10.0,
        isDiscountAvailable: true,
      ),
      ProductItem(
        id: 2,
        title: "ALL Dals | 2LB",
        subtitle: "Asia Food City",
        imageUrl: "assets/images/dal.jpeg",
        price: 299,
        discountPrice: 29,
        isDiscountAvailable: true,
      ),
      ProductItem(
        id: 3,
        title: "Apple",
        subtitle: "Great Indian Grocery and Kerala Store",
        imageUrl: "assets/images/apple.jpeg",
        price: 10,
        discountPrice: 0.5,
        isDiscountAvailable: true,
      ),
      ProductItem(
        id: 4,
        title: "FIN BREAM FISH",
        subtitle: "Great Indian Grocery and Kerala Store",
        imageUrl: "assets/images/fish.jpeg",
        price: 11.99,
        discountPrice: 1,
        isDiscountAvailable: true,
      ),
      ProductItem(
        id: 5,
        title: "Banana",
        subtitle: "Namaste Indian Supermarket",
        imageUrl: "assets/images/banana.jpeg",
        price: 100.0,
        discountPrice: 50.0,
        isDiscountAvailable: true,
      ),
      ProductItem(
        id: 6,
        title: "Pressure Cooker - Stainless Steel",
        subtitle: "Great Indian Grocery and Kerala Store",
        imageUrl: "assets/images/pressure_cooker.jpeg",
        price: 100,
        discountPrice: 10.0,
        isDiscountAvailable: true,
      ),
      ProductItem(
        id: 7,
        title: "ALL Dals | 2LB",
        subtitle: "Asia Food City",
        imageUrl: "assets/images/dal.jpeg",
        price: 299,
        discountPrice: 29,
        isDiscountAvailable: true,
      ),
      ProductItem(
        id: 8,
        title: "Apple",
        subtitle: "Great Indian Grocery and Kerala Store",
        imageUrl: "assets/images/apple.jpeg",
        price: 10,
        discountPrice: 0.5,
        isDiscountAvailable: true,
      ),
      ProductItem(
        id: 9,
        title: "FIN BREAM FISH",
        subtitle: "Great Indian Grocery and Kerala Store",
        imageUrl: "assets/images/fish.jpeg",
        price: 11.99,
        discountPrice: 1,
        isDiscountAvailable: true,
      ),
      ProductItem(
        id: 10,
        title: "Banana",
        subtitle: "Namaste Indian Supermarket",
        imageUrl: "assets/images/banana.jpeg",
        price: 100.0,
        discountPrice: 50.0,
        isDiscountAvailable: true,
      ),
      // Add more items here if needed
    ]);
    print("Fetched products: ${products.length} items.");
  }

  void toggleFavoriteStatus(int productId) {
    print("Toggling favorite status for product ID: $productId");
    favorites[productId] = !(favorites[productId] ?? false);
    print("Updated favorites: $favorites");
  }

  bool isFavorite(int productId) {
    bool isFav = favorites[productId] ?? false;
    print("Product ID: $productId is favorite: $isFav");
    return isFav;
  }
}
