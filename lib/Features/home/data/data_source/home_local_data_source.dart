import 'package:bookly/Features/domain/entities/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntitiy> fetchFeatureBooks();
  List<BookEntitiy> fetchNewestBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntitiy> fetchFeatureBooks() {
    var box = Hive.box<BookEntitiy>(kFeatureBox);
    return box.values.toList();
  }

  @override
  List<BookEntitiy> fetchNewestBooks() {
      var box = Hive.box<BookEntitiy>(kNewestBox);
    return box.values.toList();
  }
}
