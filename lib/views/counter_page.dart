import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_children_course/view_model/counter_ctrl.dart';
import 'package:flutter_children_course/view_model/theme_ctrl.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text('Counter App'),
        actions: [
          BlocBuilder<ThemeCtrl, bool>(
            builder: (context, state) {
              return IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: Colors.cyan,
                ),
                onPressed: context.read<ThemeCtrl>().toggleTheme,
                icon: Icon(
                  state ? Icons.dark_mode_outlined : Icons.lightbulb_sharp,
                  color: state ? Colors.white : Colors.yellow,
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<Ctrl, AppCtrlStates>(
        builder: (context, state) {
          final cubit = context.read<Ctrl>();
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _counter(cubit.counter),
                  style: const TextStyle(
                    color: Colors.cyan,
                    fontSize: 60,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.cyan,
                      ),
                      onPressed: cubit.increment,
                      icon: const Icon(
                        Icons.add,
                      ),
                    ),
                    IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.cyan,
                      ),
                      onPressed: cubit.reset,
                      icon: const Icon(
                        Icons.refresh,
                      ),
                    ),
                    IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.cyan,
                      ),
                      onPressed: cubit.decrement,
                      icon: const Icon(
                        Icons.remove,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _counter(int counter) {
    if (counter.toString().length == 1) {
      return "0$counter";
    }
    return counter.toString();
  }
}
