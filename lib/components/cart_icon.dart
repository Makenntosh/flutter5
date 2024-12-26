import 'package:flutter/material.dart';

class CartIcon extends StatelessWidget {
  final int itemCount;

  const CartIcon({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Icon(Icons.shopping_cart),
        if (itemCount > 0)
          Positioned(
            right: 0,
            top: 0,
            child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(50),
                ),
                constraints: const BoxConstraints(
                  minWidth: 7,
                  maxWidth: 7,
                  maxHeight: 7,
                  minHeight: 7,
                )
            ),
          ),
      ],
    );
  }
}