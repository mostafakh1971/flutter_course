import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/cubit/counter_cubit.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
              title: const Text("Counter"), centerTitle: true, actions: []),
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      CounterCubit().get(context).minus();
                    },
                    child: const Icon(Icons.minimize)),
                Text(
                  "${CounterCubit().get(context).count}",
                  style: const TextStyle(fontSize: 25),
                ),
                ElevatedButton(
                    onPressed: () {
                      CounterCubit().get(context).increment();
                    },
                    child: const Icon(Icons.add)),
              ],
            ),
          ),
        );
      },
    );
  }
}
