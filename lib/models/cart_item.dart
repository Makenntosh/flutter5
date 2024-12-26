import 'package:flutter3/models/product.dart';

class CartItem {
  final String id;
  int quantity;
  final Product data;

  CartItem(this.id, this.quantity, this.data);
}