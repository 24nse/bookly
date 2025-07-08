import 'package:bookly/core/utils/function/build_error_snack_bar.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/view_models/newset_books_cubit/newset_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/newset_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NewsetBookListViewBuilder extends HookWidget {
  const NewsetBookListViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final books = useState<List<BookEntity>>([]);
    return BlocConsumer<NewsetBooksCubit, NewsetBooksState>(
      listener: (context, state) {
        if (state is NewsetBooksSuccess) {
          books.value = List.from(books.value)..addAll(state.books);
        }
        if (state is NewsetBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildErrorWidget(state.errMessage),
          );
        }
      },
      buildWhen: (previous, current) =>
          previous.runtimeType != current.runtimeType,
      builder: (context, state) {
        if (state is NewsetBooksSuccess ||
            state is NewsetBooksPaginationLoading ||
            state is NewsetBooksPaginationFailure) {
          return NewsetBooksListView(books: books.value);
        } else if (state is NewsetBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
