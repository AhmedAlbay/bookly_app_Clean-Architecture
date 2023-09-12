import 'package:bookly/Features/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource{
  Future< List<BookEntitiy>> fetchFeatureBooks();
  Future<List<BookEntitiy>> fetchNewestBooks();
}
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  @override
  Future<List<BookEntitiy>> fetchFeatureBooks() {
    // TODO: implement fetchFeatureBooks
    throw UnimplementedError();
  }

  @override
  Future<List<BookEntitiy>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
}