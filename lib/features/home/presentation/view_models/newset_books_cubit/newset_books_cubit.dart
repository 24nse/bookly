import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/models/book_model/book_model.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:equatable/equatable.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.homeRepo) : super(NewsetBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchNewsetBooks()async{
    emit(NewsetBooksLoading());
    var result=await homeRepo.fetchNewsetBooks();
    result.fold((failure){
      emit(NewsetBooksFailure(failure.errMessage));
    }, (books){
      emit(NewsetBooksSuccess(books));
    });
  }
}

