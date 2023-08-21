import 'package:flutter/services.dart';

abstract class ApiAdapter {
  Future readAll();
}

class ApiAdapterImpl implements ApiAdapter {
  final String filePath;

  ApiAdapterImpl({required this.filePath});

  @override
  Future<String> readAll() async {
    return await rootBundle.loadString(filePath);
  }
}
