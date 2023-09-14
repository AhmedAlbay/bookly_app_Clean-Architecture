
import 'package:bookly/Features/domain/entities/book_entity.dart';
import 'package:bookly/Features/domain/usecase/fetch_newest_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.fetchNewestBookUseCase) : super(NewestBooksInitial());
 
  final FetchNewestBookUseCase fetchNewestBookUseCase;
  Future<void> fetchFeatureBook() async {
    emit(NewestBooksLoading());
    var result = await fetchNewestBookUseCase.call();
    result.fold((failure) {
      emit(NewestBooksFailure(failure.errMessage));
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}
