import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_children_course/app/usecase.dart';
import 'package:flutter_children_course/model/country.dart';
import 'package:flutter_children_course/view_model/country_ctrl.dart';
import 'package:flutter_children_course/view_model/theme_ctrl.dart';
import 'package:url_launcher/url_launcher.dart';

//url launcher
class CountriesView extends StatelessWidget {
  const CountriesView({super.key});

  @override
  Widget build(BuildContext context) {
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
            itemCount: countries.length,
            itemBuilder: (context, index) => _Item(countries[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => const BottomSheet());
        },
        child: const Icon(CupertinoIcons.search),
      ),
    );
  }
}

class BottomSheet extends StatelessWidget {
  const BottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
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
                itemBuilder: (context, index) => _Item(countries[index]),
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
  const _Item(this.country);

  final CountryModel country;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).dividerColor;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.cyan, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 20,
        shadowColor: theme,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {
              _launchUrl(country.mapUrl);
            },
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
