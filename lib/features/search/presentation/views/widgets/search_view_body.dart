import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:bookly/core/widgets/custom_text.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(height: 8,),
          CustomSearchTextField(),
          SizedBox(height: 16,),
          CustomText("Search Result",style: Styles.textStyle18,),
          SizedBox(height: 16,),
          Expanded(child: SearchResultListView())
        ],
      ),
    );
  }
}

