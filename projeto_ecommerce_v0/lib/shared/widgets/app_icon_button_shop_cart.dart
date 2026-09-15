import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/cart/controller/cart_controller.dart';
import 'package:more_devs_do_zero/features/cart/pages/cart.page.dart';
import 'package:provider/provider.dart';

class IconButtonShopCart extends StatelessWidget {
  const IconButtonShopCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
      builder: (context, controller, child) {
        return Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, CartPage.route);
                  },
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    weight: 26.39,
                    size: 30,
                  ),
                  padding: const EdgeInsets.all(24),
                ),
                Visibility(
                  replacement: Container(
                    height: 10,
                    width: 10,
                    color: Colors.amber,
                  ),
                  visible: controller.itemcarrinho > 0,
                  child: Positioned(
                    right: 4,
                    top: 4,
                    child: Container(
                      padding: const EdgeInsets.all(0.3),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(13),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        maxWidth: 16,
                      ),
                      child: Text(
                        '${controller.itemcarrinho}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
