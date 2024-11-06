import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_children_course/app/constants.dart';
import 'package:flutter_children_course/app/usecase.dart';
import 'package:flutter_children_course/ctrl/news.dart';
import 'package:flutter_children_course/model/EveryThingNews.dart';

part 'news_search.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCtrl, NewsStates>(
      builder: (context, state) {
        final cubit = context.read<NewsCtrl>();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.cyan,
            title: const Text('NewsApi'),
            actions: [
              TextButton.icon(
                style: TextButton.styleFrom(foregroundColor: Colors.white),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Center(
                            child: Text(
                              'Select Country',
                              style: TextStyle(
                                color: Colors.cyan,
                              ),
                            ),
                          ),
                          content: SizedBox(
                            height: 330,
                            child: BlocBuilder<NewsCtrl, NewsStates>(
                              builder: (context, state) {
                                final cubit = context.read<NewsCtrl>();
                                return ListWheelScrollView(
                                  itemExtent: 100,
                                  children: List.generate(
                                      AppConstants.countries.length, (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        cubit.setCountry(
                                            AppConstants.countries[index]);
                                        Navigator.of(context).pop();
                                      },
                                      child: Card(
                                        elevation: 10,
                                        color: cubit.country ==
                                                AppConstants.countries[index]
                                            ? Colors.cyan
                                            : null,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  AppConstants.countries[index]
                                                          ["name"]
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    color: cubit.country ==
                                                            AppConstants
                                                                    .countries[
                                                                index]
                                                        ? Colors.white
                                                        : Colors.cyan,
                                                  ),
                                                ),
                                                Text(
                                                  AppConstants.countries[index]
                                                          ["flag"]
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 35),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                );
                              },
                            ),
                          ),
                        );
                      });
                },
                label: Text(cubit.country["code"]),
                icon: Text(cubit.country["flag"]),
              ),
            ],
          ),
          body: BlocBuilder<NewsCtrl, NewsStates>(
            builder: (context, state) {
              final cubit = context.read<NewsCtrl>();
              if (state is NewsLoadingState) {
                return const UseCaseBuild(UseCase.loading);
              }
              if (state is NewsErrorState) {
                return const UseCaseBuild(UseCase.error);
              }
              if (cubit.articles.isEmpty) {
                return const UseCaseBuild(UseCase.empty);
              }
              return ListView.builder(
                itemBuilder: (context, index) =>
                    _NewsItem(cubit.articles[index]),
                itemCount: cubit.articles.length,
              );
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            selectedItemColor: Colors.cyan,
            unselectedItemColor: Colors.grey.shade400,
            type: BottomNavigationBarType.shifting,
            onTap: cubit.setCategory,
            items: List.generate(
              AppConstants.newsCategories.length,
              (index) {
                return BottomNavigationBarItem(
                  icon: Icon(AppConstants.newsCategoriesIcon[index]),
                  label:
                      "${AppConstants.newsCategories[index][0].toUpperCase()}${AppConstants.newsCategories[index].substring(1)}",
                );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NewsSearch(),
                ),
              );
            },
            child: const Icon(Icons.search),
          ),
        );
      },
    );
  }

  int calculateTextLines({
    required String text,
    required TextStyle style,
    required double maxWidth,
  }) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: null, // Allow text to wrap
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: maxWidth);

    final double lineHeight = textPainter.preferredLineHeight;
    final int lineCount = (textPainter.size.height / lineHeight).ceil();
    return lineCount;
  }
}

class _NewsItem extends StatelessWidget {
  const _NewsItem(this.article);

  final Articles article;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (article.urlToImage != null)
                Flexible(
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.cyan,
                        width: 2,
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          article.urlToImage,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title ?? article.author!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(
                      color: Colors.cyan,
                    ),
                    Expanded(
                      child: Text(
                        article.content ?? article.description ?? "",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Divider(
                      color: Colors.grey[300],
                      height: 0,
                    ),
                    Text(
                      article.publishedAt!,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
