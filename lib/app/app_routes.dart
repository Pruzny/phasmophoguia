import 'package:get/get.dart';

import 'pages/evidences/evidences_bindings.dart';
import 'pages/evidences/evidences_page.dart';
import 'pages/home/home_bindings.dart';
import 'pages/home/home_page.dart';

abstract class AppRoutes {
  static const home = "/home";

  static const evidences = "/evidences";

  static final routes = <GetPage>[
    GetPage(
      name: home,
      page: () => HomePage(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: evidences,
      page: () => EvidencesPage(),
      binding: EvidencesBindings(),
    ),
  ];
}
