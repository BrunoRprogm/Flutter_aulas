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

  factory ProductCart.fromProduct(Product produto) {
    return ProductCart(
      name: produto.name,
      imageUrl: produto.imageUrl,
      brand: produto.brand,
      price: produto.price,
      category: produto.category,
      description: produto.description,
      quantity: 1,
    );
  }

  int quantity;
}

class CartController extends ChangeNotifier {
  List<ProductCart> itemCarrinho = [];

  get itemcarrinho => itemCarrinho.length;

  //este mano basicamente veirfica se um produto em especifico já está na lista
  void AddProduct(Product product) {
    final index = itemCarrinho.indexWhere((item) => item.name == product.name);
    //Se o meu carrinho estiver preenchido por algo ele vai apenas acrescentar mais um item há list
    if (index >= 0) {
      itemCarrinho[index].quantity++;
    } else {
      //casp ele não esteja, ele vai adicionar o item a lista, como se você o primeiro item que está sendo adicionado.
      itemCarrinho.add(ProductCart.fromProduct(product));
    }
    notifyListeners();
  }

  //Adiciona item
  void adicionar(ProductCart product) {
    final index = itemCarrinho.indexWhere((item) => item.name == product.name);
    if (index >= 0) {
      itemCarrinho[index].quantity++;
    } else {
      itemCarrinho.add(product);
    }
    notifyListeners();
  }

  //Remove item
  void subtrair(ProductCart product) {
    final index = itemCarrinho.indexWhere((item) => item.name == product.name);
    if (index >= 0) {
      // Se a quantidade de item for maior ou igual a zero
      //ele válida se é possível subtrair, se a quantidade de item no meu carrinho for maior que 1 ele pode subtrair, se não, ele remove o item e chablau
      if (itemCarrinho[index].quantity > 1) {
        itemCarrinho[index].quantity--;
      } else {
        itemCarrinho.removeAt(index);
      }
      notifyListeners();
    }
  }

  double get totalPrice {
    // Fold percorre a lista acumulando um valor. É como somar os itens de uma lista um por um
    return itemCarrinho.fold(
      0,
      (total, item) => total + (item.price * item.quantity),
    );
  }
}
