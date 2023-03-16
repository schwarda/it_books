import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_bloc/constants.dart';
import 'package:http_bloc/models/book_model.dart';
import 'package:http_bloc/pages/no_book_page.dart';
import 'package:http_bloc/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../bloc/book_bloc.dart';

class BookPage extends StatelessWidget {
  final List<BookModel> books;

  const BookPage({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Center(
                  child: Text('${ApiConstants.endpoint} Books',
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                          fontFamily: 'AmaticSC', fontSize: 50)),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: books.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: Card(
                            child: ListTile(
                              title: Text(books[index].title),
                              leading: Image.network(
                                books[index].image,
                                height: 200,
                              ),
                              trailing: Text(books[index].price),
                            ),
                          ),
                          onTap: () => showDialog(
                            context: context,
                            builder: (BuildContext context) => Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 1.4,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 16),
                                          child: Text(
                                            books[index].title,
                                            style: const TextStyle(
                                                fontFamily: 'AmaticSC',
                                                fontSize: 26),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Image.network(
                                          books[index].image,
                                          height: 250,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 32,
                                              right: 32,
                                              bottom: 32,
                                              top: 16),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                'Price',
                                                style: TextStyle(
                                                    fontFamily: 'AmaticSC',
                                                    fontSize: 26),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                books[index].price,
                                                style: const TextStyle(
                                                    fontFamily: 'AmaticSC',
                                                    fontSize: 26),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 32.0),
                                          child: Text(
                                            books[index].subtitle,
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Text(
                                              'ISBN-13: ${books[index].isbn13}'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 16.0),
                                          child: InkWell(
                                              child: Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(vertical: 10),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20,
                                                      vertical: 5),
                                                  width: 200,
                                                  decoration: BoxDecoration(
                                                    color: AppColors
                                                        .primaryColor, // 194, 215, 242
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            32),
                                                  ),
                                                  child: const Text(
                                                    'Go to store',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontFamily: 'AmaticSC',
                                                        fontSize: 26,
                                                        color: Colors.white),
                                                  )),
                                              onTap: () async {
                                                final url = books[index].url;

                                                if (await canLaunch(url)) {
                                                  await launch(url);
                                                } else {
                                                  throw 'Could not launch $url';
                                                }
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
          Positioned(
              bottom: MediaQuery.of(context).padding.bottom == 0 ? 32 : 0,
              right: 32,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryColor, shape: BoxShape.circle),
                width: 70,
                height: 70,
                child: IconButton(
                  onPressed: () {
                    context.read<BookBloc>().add(BookInitialEvent());
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
