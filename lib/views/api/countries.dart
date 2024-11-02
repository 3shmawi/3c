import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_children_course/app/usecase.dart';
import 'package:flutter_children_course/model/country.dart';
import 'package:flutter_children_course/view_model/country_ctrl.dart';
import 'package:flutter_children_course/view_model/theme_ctrl.dart';
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

  void scrollToItem(int index) {
    setState(() {
      highlightedIndex = index; // Set the highlighted index
    });

    // Animate to the item's position in the list
    _scrollController.animateTo(
      index * 90.0, // Assuming each item has a height of 50.0
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
              color: Colors.cyan,
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
          final countries = context.read<CountryCtrl>().data;

          if (countries.isEmpty) {
            return const AppStatus(CaseStates.empty);
          }

          return ListView.builder(
            controller: _scrollController,
            itemCount: countries.length,
            itemBuilder: (context, index) => _Item(countries[index], false,
                highlightedIndex == index ? Colors.cyan : theme.dividerColor),
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
                    _Item(countries[index], true, theme),
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

class _Item extends StatelessWidget {
  const _Item(this.country, this.isBottomSheet, this.shadowColor);

  final CountryModel country;
  final bool isBottomSheet;
  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }

  Future<void> _launchUrl(String u) async {
    final Uri url = Uri.parse(u);

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $u');
    }
  }
}
//
