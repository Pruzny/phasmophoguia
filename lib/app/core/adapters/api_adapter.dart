import 'package:flutter/services.dart';

import '../constants.dart';

abstract class ApiAdapter {
  Future readAll();
}

class ApiAdapterImpl implements ApiAdapter {
  final String fileName;

  ApiAdapterImpl({required this.fileName});

  @override
  Future<String> readAll() async {
    return await rootBundle.loadString("$jsonPath$fileName");
  }
}
