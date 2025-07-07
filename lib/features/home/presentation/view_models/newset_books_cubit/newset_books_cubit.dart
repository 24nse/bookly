import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/models/book_model/book_model.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:equatable/equatable.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.featuredBooksUseCase) : super(NewsetBooksInitial());
  final FetchNewestBooksUseCase featuredBooksUseCase;
  Future<void> fetchNewsetBooks()async{
    emit(NewsetBooksLoading());
    var result=await featuredBooksUseCase.call();
    result.fold((failure){
      emit(NewsetBooksFailure(failure.errMessage));
    }, (books){
      emit(NewsetBooksSuccess(books));
    });
  }
}

