import 'dart:async';

import '../../../logger/logger.dart';
import '../../domain/domain.dart';

class Repository implements RepositoryInterface {
  final Logger _logger;
  final SomeDataService _dataService;

  Repository(this._logger, this._dataService);

  @override
  Future<List<SomeEntity>> getList() {
    _dataService.foo();
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

class SomeDataService {
  void foo() {

  }
}