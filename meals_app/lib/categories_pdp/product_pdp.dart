import 'package:flutter/material.dart';
import 'package:meals_app/categories_plp/meal.dart';
import 'package:meals_app/custom_component/custom_card.dart';

class ProductPdp extends StatelessWidget {
  static const routeName = "/category-meals-pdp";
  final Function toggleFavorites;
  final Function isMealFavorites;
  const ProductPdp({
    Key? key,
    required this.toggleFavorites,
    required this.isMealFavorites,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final Meal productData = routeArgs['productData'];
    bool favoriteCheck = isMealFavorites(productData.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(productData.title),
      ),
      body: LayoutBuilder(
        builder: ((context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.40,
                  width: constraints.maxWidth,
                  child: Image(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(productData.imageUrl),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Ingredients",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  width: constraints.maxWidth * 0.85,
                  height: constraints.maxWidth * 0.35,
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CustomCard(
                    margin: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: productData.ingredients.length,
                        itemBuilder: (ctx, index) {
                          return Container(
                            width: constraints.maxWidth,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              productData.ingredients[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Steps",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  width: constraints.maxWidth * 0.85,
                  height: constraints.maxWidth * 0.40,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Card(
                    margin: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListView.builder(
                      itemCount: productData.steps.length,
                      itemBuilder: (ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.pink,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Center(
                                  child: Text(
                                    "# $index",
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    productData.steps[index],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          toggleFavorites(productData.id);
        },
        child: Icon(
          favoriteCheck ? Icons.star : Icons.star_border,
          color: Colors.white,
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.orange,
      //   onPressed: () {
      //     Navigator.of(context).pop(productData.id);
      //   },
      //   child: const Icon(Icons.delete),
      // ),
    );
  }
}
