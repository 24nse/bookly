part of 'similar_books_cubit.dart';

sealed class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

final class SimilarBooksInitial extends SimilarBooksState {}
final class SimilarBooksLoading extends SimilarBooksState {}
final class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookEntity> books;

  const SimilarBooksSuccess(this.books);
}
final class SimilarBooksFailure extends SimilarBooksState {
  final String errMessage;

  const SimilarBooksFailure(this.errMessage);
}

class SimilarBooksPaginationLoading extends SimilarBooksState {}

class SimilarBooksPaginationFailure extends SimilarBooksState {
  final String errMessage;
  const SimilarBooksPaginationFailure(this.errMessage);
}
