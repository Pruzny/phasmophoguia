import 'package:get/get.dart';

import 'pages/evidences/evidences_bindings.dart';
import 'pages/evidences/evidences_page.dart';
import 'pages/home/home_bindings.dart';
import 'pages/home/home_page.dart';
import 'pages/maps/maps_bindings.dart';
import 'pages/maps/maps_page.dart';

abstract class AppRoutes {
  static const home = "/home";

  static const evidences = "/evidences";

  static const maps = "/maps";

  static final routes = <GetPage>[
    GetPage(
      name: home,
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: evidences,
      page: () => EvidencesPage(),
      binding: EvidencesBindings(),
    ),
    GetPage(
      name: maps,
      page: () => const MapsPage(),
      binding: MapsBindings(),
    ),
  ];
}
