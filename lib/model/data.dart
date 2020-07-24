import 'category.dart';
import 'product.dart';

class AppData {
  static List<Product> products = [
    new Product(
      id: 1,
      name: 'Nike Air Max 200',
      price: 240.00,
      isSelected: true,
      isLiked: false,
      image: 'assets/shooe_tilt_1.png',
      category: 'TrendingNow'
    ),
    new Product(
      id: 2,
      name: 'Nike Air Max 97',
      price: 220.00,
      isLiked: false,
      image: 'assets/show_tilt_2.png',
      category: 'Trending Now'
    )
  ];

  static List<Product> cart = [
    new Product(
      id: 1,
      name: 'Nike Air Max 200',
      price: 240.00,
      isSelected: true,
      isLiked: false,
      image: 'assets/small_tilt_shoe_1.png',
      category: 'Trending Now'
    ),
    new Product(
      id: 2,
      name: 'Nike Air Max 97',
      price: 190.00,
      isLiked: false,
      image: 'assets/small_tilt_shoe_2.png',
      category: 'Trending Now'
    ),
    new Product(
      id: 1,
      name: 'Nike Air Max 92607',
      price: 220.00,
      isLiked: false,
      image: 'assets/small_tilt_shoe_3.png',
      category: 'Trending Now'
    ),
    new Product(
      id: 2,
      name: 'Nike Air Max 200',
      price: 240.00,
      isSelected: true,
      isLiked: false,
      image: 'assets/small_tilt_shoe_1.png'
    )
  ];

  static List<Category> categories = [
    new Category(),
    new Category(id: 1, name: 'Sneakers', image: 'assets/shoe_thumb_2.png', isSelected: true),
    new Category(id: 2, name: 'Jacket', image: 'assets/jacket.png'),
    new Category(id: 2, name: 'Watch', image: 'assets/watch.png'),
  ];

  static List<String> thumbnails = [
    'assets/shoe_thumb_5.png',
    'assets/shoe_thumb_1.png',
    'assets/shoe_thumb_4.png',
    'assets/shoe_thumb_3.png',
  ];

  static String description = "Clean lines, versatile and timeless—the people shoe returns with the Nike Air Max 90. Featuring the same iconic Waffle sole, stitched overlays and classic TPU accents you come to love, it lets you walk among the pantheon of Air. ßNothing as fly, nothing as comfortable, nothing as proven. The Nike Air Max 90 stays true to its OG running roots with the iconic Waffle sole, stitched overlays and classic TPU details. Classic colours celebrate your fresh look while Max Air cushioning adds comfort to the journey.";
}