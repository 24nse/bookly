import 'package:bookly/core/utils/function/build_error_snack_bar.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/view_models/newset_books_cubit/newset_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/newset_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsetBookListViewBuilder extends StatefulWidget {
  const NewsetBookListViewBuilder({super.key});

  @override
  State<NewsetBookListViewBuilder> createState() =>
      _NewsetBookListViewBuilderState();
}

class _NewsetBookListViewBuilderState extends State<NewsetBookListViewBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsetBooksCubit, NewsetBooksState>(
      listener: (context, state) {
        if (state is NewsetBooksSuccess) {
          books.addAll(state.books);
        }

        if (state is NewsetBooksPaginationFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(buildErrorWidget(state.errMessage));
        }
      },
      buildWhen: (previous, current) =>
          previous.runtimeType != current.runtimeType,
      builder: (context, state) {
        if (state is NewsetBooksSuccess ||
            state is NewsetBooksPaginationLoading ||
            state is NewsetBooksPaginationFailure) {
          return NewsetBooksListView(books: books);
        } else if (state is NewsetBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
