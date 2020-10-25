import 'package:get/get.dart';
import 'package:getx/models/product.dart';

class ShoppingController extends GetxController {
  var products = List<Product>().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var productResult = [
      Product(
        id: 1,
        name: 'product 1',
        image: 'img1',
        price: 20.0,
        description: 'some description about product',
      ),
      Product(
        id: 2,
        name: 'product 2',
        image: 'img2',
        price: 30.5,
        description: 'some description about product',
      ),
      Product(
        id: 3,
        name: 'product 3',
        image: 'img3',
        price: 40.0,
        description: 'some description about product',
      ),
      Product(
        id: 4,
        name: 'product 4',
        image: 'img4',
        price: 44.5,
        description: 'some description about product',
      ),
      Product(
        id: 5,
        name: 'product 5',
        image: 'img5',
        price: 50.0,
        description: 'some description about product',
      )
    ];

    products.value = productResult;
  }
}
