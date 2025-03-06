import 'dart:async';

import '../../../logger/logger.dart';
import '../../domain/domain.dart';

class Repository implements RepositoryInterface {
  final Logger _logger;

  Repository(this._logger);

  @override
  Future<List<SomeEntity>> getList() {
    return Future.value(_mockList);
  }

  @override
  Future<SomeEntity?> getEntity(int id) {
    final index = _mockList.indexWhere((element) => element.id == id);

    if (index == -1) {
      return Future.value(null);
    }

    return Future.value(_mockList[index]);
  }

  void dispose() {
    _logger.log('Repository disposed');
  }
}

const _mockList = [
  SomeEntity(1, 'title1', 'subtitle1'),
  SomeEntity(2, 'title2', 'subtitle2'),
  SomeEntity(3, 'title3', 'subtitle3'),
];