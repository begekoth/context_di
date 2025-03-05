import 'package:flutter/material.dart';

import '../../context_di.dart';
import 'features/logger/logger.dart';
import 'router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return _RootDependencies(
      builder: (context) => MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: _router.config(),
      ),
    );
  }
}

class _RootDependencies extends FeatureDependencies {
  const _RootDependencies({super.builder});

  @override
  List<Registration> register(BuildContext context) {
    return [
      registerSingleton<Logger>((_) => Logger()),
    ];
  }
}