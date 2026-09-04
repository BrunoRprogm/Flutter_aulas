import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/home/controller/home_controller.dart';
import 'package:more_devs_do_zero/features/home/models/category_model.dart';
import 'package:more_devs_do_zero/features/home/models/product_model.dart';
import 'package:more_devs_do_zero/features/home/widgets/categories_section.dart';
import 'package:more_devs_do_zero/features/home/widgets/products_section.dart';
import 'package:more_devs_do_zero/features/login/controllers/login_controller.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';
import 'package:more_devs_do_zero/shared/widgets/app_elevated_button.dart';
import 'package:more_devs_do_zero/shared/widgets/app_tittle_row_product.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static String route = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Que brisa é essa? Linha abaixo.
    //WidgetsBinding faz com que espera a tela carregar os dois métodos de puxar as telas corretas.
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      context.read<HomeController>()
        ..getCategorias()
        ..getProdutos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<LoginController>(
          builder: (context, loginController, child) {
            return Text(
              'Olá ${loginController.user!.nome}',
              style: AppTextStyle.title,
            );
          },
        ),
      ),

      body: Consumer<HomeController>(
        builder: (context, HomeController, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CategoriesSection(
                state: HomeController.categoriaState,
                categories: HomeController.categories,
              ),
              ProductsSection(
                state: HomeController.productsState,
                products: HomeController.products,
                category: HomeController.categories.isNotEmpty
                    ? HomeController.categories.first
                    : Category(name: '', imageUrl: ''),
              ),
              AppElevatedButton(
                onPressed: () {
                  HomeController
                    ..getCategorias()
                    ..getProdutos();
                },
                type: ButtonType.filled,
                label: 'Testar',
              ),
            ],
          );
        },
      ),
    );
  }
}
