import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/models/book_model/book_model.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());  
final FetchFeaturedBooksUseCase featuredBooksUseCase;
  Future<void> fetchFeaturedBooks({int pageNumber=0})async{
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }
 
    var result=await featuredBooksUseCase.call(pageNumber);
    result.fold((failure){
      if (pageNumber == 0) {
        emit(FeaturedBooksFailure(failure.errMessage));
      } else {
        emit(FeaturedBooksPaginationFailure(failure.errMessage));
      }
    }, (books){
      emit(FeaturedBooksSuccess(books));
    });
  }
}
 