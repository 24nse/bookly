import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/home/data/models/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
Future<Either<Failures,List<BookModel>>>  fetchNewsetBooks();
Future<Either<Failures,List<BookModel>>> fetchFeaturedBooks();
Future<Either<Failures,List<BookModel>>> fetchSimilarBooks({required String category});


}