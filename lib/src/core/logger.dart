import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    errorMethodCount: 2,
    printTime: true,
    colors: false,
  ),
);
