import 'package:flutter/material.dart';

class ProductsByCategoryPage extends StatefulWidget {
  const ProductsByCategoryPage({super.key, required categoryName});

  static String route = '/ProductsByCategoryPage';

  @override
  State<ProductsByCategoryPage> createState() => _ProductsByCategoryPage();
}
