import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/app_widget.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

  runApp(
    const AppWidget(),
  );
}
