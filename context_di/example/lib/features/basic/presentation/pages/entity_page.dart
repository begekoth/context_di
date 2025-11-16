import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../basic_feature.dart';
import '../managers/entity_bloc.dart';

@RoutePage()
class EntityPage extends StatelessWidget {
  final int _id;

  const EntityPage({super.key, required int id}) : _id = id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EntityBloc>(
      create: (_) => createEntityBloc(context, EntityBlocParams(_id)),
      child: BlocBuilder<EntityBloc, EntityState>(builder: (context, state) {
        return Scaffold(
          body: switch (state) {
            Initial() => Center(child: CircularProgressIndicator.adaptive()),
            Loaded() => _Content(state),
          },
        );
      }),
    );
  }
}

class _Content extends StatelessWidget {
  final Loaded _entityState;

  const _Content(this._entityState);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverAppBar.large(
        title: Text(_entityState.title),
      ),
      SliverFillRemaining(
        child: Center(child: Text(_entityState.subtitle)),
      )
    ]);
  }
}
