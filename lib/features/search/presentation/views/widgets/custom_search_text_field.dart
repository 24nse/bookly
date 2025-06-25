import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/features/search/presentation/view_models/search_cubit/search_cubit.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: buildOutLineInputBorder(), 
        focusedBorder: buildOutLineInputBorder(),
        hintText: "Search",
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Opacity(
            opacity: .8,
            child: Icon(FontAwesomeIcons.magnifyingGlass, size: 22,))),
      ),
      onSubmitted: (query) {
        if (query.isNotEmpty) {
          BlocProvider.of<SearchCubit>(context).searchBooks(query);
        }
      },
    );
  }

  OutlineInputBorder buildOutLineInputBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.white
        ),
        borderRadius: BorderRadius.circular(12),
      );
  }
}