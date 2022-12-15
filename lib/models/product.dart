
class Product {
  String title;
  String imgUrl;
  String desc;
  num price;
  num score;
  List<Map<String, String>> ingredients;
  bool highLight;

  Product(this.title, this.imgUrl, this.desc, this.price, this.score,
      this.ingredients,
      {this.highLight = false});

  // Static List<Product> generateChickenProducts() {
  //   return [
  //     Product('Drum Stick',
  //             'assets/products/drum.png', 
  //             'lorem ipsum', 
  //             203, 
  //             4.5, 
  //             [
  //               {
  //                 'Noodle' : 'assets/ingredients/noodles.png',
  //               },
  //               {
  //                 'Noodle' : 'assets/ingredients/noodles.png',
  //               },
  //               {
  //                 'Noodle' : 'assets/ingredients/noodles.png',
  //               }
  //             ],
  //             highLight: true),
  //     Product('Crave Burger',
  //             'assets/products/crave.png', 
  //             'lorem ipsum', 
  //             400, 
  //             4.5, 
  //             [
  //               {
  //                 'Noodle' : 'assets/ingredients/noodles.png',
  //               },
  //               {
  //                 'Noodle' : 'assets/ingredients/noodles.png',
  //               },
  //               {
  //                 'Noodle' : 'assets/ingredients/noodles.png',
  //               }
  //             ],
  //             highLight: false),        
  //   ];
  // }
}
