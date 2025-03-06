import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../managers/list_bloc.dart';

@RoutePage()
class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ListBloc>();

    final state = bloc.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('List'),
        leading: BackButton(
          onPressed: () => context.router.maybePop(),
        ),
      ),
      body: switch (state) {
        Initial() => Placeholder(),
        Loaded(:final list) => Scaffold(
          body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              if (Platform.isIOS) {
                return CupertinoListTile(
                  title: Text(list[index].id.toString()),
                  onTap: () => bloc.add(ListEvent.select(list[index])),
                );
              }

              return ListTile(
                title: Text(list[index].title),
                onTap: () => bloc.add(ListEvent.select(list[index])),
              );
            },
          ),
        )
      },
    );
  }
}
