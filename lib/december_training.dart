import 'package:flutter/material.dart';

//Scaffold
//Wrap
//Transform
//Position
//WheelScrollView
//AnimateCrossFade
//Tab bar
class DecemberTraining extends StatefulWidget {
  const DecemberTraining({super.key});

  @override
  State<DecemberTraining> createState() => _DecemberTrainingState();
}

class _DecemberTrainingState extends State<DecemberTraining> {
  bool isFirst = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('December Training'),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(icon: const Icon(Icons.calendar_today), text: 'Today'),
              Tab(icon: const Icon(Icons.calendar_view_day), text: 'Week'),
              Tab(icon: const Icon(Icons.calendar_view_month), text: 'Month'),
            ],
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isFirst = !isFirst;
                  });
                },
                child: AnimatedCrossFade(
                  crossFadeState: isFirst
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  firstChild: const Icon(
                    Icons.flutter_dash,
                    size: 150,
                  ),
                  secondChild: const Icon(
                    Icons.calendar_today,
                    size: 150,
                  ),
                  duration: const Duration(seconds: 1),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                      height: 200,
                      child: ListView.builder(
                        itemCount: 100,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 50,
                            color: Colors.blue,
                            child: Center(
                              child: Text('$index'),
                            ),
                          );
                        },
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 200,
                        width: 300,
                        foregroundDecoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.cyan,
                              Colors.purple.withOpacity(.7),
                            ],
                            begin: Alignment.bottomCenter,
                            end: AlignmentDirectional.center,
                            // Gradient starts from the center
                          ),
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: const Icon(
                          Icons.flutter_dash,
                          size: 200,
                        ),
                      ),
                    ),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        itemCount: 100,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text('$index'),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showSnackBar(context);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  _showSnackBar(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('This is a Snackbar'),
      ),
    );
  }
}
