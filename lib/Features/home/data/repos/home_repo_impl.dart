import 'package:bookly/Features/domain/entities/book_entity.dart';
import 'package:bookly/Features/domain/repos/home_repo.dart';
import 'package:bookly/Features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly/Features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});
  @override
  Future<Either<Failure, List<BookEntitiy>>> fetchFeatureBooks(
      {int pageNumber = 0}) async {
    try {
      // ignore: await_only_futures
      var bookList =
          await homeLocalDataSource.fetchFeatureBooks(pageNumber: pageNumber);
      if (bookList.isNotEmpty) {
        return right(bookList);
      }
      var books =
          await homeRemoteDataSource.fetchFeatureBooks(pageNumber: pageNumber);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntitiy>>> fetchNewestBooks() async {
    try {
      List<BookEntitiy> books;
      // ignore: await_only_futures
      books = await homeLocalDataSource.fetchNewestBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchNewestBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
