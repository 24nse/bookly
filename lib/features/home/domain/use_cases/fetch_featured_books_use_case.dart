import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/use_cases/use_case.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>,int>{
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);
  @override
  Future<Either<Failures, List<BookEntity>>> call([int? pageNumber=0])async{
    //check permssion
    return await homeRepo.fetchFeaturedBooks(
      pageNumber: pageNumber ?? 0,
    );
  }
} 

