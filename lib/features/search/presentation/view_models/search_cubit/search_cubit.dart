import 'package:bloc/bloc.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:bookly/features/search/presentation/view_models/search_cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo searchRepo;
  SearchCubit(this.searchRepo) : super(SearchInitial());

  Future<void> searchBooks(String query) async {
    emit(SearchLoading());
    final result = await searchRepo.searchBooks(query);
    result.fold(
      (failure) => emit(SearchFailure(failure.errMessage)),
      (books) => emit(SearchSuccess(books)),
    );
  }
} 