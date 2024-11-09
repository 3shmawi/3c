import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_children_course/app/usecase.dart';
import 'package:flutter_children_course/model/country.dart';
import 'package:flutter_children_course/view_model/country_ctrl.dart';
import 'package:flutter_children_course/view_model/theme_ctrl.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:url_launcher/url_launcher.dart';

//url launcher
class CountriesView extends StatefulWidget {
  const CountriesView({super.key});

  @override
  State<CountriesView> createState() => _CountriesViewState();
}

class _CountriesViewState extends State<CountriesView> {
  final ScrollController _scrollController = ScrollController();
  int highlightedIndex = -1;

  void scrollToItem(int index, [int? count]) {
    setState(() {
      highlightedIndex = index; // Set the highlighted index
      selectedAlphabetIndex = (count ?? 1) - 1;
    });

    double position = index * 100.0;
    if (count != null) {
      position += count * 20;
    }
    // Animate to the item's position in the list
    _scrollController.animateTo(
      position, // Assuming each item has a height of 50.0
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );

    // Remove the highlight after 1 second
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        highlightedIndex = -1; // Reset highlight
      });
    });
  }

  int selectedAlphabetIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll); // Add listener
  }

  void _onScroll() {
    // Find the closest alphabet index based on scroll position
    int closestIndex = 0;
    double minDistance = double.infinity;

    final cubit = context.read<CountryCtrl>();
    for (var entry in cubit.alphabetIndex.entries) {
      int index = entry.value;
      double offset = index * 90.0; // Approximate height of each section
      double distance = (_scrollController.offset - offset).abs();

      if (distance < minDistance) {
        minDistance = distance;
        closestIndex = cubit.alphabetIndex.keys.toList().indexOf(entry.key);
      }
    }

    // Update selected alphabet index if it has changed
    if (selectedAlphabetIndex != closestIndex) {
      setState(() {
        selectedAlphabetIndex = closestIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text("Countries"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<CountryCtrl>().getData();
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.black,
            ),
          ),
          const Icon(
            CupertinoIcons.sun_max_fill,
            color: Colors.yellowAccent,
          ),
          BlocBuilder<ThemeCtrl, bool>(
            builder: (context, isDark) {
              return CupertinoSwitch(
                activeColor: Colors.black,
                thumbColor: Colors.cyanAccent,
                trackColor: Colors.yellowAccent,
                value: isDark,
                onChanged: (v) {
                  context.read<ThemeCtrl>().toggleTheme();
                },
              );
            },
          ),
          const Icon(
            CupertinoIcons.moon_stars_fill,
            color: Colors.black,
          )
        ],
      ),
      body: BlocBuilder<CountryCtrl, CountryStates>(
        builder: (context, state) {
          if (state is CountryDataLoading) {
            return const AppStatus(CaseStates.loading);
          }
          if (state is CountryDataFailed) {
            return AppStatus(
              CaseStates.failure,
              errorText: state.error,
            );
          }
          final cubit = context.read<CountryCtrl>();
          final countries = cubit.data;

          if (countries.isEmpty) {
            return const AppStatus(CaseStates.empty);
          }

          return Column(
            children: [
              SizedBox(
                height: 50,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      cubit.alphabetIndex.length,
                      (index) => TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: selectedAlphabetIndex == index
                              ? Colors.cyan
                              : null,
                          foregroundColor: selectedAlphabetIndex == index
                              ? theme.dividerColor
                              : null,
                        ),
                        onPressed: () {
                          scrollToItem(
                              cubit.alphabetIndex[
                                  cubit.alphabetIndex.keys.elementAt(index)]!,
                              index + 1);
                        },
                        child: Text(
                          cubit.alphabetIndex.keys.elementAt(index),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Scrollbar(
                  controller: _scrollController,
                  thickness: 8,
                  radius: const Radius.circular(5),
                  interactive: true,
                  thumbVisibility: true,
                  child: AnimationLimiter(
                    child: ListView.builder(
                      physics: FastScrollPhysics(),
                      controller: _scrollController,
                      itemCount: countries.length,
                      itemBuilder: (context, index) =>
                          AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: _Item(
                              countries[index],
                              false,
                              highlightedIndex == index
                                  ? Colors.cyan
                                  : theme.dividerColor,
                              cubit.alphabetIndex[countries[index].name[0]] ==
                                  index,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final index = await showModalBottomSheet(
              context: context, builder: (context) => const BottomSheet());
          scrollToItem(index);
        },
        child: const Icon(CupertinoIcons.search),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class _Item extends StatelessWidget {
  const _Item(
    this.country,
    this.isBottomSheet,
    this.shadowColor,
    this.isShowChar,
  );

  final CountryModel country;
  final bool isBottomSheet;
  final Color shadowColor;
  final bool isShowChar;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isShowChar)
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 15, left: 15),
            child: Row(
              children: [
                const Expanded(
                  child: Divider(
                    thickness: 4,
                  ),
                ),
                Text(
                  " ${country.name[0]} ",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Expanded(
                  flex: 20,
                  child: Divider(),
                ),
              ],
            ),
          ),
        GestureDetector(
          onTap: () {
            if (isBottomSheet) {
              Navigator.of(context)
                  .pop(context.read<CountryCtrl>().getIndex(country.name));
            } else {
              _launchUrl(country.mapUrl);
            }
          },
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                height: 90,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.cyan, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Card(
                  margin: EdgeInsets.zero,
                  elevation: 20,
                  shadowColor: shadowColor,
                  color: shadowColor == Colors.cyan ? Colors.white60 : null,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      subtitle: Text(
                        country.mapUrl,
                        style: const TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      title: Text(country.name),
                      trailing: Image.network(
                        country.flag,
                        width: 40,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _launchUrl(String u) async {
    final Uri url = Uri.parse(u);

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $u');
    }
  }
}

class BottomSheet extends StatelessWidget {
  const BottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).dividerColor;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
          child: TextField(
            controller: context.read<CountryCtrl>().searchCtrl,
            onChanged: (value) {
              context.read<CountryCtrl>().search();
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              labelText: 'Search for a country',
            ),
          ),
        ),
        Expanded(
          child: BlocBuilder<CountryCtrl, CountryStates>(
            builder: (context, state) {
              final countries =
                  context.read<CountryCtrl>().searchCtrl.text.isEmpty
                      ? context.read<CountryCtrl>().data
                      : context.read<CountryCtrl>().results;
              if (countries.isEmpty) {
                return const Center(child: Text('No results found'));
              }
              return ListView.separated(
                itemCount: countries.length,
                itemBuilder: (context, index) =>
                    _Item(countries[index], true, theme, false),
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.cyan,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

//

class FastScrollPhysics extends ClampingScrollPhysics {
  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    // Adjust the multiplier as needed to control scroll speed
    return offset * 2; // 2x speed
  }
}
