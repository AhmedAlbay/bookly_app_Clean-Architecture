import 'package:bookly/Features/domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
List<BookEntitiy> fetchFeatureBooks();
List<BookEntitiy> fetchNewestBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntitiy> fetchFeatureBooks() {
    // TODO: implement fetchFeatureBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntitiy> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
}