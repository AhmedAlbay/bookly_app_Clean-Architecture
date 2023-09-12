import 'package:bookly/Features/domain/entities/book_entity.dart';
import 'package:bookly/Features/domain/repos/home_repo.dart';
import 'package:bookly/core/error/failure.dart';
import 'package:bookly/core/use_case/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchFeatureBookUseCase extends UseCase<List<BookEntitiy>,void> {
  final HomeRepo homeRepo;

  FetchFeatureBookUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntitiy>>> call([void param]) {
    return homeRepo.fetchFeatureBooks();
  }
}


