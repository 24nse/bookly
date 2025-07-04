import 'package:bookly/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/features/search/presentation/view_models/search_cubit/search_cubit.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/search/data/repos/search_repo_impl.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (_) => SearchCubit(getIt.get<SearchRepoImpl>()),
          child: const SearchViewBody(),
        ),
      ),
    );
  }
}