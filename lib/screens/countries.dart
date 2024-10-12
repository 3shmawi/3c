import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_children_course/ctrl/countries.dart';
import 'package:url_launcher/url_launcher.dart';

class CountriesPage extends StatefulWidget {
  const CountriesPage({super.key});

  @override
  State<CountriesPage> createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountriesCtrl, CountriesStates>(
      builder: (context, state) {
        final cubit = context.read<CountriesCtrl>();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.cyan,
            title: const Text('Countries'),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  cubit.getCountriesData();
                },
              ),
            ],
          ),
          body: state is CountriesLoading
              ? const Center(
                  child: Card(
                    elevation: 15,
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 10),
                          CircularProgressIndicator(),
                          SizedBox(height: 10),
                          Text("Loading data..."),
                        ],
                      ),
                    ),
                  ),
                )
              : Scrollbar(
                  controller: _scrollController,
                  thumbVisibility: true,
                  thickness: 8.0,
                  interactive: true,
                  radius: const Radius.circular(8.0),
                  child: ListView.builder(
                    controller: _scrollController,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 10,
                        child: ListTile(
                          subtitle: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () async {
                              final url = Uri.parse(
                                cubit.data[index].maps!.googleMaps!,
                              );
                              if (!await launchUrl(
                                url,
                                mode: LaunchMode.externalApplication,
                              )) {
                                throw Exception('Could not launch $url');
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                cubit.data[index].maps!.googleMaps!,
                                style: const TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                          title: Text(" ${cubit.data[index].name!.common!}"),
                          trailing: Image.network(
                            cubit.data[index].flags!.png!,
                            width: 40,
                          ),
                        ),
                      ),
                    ),
                    itemCount: cubit.data.length,
                  ),
                ),
          floatingActionButton: FloatingActionButton(
            onPressed: state is CountriesSuccess
                ? () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => const SearchResults());
                  }
                : null,
            child: const Icon(Icons.search),
          ),
        );
      },
    );
  }
}

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountriesCtrl, CountriesStates>(
      builder: (context, state) {
        final cubit = context.read<CountriesCtrl>();
        final data =
            cubit.filteredData.isEmpty ? cubit.data : cubit.filteredData;
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  cubit.filterCountries(value);
                },
                decoration: InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Scrollbar(
                thumbVisibility: true,
                thickness: 8.0,
                interactive: true,
                radius: const Radius.circular(8.0),
                // Rounded scrollbar corners

                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 10,
                      child: ListTile(
                        onTap: () async {
                          final url = Uri.parse(
                            data[index].maps!.googleMaps!,
                          );
                          if (!await launchUrl(
                            url,
                            mode: LaunchMode.externalApplication,
                          )) {
                            throw Exception('Could not launch $url');
                          }
                        },
                        leading: Text("${index + 1}"),
                        title: Text(data[index].name!.common!),
                        trailing: Image.network(
                          data[index].flags!.png!,
                          width: 40,
                        ),
                      ),
                    ),
                  ),
                  itemCount: data.length,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
