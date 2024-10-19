import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_children_course/model/country.dart';
import 'package:flutter_children_course/view_model/country_ctrl.dart';
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
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: BlocBuilder<CountryCtrl, CountryStates>(
        builder: (context, state) {
          final countries = context.read<CountryCtrl>().data;
          if (state is CountryDataLoading) {
            return const Center(child: CircularProgressIndicator());
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
    return Card(
      elevation: 10,
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
