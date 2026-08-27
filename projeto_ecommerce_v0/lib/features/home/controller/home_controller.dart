import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/home/models/category_model.dart';
import 'package:more_devs_do_zero/features/home/models/product_model.dart';
import 'package:more_devs_do_zero/shared/mocks.dart';

enum CategoriesViewState { loading, sucess, error }

enum ProductsViewState { loading, sucess, error }

class HomeController extends ChangeNotifier {
  List<Category> categories = [];
  List<Product> products = [];

  ProductsViewState productsState = ProductsViewState.loading;
  CategoriesViewState categoriaState = CategoriesViewState.loading;

  //Seta o estado da página de acordo com loading, sucess, error
  void changeCategoriaState(CategoriesViewState state) {
    categoriaState = state;
    notifyListeners();
  }

  void changeProductState(ProductsViewState state) {
    productsState = state;
    notifyListeners();
  }

  Future<void> getCategorias() async {
    changeCategoriaState(CategoriesViewState.loading);
    await Future.delayed(Duration(seconds: 3));
    try {
      categories = categoriesJson.map((item) {
        return Category.fromJson(item);
      }).toList();
      changeCategoriaState(CategoriesViewState.sucess);
    } catch (e) {
      changeCategoriaState(CategoriesViewState.error);
    }
  }

  Future<void> getProdutos() async {
    changeProductState(ProductsViewState.loading);
    await Future.delayed(Duration(seconds: 3));
    try {
      products = productsJson.map((item) {
        return Product.fromJson(item);
      }).toList();
      changeProductState(ProductsViewState.sucess);
    } catch (e) {
      changeProductState(ProductsViewState.error);
    }
  }
}
