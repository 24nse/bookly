part of 'newset_books_cubit.dart';

sealed class NewsetBooksState extends Equatable {
  const NewsetBooksState();

  @override
  List<Object> get props => [];
}

final class NewsetBooksInitial extends NewsetBooksState {}
final class NewsetBooksLoading extends NewsetBooksState {}
final class NewsetBooksSuccess extends NewsetBooksState {
  final List<BookEntity> books;

  const NewsetBooksSuccess(this.books);
}
final class NewsetBooksFailure  extends NewsetBooksState {
  final String errMessage;

  const NewsetBooksFailure(this.errMessage);
}
class NewsetBooksPaginationLoading extends NewsetBooksState {}

class NewsetBooksPaginationFailure extends NewsetBooksState {
  final String errMessage;

const  NewsetBooksPaginationFailure(this.errMessage);
}