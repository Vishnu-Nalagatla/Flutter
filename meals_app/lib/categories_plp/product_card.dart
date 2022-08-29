import 'package:flutter/material.dart';
import 'package:meals_app/categories_pdp/product_pdp.dart';
import 'package:meals_app/categories_plp/meal.dart';

class ProductCard extends StatelessWidget {
  final Meal product;
  // final Function removeItem;
  const ProductCard({
    Key? key,
    required this.product,
    // required this.removeItem,
  }) : super(key: key);
  void selectProduct(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      ProductPdp.routeName,
      arguments: {"productData": product},
    ).then((value) {
      if (value as bool) {
        // removeItem(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () => selectProduct(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image(
                      // height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      image: NetworkImage(product.imageUrl),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    right: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        bottom: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: Text(product.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      Text("${product.duration}mins"),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.numbers),
                      Text(product.complexity.toString().split('.').last),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.currency_pound),
                      Text(product.affordability.toString().split('.').last),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
