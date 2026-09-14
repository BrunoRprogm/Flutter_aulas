import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/cart/pages/cart.page.dart';

class IconButtonShopCart extends StatelessWidget {
  const IconButtonShopCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, CartPage.route);
          },
          icon: Icon(Icons.shopping_cart_outlined, weight: 26.39, size: 30),
          padding: EdgeInsets.all(24),
        ),
      ],
    );
  }
}
