import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  static const detailsProduct = "/details-page";
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final productName = routeArguments["name"];
    final productBrand = routeArguments["brand"];
    final productImage = routeArguments["image"];
    final productPrice = routeArguments["price"];
    final productDescription = routeArguments["description"];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(productImage!),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    productName!,
                    style: TextStyle(fontSize: 25),
                  ),
                  Card(
                    color: Colors.amber,
                    margin: EdgeInsets.only(left: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(productBrand!),
                    ),
                  )
                ],
              ),
            ),
            Text("Price :  \$${productPrice}"),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
              child: Text(
                productDescription!,
                style: TextStyle(fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
