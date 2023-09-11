import 'package:bookly/Features/domain/entities/book_entity.dart';
import 'package:bookly/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntitiy>>> fetchFeatureBooks();
  Future<Either<Failure, List<BookEntitiy>>> fetchNewestBooks();
}
