import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:more_devs_do_zero/features/cart/controller/cart_controller.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';
import 'package:more_devs_do_zero/shared/widgets/app_elevated_button.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  static String route = '/cart';

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:
            true, // Propriedade do próprio appBar que centraliza o Tittle
        title: Text('Carinho', style: AppTextStyle.title),
      ),
      body: SafeArea(
        child: Consumer<CartController>(
          builder: (context, value, child) {
            Text('teste');
            return Center(child: Text('Carrinho Vazio'));
          },
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.fromLTRB(16, 0, 16, 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppElevatedButton(
                onPressed: () {},
                type: ButtonType.small,
                label: 'Continuar',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
