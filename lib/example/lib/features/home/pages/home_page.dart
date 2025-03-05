import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../router.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FilledButton(
            onPressed: () => {context.router.push(BasicFeatureRoute())},
            child: Text('To Basic Feature')),
      ),
    );
  }
}
