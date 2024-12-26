import 'package:flutter/material.dart';
import 'package:flutter3/components/product_item.dart';
import 'package:flutter3/models/product.dart';

class FavoritesPage extends StatefulWidget {
  final Function(Product) onFavoriteToggle;
  final List<Product> favoriteProducts;

  const FavoritesPage(
      {super.key, required this.onFavoriteToggle, required this.favoriteProducts});

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Отложенное",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: widget.favoriteProducts.isEmpty
              ? const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite_border,
                  size: 50,
                  color: Colors.grey,
                ),
                SizedBox(height: 16),
                Text(
                  "Здесь пока ничего нет(",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          )
              : GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 6 / 12,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: widget.favoriteProducts.length,
              itemBuilder: (BuildContext ctx, index) {
                return ProductItem(
                    product: widget.favoriteProducts[index],
                    liked: widget.favoriteProducts
                        .contains(widget.favoriteProducts[index]),
                    onFavoriteToggle: () => widget
                        .onFavoriteToggle(widget.favoriteProducts[index]));
              })),
    );
  }
}