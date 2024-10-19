import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/country_ctrl.dart';

class TestCountry extends StatelessWidget {
  const TestCountry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CountryCtrl, CountryStates>(
        builder: (context, state) {
          final countries = context.read<CountryCtrl>().data;
          if (state is CountryDataLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.separated(
            itemCount: countries.length,
            itemBuilder: (context, index) => const Text("data"),
            separatorBuilder: (context, index) => const Divider(
              color: Colors.cyan,
            ),
          );
        },
      ),
    );
  }
}
