

import 'package:bookly/core/widgets/custom_text.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly/features/search/presentation/view_models/search_cubit/search_cubit.dart';
import 'package:bookly/features/search/presentation/view_models/search_cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      buildWhen: (previous, current) => previous.runtimeType != current.runtimeType,
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchSuccess) {
          if (state.books.isEmpty) {
            return Center(child: CustomText('No results found'));
          }
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(book: state.books[index]),
              );
            },
          );
        } else if (state is SearchFailure) {
          return Center(child: CustomText(state.message));
        }
        return const SizedBox();
      },
    );
  }
}
