// ignore_for_file: camel_case_types, file_names

class popular {
  final String imagePath;
  final String name;
  final String weight;
  final String star;

  static List<popular> popularList = [
    popular(
        imagePath: 'assets/pizza.png',
        name: 'Primavera Pizza',
        weight: 'Weight 540 gr',
        star: '5.0'),
    popular(
        imagePath: 'assets/pizza-1.png',
        name: 'Supreme Cheese Pizza',
        weight: 'Weight 200 gr',
        star: '4.5'),
    popular(
        imagePath: 'assets/salad.png',
        name: '5 Veggies Salad',
        weight: 'Weight 200 gr',
        star: '4.5'),
    popular(
        imagePath: 'assets/sandwhich.png',
        name: 'Grilled Sandwhich',
        weight: 'Weight 250 gr',
        star: '4.0'),
    popular(
        imagePath: 'assets/chowmin.png',
        name: 'Cheese Chowmin',
        weight: 'Weight 500 gr',
        star: '4.0'),
  ];

  popular(
      {required this.imagePath,
      required this.name,
      required this.weight,
      required this.star});
}
