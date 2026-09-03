import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/home/models/products_by_category_page_controller.dart';
import 'package:provider/provider.dart';

class ProductsByCategoryPage extends StatefulWidget {
  const ProductsByCategoryPage({super.key, required this.categoryName});

  static const String route = '/products-by-category';
  final String categoryName;

  State<ProductsByCategoryPage> createState() => _ProductsByCategorypageState();
}

class _ProductsByCategorypageState extends State<ProductsByCategoryPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductsByCategoryPageController>().getProductsByCategory(
        widget.categoryName,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryName)),
      body: Consumer<ProductsByCategoryPageController>(
        builder: (context, controller, _) {
          // sua UI baseada no estado do controller
          return Container();
        },
      ),
    );
  }
}
