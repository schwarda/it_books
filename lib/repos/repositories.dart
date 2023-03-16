import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:http_bloc/constants.dart';
import 'package:http_bloc/models/book_model.dart';

class BookRepository {
  Future<List<BookModel>> getBooks() async {
    http.Response response =
        await http.get(Uri.parse(ApiConstants.baseUrl + ApiConstants.endpoint));
    if (response.statusCode == 200) {
      final List model = jsonDecode(response.body)['books'];
      return model.map((e) => BookModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
