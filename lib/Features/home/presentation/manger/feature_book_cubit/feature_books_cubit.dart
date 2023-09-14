import 'package:bloc/bloc.dart';
import 'package:bookly/Features/domain/entities/book_entity.dart';
import 'package:bookly/Features/domain/usecase/fetch_feature_book_use_case.dart';
import 'package:meta/meta.dart';

part 'feature_books_state.dart';

class FeatureBooksCubit extends Cubit<FeatureBooksState> {
  FeatureBooksCubit(this.featureBookUseCase) : super(FeatureBooksInitial());
  final FetchFeatureBookUseCase featureBookUseCase;
  Future<void> fetchFeatureBook() async {
    emit(FeatureBooksLoading());
    var result = await featureBookUseCase.call();
    result.fold((failure) {
      emit(FeatureBooksFailure(failure.errMessage));
    }, (books) {
      emit(FeatureBooksSuccess(books));
    });
  }
}
