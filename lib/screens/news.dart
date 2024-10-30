import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_children_course/app/constants.dart';
import 'package:flutter_children_course/ctrl/news.dart';

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
          body: ListView.builder(
            itemBuilder: (context, index) => SizedBox(
              height: 150,
              child: Card(
                margin: const EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Container(
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.cyan,
                              width: 2,
                            ),
                            image: const DecorationImage(
                              image: NetworkImage(
                                "https://images.unsplash.com/photo-1729772164459-6dbe32e20510?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw1fHx8ZW58MHx8fHx8",
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
                              'Title',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Divider(
                              color: Colors.cyan,
                            ),
                            Expanded(
                              child: Text(
                                'Description',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Divider(
                              color: Colors.grey[300],
                              height: 0,
                            ),
                            Text(
                              'Published At',
                              style: TextStyle(
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
            ),
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
                  label: AppConstants.newsCategories[index].toUpperCase(),
                );
              },
            ),
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
