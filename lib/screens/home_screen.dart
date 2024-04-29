import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/categories_news_model.dart';
import 'package:news_app/models/news_channel_headlines_model.dart';
import 'package:news_app/screens/categories_sceen.dart';
import 'package:news_app/screens/news_detail_screen.dart';
import 'package:news_app/view_model/news_view_model.dart';
import 'package:news_app/widgets/general_news.dart';
import 'package:news_app/widgets/headline_news.dart';

enum FilterList { bbcNews, aryNews, medical, reuters, cnn, alJazeera }

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsViewModel newsViewModel = NewsViewModel();

  FilterList? selectedMenu;

  final format = DateFormat('MMMM dd, yyyy');

  String name = 'bbc-news';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CategoriesScreen(),
              ),
            );
          },
          icon: Image.asset(
            'images/category_icon.png',
            height: height * 0.04,
          ),
        ),
        actions: [
          PopupMenuButton<FilterList>(
            onSelected: (FilterList item) {
              if (FilterList.bbcNews.name == item.name) {
                name = 'bbc-news';
              }
              if (FilterList.aryNews.name == item.name) {
                name = 'ary-news';
              }
              if (FilterList.medical.name == item.name) {
                name = 'medical-news-today';
              }
              if (FilterList.reuters.name == item.name) {
                name = 'Reuters';
              }
              if (FilterList.cnn.name == item.name) {
                name = 'cnn';
              }
              if (FilterList.alJazeera.name == item.name) {
                name = 'al-jazeera-english';
              }
              setState(() {
                selectedMenu = item;
              });
            },
            initialValue: selectedMenu,
            itemBuilder: (context) => <PopupMenuEntry<FilterList>>[
              const PopupMenuItem(
                value: FilterList.bbcNews,
                child: Text('BBC News'),
              ),
              const PopupMenuItem(
                value: FilterList.aryNews,
                child: Text('Ary News'),
              ),
              const PopupMenuItem(
                value: FilterList.medical,
                child: Text('Medical News'),
              ),
              const PopupMenuItem(
                value: FilterList.reuters,
                child: Text('Reuters'),
              ),
              const PopupMenuItem(
                value: FilterList.cnn,
                child: Text('CNN'),
              ),
              const PopupMenuItem(
                value: FilterList.alJazeera,
                child: Text('Al-Jazeera'),
              ),
            ],
          ),
        ],
        centerTitle: true,
        automaticallyImplyLeading: false,
        // backgroundColor: Colors.deepPurple,
        title: Text(
          'News',
          style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: height * .6,
            width: width,
            //color: Colors.red,
            child: FutureBuilder<NewsChannelsHeadlinesModel>(
              future: newsViewModel.fetchNewsChannelHeadlinesApi(name),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: SpinKitSpinningLines(
                      size: 50,
                      color: Colors.deepPurple,
                    ),
                  );
                } else {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.articles!.length,
                      itemBuilder: (context, index) {
                        DateTime dateTime = DateTime.parse(snapshot
                            .data!.articles![index].publishedAt
                            .toString());
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return NewsDetailScreen(
                                    snapshot.data!.articles![index].urlToImage
                                        .toString(),
                                    snapshot.data!.articles![index].title
                                        .toString(),
                                    snapshot.data!.articles![index].publishedAt
                                        .toString(),
                                    snapshot.data!.articles![index].author
                                        .toString(),
                                    snapshot.data!.articles![index].description
                                        .toString(),
                                    snapshot.data!.articles![index].content
                                        .toString(),
                                    snapshot.data!.articles![index].source!.name
                                        .toString(),
                                  );
                                },
                              ),
                            );
                          },
                          child: NewsHeadline(
                            imageUrl: snapshot.data!.articles![index].urlToImage
                                .toString(),
                            title: snapshot.data!.articles![index].title
                                .toString(),
                            dateTime: format.format(dateTime),
                            source: snapshot.data!.articles![index].source!.name
                                .toString(),
                          ),
                        );
                      });
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FutureBuilder<CategoriesNewsModel>(
              future: newsViewModel.fetchCategoryNewsApi('General'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: SpinKitSpinningLines(
                      size: 50,
                      color: Colors.deepPurple,
                    ),
                  );
                } else {
                  return ListView.builder(
                      shrinkWrap: true,
                      //scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.articles!.length,
                      itemBuilder: (context, index) {
                        DateTime dateTime = DateTime.parse(snapshot
                            .data!.articles![index].publishedAt
                            .toString());
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return NewsDetailScreen(
                                      snapshot.data!.articles![index].urlToImage
                                          .toString(),
                                      snapshot.data!.articles![index].title
                                          .toString(),
                                      snapshot
                                          .data!.articles![index].publishedAt
                                          .toString(),
                                      snapshot.data!.articles![index].author
                                          .toString(),
                                      snapshot
                                          .data!.articles![index].description
                                          .toString(),
                                      snapshot.data!.articles![index].content
                                          .toString(),
                                      snapshot
                                          .data!.articles![index].source!.name
                                          .toString(),
                                    );
                                  },
                                ),
                              );
                            },
                            child: GeneralNews(
                                imageUrl: snapshot
                                    .data!.articles![index].urlToImage
                                    .toString(),
                                title: snapshot.data!.articles![index].title
                                    .toString(),
                                dateTime: format.format(dateTime),
                                source: snapshot
                                    .data!.articles![index].source!.name
                                    .toString()));
                      });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
