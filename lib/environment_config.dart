import 'package:flutter_riverpod/flutter_riverpod.dart';

class EnvironmentConfig {
  static const movieApiKey = "1f430aafa55496bc5572b28914761ed2";
}

final environmentConfigProvider = Provider((ref) => EnvironmentConfig());
