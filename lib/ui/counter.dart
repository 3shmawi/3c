import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_children_course/state_management/counter.dart';
import 'package:flutter_children_course/state_management/posts.dart';
import 'package:flutter_children_course/state_management/theme.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit()..fetchPosts(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Counter App'),
            actions: [
              Switch.adaptive(
                value: context.watch<ThemeCubit>().state,
                onChanged: (_) {
                  context.read<ThemeCubit>().toggleTheme();
                },
              ),
            ],
          ),
          body: BlocListener<ThemeCubit, bool>(
            listenWhen: (_, current) => current == false || current == true,
            listener: (context, state) {
              if (state) {
                print('Yes #################§');
              }
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<CounterCubit, int>(
                    buildWhen: (_, current) => current.isEven,
                    builder: (context, counter) {
                      return Text(
                        'Current count: $counter',
                        style: const TextStyle(fontSize: 24),
                      );
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterCubit>().increment();
                    },
                    child: const Text("Inerement"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterCubit>().decrement();
                    },
                    child: const Text("Dederement"),
                  ),
                  Expanded(
                    child: BlocBuilder<PostCubit, PostsStates>(
                      builder: (context, state) {
                        if (state is PostsLoaded) {
                          return ListView.builder(
                            itemCount: 20,
                            itemBuilder: (context, index) =>
                                Text(index.toString()),
                          );
                        } else if (state is PostsError) {
                          return Text('Error fetching posts');
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
