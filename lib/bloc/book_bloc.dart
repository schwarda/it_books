import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http_bloc/models/book_model.dart';
import 'package:http_bloc/repos/repositories.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc() : super(BookInitialState()) {
    final BookRepository bookRepository = BookRepository();

    on<BookInitialEvent>(((event, emit) {
      emit(BookInitialState());
    }));

    on<BookLoadEvent>((event, emit) async {
      emit(BookLoading());

      try {
        final book = await bookRepository.getBooks();

        if (book.isEmpty) {
          emit(NoBookLoaded());
        } else {
          emit(BookLoaded(book));
        }
      } catch (e) {
        emit(BookError(e.toString()));
      }
    });
  }
}
