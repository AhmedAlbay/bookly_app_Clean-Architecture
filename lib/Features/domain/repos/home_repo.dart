import 'package:bookly/Features/domain/entities/book_entity.dart';

abstract class HomeRepo {
  Future<BookEntitiy> fetchFeatureBooks();
   Future<BookEntitiy> fetchNewestBooks();
}
