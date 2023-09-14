part of 'newset_books_cubit.dart';

@immutable
abstract class NewsetBooksState {}

class NewestBooksInitial extends NewsetBooksState {}

class NewestBooksLoading extends NewsetBooksState {}

class NewestBooksFailure extends NewsetBooksState {
  final String errMessage;

  NewestBooksFailure(this.errMessage);
}

class NewestBooksSuccess extends NewsetBooksState {
  final List<BookEntitiy> books;

  NewestBooksSuccess(this.books);
}
