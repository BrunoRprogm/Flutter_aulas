import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/home/controller/home_controller.dart';
import 'package:more_devs_do_zero/features/home/models/category_model.dart';
import 'package:more_devs_do_zero/features/home/models/product_model.dart';
import 'package:more_devs_do_zero/features/login/controllers/login_controller.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';
import 'package:provider/provider.dart';

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
    //WidgetsBinding faz com que espera a tela carre
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
            children: [
              SizedBox(
                height: 200,
                child: switch (HomeController.categoriaState) {
                  CategoriesViewState.loading => Center(
                    child: CircularProgressIndicator(),
                  ),
                  CategoriesViewState.error => Text(
                    'Problema ao resgatar categorias',
                  ), //Caso seja um sucesso o carregamento da tela, ele vai imprimir este tipo de tela abaixo
                  //Passando um listView e etc
                  //Interessante revisar
                  CategoriesViewState.sucess => SizedBox(
                    height: 120,
                    child: ListView.builder(
                      itemCount: HomeController.categories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        Category category = HomeController.categories[index];
                        return Container(
                          // height: 50,
                          // color: Colors.red,
                          margin: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 76,
                                child: Image.network(category.imageUrl),
                              ),
                              Text(category.name, style: AppTextStyle.title),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                },
              ),
              SizedBox(
                height: 450,
                child: switch (HomeController.productsState) {
                  ProductsViewState.loading => Center(
                    child: CircularProgressIndicator(),
                  ),
                  ProductsViewState.error => Center(
                    child: Text('Problema ao resgatar produtos'),
                  ),
                  ProductsViewState.sucess => SizedBox(
                    height: 250, //PAREI AQUI
                    child: ListView.builder(
                      itemCount: HomeController.products.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        Product product = HomeController.products[index];
                        return Container(
                          margin: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 148,
                                child: Image.network(product.imageUrl),
                              ),
                              Text(product.brand, style: AppTextStyle.textSpan),
                              Text(product.name, style: AppTextStyle.title),
                              Text(
                                'R\$ ${product.price.toString()}',
                                style: AppTextStyle.subtitle,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
