import 'package:bookly/Features/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/data/model/book_model/book_model.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/utils/functions/sava_book_data.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntitiy>> fetchFeatureBooks();
  Future<List<BookEntitiy>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntitiy>> fetchFeatureBooks() async {
    var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=programming');
    List<BookEntitiy> books = getBookList(data);
    saveBooksData(books, kFeatureBox);
    return books;
  }

  @override
  Future<List<BookEntitiy>> fetchNewestBooks() async {
    var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&Sorting=newest &q=programming');
    List<BookEntitiy> books = getBookList(data);
    saveBooksData(books, kNewestBox);
    return books;
  }

  List<BookEntitiy> getBookList(Map<String, dynamic> data) {
    List<BookEntitiy> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
