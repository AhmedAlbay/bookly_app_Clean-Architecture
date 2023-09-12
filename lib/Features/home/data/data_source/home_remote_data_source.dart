import 'package:bookly/Features/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/data/model/book_model/book_model.dart';
import 'package:bookly/core/utils/api_service.dart';

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
    return books;
  }

 

  @override
  Future<List<BookEntitiy>> fetchNewestBooks() async{
 var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest &q=programming');
    List<BookEntitiy> books = getBookList(data);
    return books;
  }
   List<BookEntitiy> getBookList(Map<String, dynamic> data) {
     List<BookEntitiy> books = [];
    for (var BookMap in data['items']) {
      books.add(BookModel.fromJson(BookMap));
    }
    return books;
  }
}
