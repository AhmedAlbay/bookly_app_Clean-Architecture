  import 'package:bookly/Features/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void saveBooksData(List<BookEntitiy> books ,String nameBox) {
     var box = Hive.box<BookEntitiy>(nameBox);
    box.addAll(books);
  }