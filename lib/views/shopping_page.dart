import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/cart_controller.dart';
import 'package:getx/controllers/shopping_controller.dart';

class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return productCard(controller, index);
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 20.0,
            ),

            // GetBuilder<CartController>(builder: (controller) {
            //   return Text(
            //     'Total amount: ${controller.totalPrice}',
            //     style: TextStyle(fontSize: 32.0, color: Colors.white),
            //   );
            // }),

            // GetX<CartController>(builder: (controller) {
            //   return Text(
            //     'Total amount: ${controller.totalPrice}',
            //     style: TextStyle(fontSize: 32.0, color: Colors.white),
            //   );
            // }),

            Obx(() {
              return Text(
                'Total amount: ${cartController.totalPrice}',
                style: TextStyle(fontSize: 32.0, color: Colors.white),
              );
            }),

            SizedBox(
              height: 100.0,
            ),
          ],
        ),
      ),
      floatingActionButton: GetX<CartController>(builder: (controller) {
        return FloatingActionButton.extended(
          onPressed: () {
            controller.clearCart();
          },
          label: Text('${controller.count}'),
          backgroundColor: Colors.black54,
          icon: Icon(Icons.add_shopping_cart_rounded),
        );
      }),
    );
  }

  Widget productCard(ShoppingController controller, int index) {
    return Card(
      margin: const EdgeInsets.all(12.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${controller.products[index].name}',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text('${controller.products[index].description}')
                  ],
                ),
                Text(
                  '${controller.products[index].price} THB',
                  style: TextStyle(fontSize: 24),
                )
              ],
            ),
            RaisedButton(
              onPressed: () {
                cartController.addToCart(controller.products[index]);
              },
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('Add to Cart'),
            )
          ],
        ),
      ),
    );
  }
}
