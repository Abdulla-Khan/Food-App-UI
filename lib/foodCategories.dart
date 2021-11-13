// ignore_for_file: prefer_typing_uninitialized_variables, file_names

class Categories {
  final imagePath;
  final name;
  Categories(this.imagePath, this.name);

  static List<Categories> foodList = [
    Categories(
      'assets/pizza.svg',
      'Pizza',
    ),
    Categories(
      'assets/sea-food.svg',
      'Seafood',
    ),
    Categories(
      'assets/coke.svg',
      'Soft Drinks',
    ),
    Categories(
      'assets/pizza.svg',
      'Pizza',
    ),
  ];
}
