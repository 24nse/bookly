import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>>{
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);
  @override
  Future<Either<Failures, List<BookEntity>>> call()async{
    //check permssion
    return await homeRepo.fetchFeaturedBooks();
  }
}

abstract class UseCase<T>{
  Future<Either<Failures,T>> call();
}
