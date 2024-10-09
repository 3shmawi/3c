import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/population_ctrl.dart';

class UsaPopulation extends StatelessWidget {
  const UsaPopulation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text("USA Population"),
      ),
      body: BlocBuilder<PopulationCtrl, USAStates>(
        builder: (context, state) {
          final data = context.read<PopulationCtrl>().data;
          return ListView.separated(
            itemCount: data.length,
            itemBuilder: (context, index) => Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: const Icon(
                    CupertinoIcons.globe,
                    color: Colors.cyan,
                  ),
                  title: Text(data[index].year),
                  trailing: Text(data[index].count),
                ),
              ),
            ),
            separatorBuilder: (context, index) => const Divider(
              color: Colors.cyan,
            ),
          );
        },
      ),
    );
  }
}
