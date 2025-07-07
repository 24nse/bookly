import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:equatable/equatable.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.newsetBooksUseCase) : super(NewsetBooksInitial());
  final FetchNewestBooksUseCase newsetBooksUseCase;
  Future<void> fetchNewsetBooks({int pageNumber=0})async{
    if (pageNumber == 0) {
      emit(NewsetBooksLoading());
    } else {
      emit(NewsetBooksPaginationLoading());
    }
    
    var result=await newsetBooksUseCase.call(pageNumber);
    result.fold((failure){
      if (pageNumber == 0) {
        emit(NewsetBooksFailure(failure.errMessage));
      } else {
        emit(NewsetBooksPaginationFailure(failure.errMessage));
      }
    }, (books){
      emit(NewsetBooksSuccess(books));
    });
  }
}

