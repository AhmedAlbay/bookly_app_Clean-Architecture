// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/Features/domain/entities/book_entity.dart';
import 'package:bookly/Features/domain/usecase/fetch_feature_book_use_case.dart';
import 'package:meta/meta.dart';

part 'feature_books_state.dart';

class FeatureBooksCubit extends Cubit<FeatureBooksState> {
  FeatureBooksCubit(this.featureBookUseCase) : super(FeatureBooksInitial());
  final FetchFeatureBookUseCase featureBookUseCase;
  Future<void> fetchFeatureBook({int pageNumber = 0}) async {
    
    if (pageNumber == 0) {
      emit(FeatureBooksLoading());
    } else {
      emit(FeatureBooksPaginationLoading());
    }

    var result = await featureBookUseCase.call(pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(FeatureBooksFailure(failure.errMessage));
      } else {
        emit(FeatureBooksPaginationFailure(failure.errMessage));
      }
    }, (books) {
      emit(FeatureBooksSuccess(books));
    });
  }
}
