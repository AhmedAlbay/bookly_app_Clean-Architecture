part of 'feature_books_cubit.dart';

@immutable
abstract class FeatureBooksState {}

class FeatureBooksInitial extends FeatureBooksState {}

class FeatureBooksLoading extends FeatureBooksState {}
class FeatureBooksPaginationLoading extends FeatureBooksState {}
class FeatureBooksPaginationFailure extends FeatureBooksState {
   final String errMessage;

  FeatureBooksPaginationFailure(this.errMessage);
}

class FeatureBooksFailure extends FeatureBooksState {
  final String errMessage;

  FeatureBooksFailure(this.errMessage);
}

class FeatureBooksSuccess extends FeatureBooksState {
  final List<BookEntitiy> books;

  FeatureBooksSuccess(this.books);
}
