import 'package:flutter/material.dart';
import 'package:flutter3/models/product.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(product.name),
        ),
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                AspectRatio(
                    aspectRatio: 16 / 20,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(product.imageUrl),
                              fit: BoxFit.cover),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15))),
                    )),
                Container(
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: Text(
                      product.name,
                      style: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.w900),
                      softWrap: true,
                    )),
                Container(
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: Text(
                      product.id,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                      softWrap: true,
                    )),
                Container(
                    padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
                    child: Text(
                      product.description,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                      softWrap: true,
                    )),
                const SizedBox(
                  height: 80,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: FloatingActionButton.extended(
                backgroundColor: Colors.black,
                onPressed: () => {},
                icon: const Icon(
                  Icons.shopping_cart,
                  size: 24,
                  color: Colors.white,
                ),
                label: Text(
                  product.price,
                  style: const TextStyle(color: Colors.white),
                ),
                shape: const RoundedRectangleBorder(),
              ),
            ),
          )
        ]));
  }
}