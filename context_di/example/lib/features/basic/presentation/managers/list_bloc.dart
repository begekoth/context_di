import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/domain.dart';

part 'list_event.dart';
part 'list_state.dart';
part 'list_bloc.freezed.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final RepositoryInterface _repository;

  ListBloc(this._repository) : super(const ListState.initial()) {
    on<ListEvent>((event, emit) async {
      switch (event) {
        case _Started():
          final list = await _repository.getList();
          emit(ListState.loaded(list: list));

        case _Select(:final entity):
          if (state case final Loaded state) {
            emit(state.copyWith(selected: entity));
          }
      }
    });

    add(const ListEvent.started());
  }
}
