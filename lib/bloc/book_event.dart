part of 'book_bloc.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object> get props => [];
}

class BookLoadEvent extends BookEvent {
  final String endpoint;
  const BookLoadEvent(this.endpoint);

  @override
  List<Object> get props => [endpoint];
}

class BookInitialEvent extends BookEvent {}
