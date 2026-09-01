import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/home/pages/home_page.dart';
import 'package:more_devs_do_zero/features/home/pages/products_by_categorypage.dart';
import 'package:more_devs_do_zero/features/login/pages/login_page.dart';
import 'package:more_devs_do_zero/features/recover/pages/recover_page.dart';
import 'package:more_devs_do_zero/features/singup/pages/signup_page.dart';

class AppRoutes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    LoginPage.route: (context) => LoginPage(),
    SignupPage.route: (context) => SignupPage(),
    RecoverPage.route: (context) => RecoverPage(),
    HomePage.route: (context) => const HomePage(),

    ProductsByCategoryPage.route: (context) {
      final categoryName = ModalRoute.of(context)!.settings.arguments as String;
      return ProductsByCategoryPage(categoryName: categoryName);
    },
  };
}
