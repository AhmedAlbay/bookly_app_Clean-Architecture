import 'package:bookly/Features/domain/entities/book_entity.dart';
import 'package:bookly/Features/domain/repos/home_repo.dart';
import 'package:bookly/core/error/failure.dart';
import 'package:dartz/dartz.dart';

class FetchFeatureBookUseCase {
  final HomeRepo homeRepo;
  FetchFeatureBookUseCase(this.homeRepo);
    Future<Either<Failure, List<BookEntitiy>>> fetchFeatureBooks(){
      return homeRepo.fetchFeatureBooks();
    }

}
