import 'package:flutter/material.dart';

enum CategoriesViewState { loading, sucess, error }

class HomeController extends ChangeNotifier {
  List<Category> categories = [];

  CategoriesViewState categoriaState = CategoriesViewState.loading;
  //Seta o estado da página de acordo com loading, sucess, error
  void changeCategoriaState(CategoriesViewState state) {
    categoriaState = state;
    notifyListeners();
  }

  Future<void> getCategorias() async {
    changeCategoriaState(CategoriesViewState.loading);
    await Future.delayed(Duration(seconds: 3));
    try {
      categories = [
        for (var element in categoriesJson) Category.fromJson(element),
      ];
      changeCategoriaState(CategoriesViewState.sucess);
    } catch (e) {
      changeCategoriaState(CategoriesViewState.error);
    }
  }
}

class Category {
  final String name;
  final String imageUrl;

  Category({required this.name, required this.imageUrl});

  factory Category.fromJson(Map<String, dynamic> map) {
    return Category(name: map['name'], imageUrl: map['imageUrl']);
  }
}

final List<Map<String, dynamic>> categoriesJson = [
  {'name': 'Frutas', 'imageUrl': 'https://i.postimg.cc/SNX7hc6F/Image.png'},
  {
    'name': 'Verduras',
    'imageUrl': 'https://i.postimg.cc/8PFBSLh2/Image-(1).png',
  },
  {'name': 'Padaria', 'imageUrl': 'https://i.postimg.cc/xTky2LvV/Image-1.png'},
  {
    'name': 'Importados',
    'imageUrl': 'https://i.postimg.cc/Yq4fHQ6w/Image-2.png',
  },
];
