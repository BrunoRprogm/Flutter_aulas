import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/home/models/product_model.dart';
import 'package:more_devs_do_zero/features/home/models/products_by_category_page_controller.dart';
import 'package:more_devs_do_zero/features/home/widgets/product_card.dart';
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
      appBar: AppBar(
        title: Text(widget.categoryName),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_checkout_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Consumer<ProductsByCategoryPageController>(
        builder: (context, controller, _) {
          if (controller.state == ProductsByCategoryViewState.loading) {
            return Center(child: CircularProgressIndicator());
          }

          if (controller.state == ProductsByCategoryViewState.error) {
            return Center(child: Text('Erro ao tentar carregar os produtos!'));
          }
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Buscar Produto',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: controller.categoryProducts.length,
                  itemBuilder: (context, index) {
                    final product = controller.categoryProducts[index];
                    return ProductCard(product.category, product: product);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
