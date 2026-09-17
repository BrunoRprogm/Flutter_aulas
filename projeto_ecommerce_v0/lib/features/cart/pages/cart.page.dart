import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:more_devs_do_zero/features/cart/controller/cart_controller.dart';
import 'package:more_devs_do_zero/features/cart/pages/cart_item_card_page.dart';
import 'package:more_devs_do_zero/features/home/models/product_model.dart';
import 'package:more_devs_do_zero/shared/app_colors.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';
import 'package:more_devs_do_zero/shared/mocks.dart';
import 'package:more_devs_do_zero/shared/widgets/app_elevated_button.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  static String route = '/cart';

  @override
  State<CartPage> createState() => _CartPageState();
}

final product = Product.fromJson(productsJson.first);

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Carinho', style: AppTextStyle.title),
      ),

      body: Consumer<CartController>(
        builder: (context, value, child) {
          if (value.itemCarrinho.isEmpty) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.sentiment_dissatisfied,
                    size: 140,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 120),
                  Text(
                    'Sem itens no carrinho.',
                    style: AppTextStyle.titleProduct,
                  ),
                ],
              ),
            );
          }

          final itemNoCarrinho = value.itemCarrinho.firstWhere(
            (item) => item.name == product.name,
            orElse: () => ProductCart.fromProduct(product),
          );

          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsetsGeometry.directional(top: 45),
                child: ListView.builder(
                  itemCount: value.itemCarrinho.length,
                  itemBuilder: (context, index) {
                    return CartItemCard(item: value.itemCarrinho[index]);
                  },
                ),
              ),
            ),
            bottomNavigationBar: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Divider(
                    thickness: 1,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.fromLTRB(16, 0, 16, 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'R\$${value.totalPrice.toStringAsFixed(2)}',
                          style: AppTextStyle.priceProduct2,
                        ),
                        SizedBox(width: 40),
                        AppElevatedButton(
                          onPressed: () {},
                          type: ButtonType.small,
                          label: 'Continuar',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
