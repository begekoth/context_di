import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'features/basic/presentation/pages/list_page.dart';
import 'features/features.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(
          page: BasicFeatureRoute.page,
          path: '/basic',
          children: [
            AutoRoute(page: ListRoute.page, path: 'list'),
            AutoRoute(page: EntityRoute.page, path: 'entity'),
          ],
        ),
      ];
}
