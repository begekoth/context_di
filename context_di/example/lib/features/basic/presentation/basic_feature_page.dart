import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../router.dart';
import 'basic_feature.dart';
import 'managers/list_bloc.dart';

@RoutePage()
class BasicFeaturePage extends StatelessWidget {
  const BasicFeaturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicFeature(child: _Content());
  }
}

class _Content extends StatefulWidget {
  const _Content();

  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  late final ListBloc _listBloc;

  int? _selectedId;

  @override
  void initState() {
    _listBloc = context.read<CreateListBloc>()(context);
    super.initState();
  }

  @override
  void dispose() {
    _listBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _listBloc,
      child: BlocListener<ListBloc, ListState>(
        bloc: _listBloc,
        listener: (context, state) {
          if (state case Loaded(:final selected)) {
            if (selected?.id == _selectedId) return;

            setState(() {
              _selectedId = selected?.id;
            });
          }
        },
        child: AutoRouter.declarative(
            routes: (_) => [
                  ListRoute(),
                  if (_selectedId != null)
                    EntityRoute(id: _selectedId!),
                ],
            onPopRoute: (_, __) {
              _listBloc.add(ListEvent.select(null));
            }),
      ),
    );
  }
}
