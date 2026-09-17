import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:more_devs_do_zero/features/cart/controller/cart_controller.dart';
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
          final itemNoCarrinho = value.itemCarrinho.firstWhere(
            (item) => item.name == product.name,
            orElse: () => ProductCart.fromProduct(product),
          );

          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsetsGeometry.directional(top: 45),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 385,
                          height: 128,
                          padding: EdgeInsets.fromLTRB(6, 10, 6, 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1.5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  product.imageUrl,
                                  height: 108,
                                  width: 108,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          ' ${product.name}',
                                          style: AppTextStyle.productName,
                                        ),
                                        Text(
                                          'R\$${value.totalPrice.toStringAsFixed(2)}',
                                          style: AppTextStyle.priceProduct3,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '  ${product.brand}',
                                      style: AppTextStyle.smallGrey,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        AppElevatedButton(
                                          onPressed: () {
                                            value.subtrair(itemNoCarrinho);
                                          },
                                          type: ButtonType.filled,
                                          label: '-',
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          '${itemNoCarrinho.quantity}',
                                          style: AppTextStyle.priceProduct2,
                                        ),
                                        SizedBox(width: 10),
                                        AppElevatedButton(
                                          onPressed: () {
                                            value.adicionar(itemNoCarrinho);
                                          },
                                          type: ButtonType.filled,
                                          label: '+',
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
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
