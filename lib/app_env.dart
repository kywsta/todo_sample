import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_env.g.dart';

enum AppEnv {
  demo,
  dev,
}

@riverpod
AppEnv appEnv(Ref ref) {
  final env = String.fromEnvironment('APP_ENV');
  switch (env) {
    case 'demo':
      return AppEnv.demo;
    case 'dev':
      return AppEnv.dev;
    default:
      return AppEnv.demo;
  }
}
