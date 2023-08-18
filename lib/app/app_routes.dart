import 'package:get/get.dart';

import 'pages/home/home_bindings.dart';
import 'pages/home/home_page.dart';

abstract class AppRoutes {
  static const home = "/home";

  static final routes = <GetPage>[
    GetPage(
      name: home,
      page: () => HomePage(),
      binding: HomeBindings(),
    ),
  ];
}
