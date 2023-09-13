  import 'package:bookly/Features/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void saveBooksData(List<BookEntitiy> books ,String nameBox) {
     var box = Hive.box(nameBox);
    box.addAll(books);
  }