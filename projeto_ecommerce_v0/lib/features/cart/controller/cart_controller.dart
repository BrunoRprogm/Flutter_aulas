import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/home/models/product_model.dart';

enum CartViewState { loading, sucess, error }

class ProductCart extends Product {
  CartViewState cartViewState = CartViewState.loading;

  ProductCart({
    required super.name,
    required super.imageUrl,
    required super.brand,
    required super.price,
    required super.category,
    required super.description,
    required this.quantity,
  });

  final int quantity;
}

class CartController extends ChangeNotifier {
  List<ProductCart> itemCarrinho = [];
}
