part of 'book_bloc.dart';

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

class BookInitialState extends BookState {}

class BookLoading extends BookState {}

class NoBookLoaded extends BookState {}

class BookLoaded extends BookState {
  final List<BookModel> books;
  const BookLoaded(this.books);

  @override
  List<Object> get props => [books];
}

class BookError extends BookState {
  final String error;
  const BookError(this.error);

  @override
  List<Object> get props => [error];
}
