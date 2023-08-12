import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/counter_cubit_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubitCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:
          // BlocListener<CounterCubitCubit, CounterCubitState>(
          //   listener: (context, state) {
          //     if (state.wasIncreamented) {
          //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //         content: Text('Increamented'),
          //         duration: const Duration(seconds: 1),
          //       ));
          //     } else {
          //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //         content: Text('Decreamented'),
          //         duration: const Duration(seconds: 1),
          //       ));
          //     }
          //   },
          // child:
          Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubitCubit, CounterCubitState>(
              builder: (context, state) {
                return Text(
                  '${state.counterValue}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
              listener: (context, state) {
                if (state.wasIncreamented) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Increamented'),
                    duration: Duration(seconds: 1),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Decreamented'),
                    duration: Duration(seconds: 1),
                  ));
                }
              },
            ),
            // BlocBuilder<CounterCubitCubit, CounterCubitState>(
            //   builder: (context, state) {
            //     return Text(
            //       '${state.counterValue}',
            //       style: Theme.of(context).textTheme.headlineMedium,
            //     );
            //   },
            // ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton.outlined(
                      onPressed: () {
                        BlocProvider.of<CounterCubitCubit>(context)
                            .increament();
                      },
                      icon: const Icon(CupertinoIcons.add)),
                  IconButton.filledTonal(
                      color: Colors.red,
                      onPressed: () {
                        BlocProvider.of<CounterCubitCubit>(context).decrement();
                      },
                      icon: const Icon(CupertinoIcons.minus))
                ],
              ),
            )
          ],
        ),
        // ),
      ),
    );
  }
}
