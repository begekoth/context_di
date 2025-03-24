// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [BasicFeaturePage]
class BasicFeatureRoute extends PageRouteInfo<void> {
  const BasicFeatureRoute({List<PageRouteInfo>? children})
    : super(BasicFeatureRoute.name, initialChildren: children);

  static const String name = 'BasicFeatureRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BasicFeaturePage();
    },
  );
}

/// generated route for
/// [EntityPage]
class EntityRoute extends PageRouteInfo<EntityRouteArgs> {
  EntityRoute({Key? key, required int id, List<PageRouteInfo>? children})
    : super(
        EntityRoute.name,
        args: EntityRouteArgs(key: key, id: id),
        initialChildren: children,
      );

  static const String name = 'EntityRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EntityRouteArgs>();
      return EntityPage(key: args.key, id: args.id);
    },
  );
}

class EntityRouteArgs {
  const EntityRouteArgs({this.key, required this.id});

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'EntityRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [ListPage]
class ListRoute extends PageRouteInfo<void> {
  const ListRoute({List<PageRouteInfo>? children})
    : super(ListRoute.name, initialChildren: children);

  static const String name = 'ListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ListPage();
    },
  );
}
