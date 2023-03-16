import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_bloc/bloc/book_bloc.dart';
import 'package:http_bloc/models/book_model.dart';
import 'package:http_bloc/pages/book_page.dart';
import 'package:http_bloc/pages/error_page.dart';
import 'package:http_bloc/pages/home_page.dart';
import 'package:http_bloc/pages/no_book_page.dart';

import '../theme/app_colors.dart';
import 'wrong_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchState();
}

class _SearchState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          if (state is BookInitialState) {
            return const HomePage();
          }

          if (state is BookLoading) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          }
          if (state is NoBookLoaded) {
            return const NoBookPage();
          }
          if (state is BookLoaded) {
            List<BookModel> books = state.books;
            return BookPage(
              books: books,
            );
          }

          if (state is BookError) {
            return const ErrorPage();
          } else {
            return const WrongPage();
          }
        },
      ),
    );
  }
}
