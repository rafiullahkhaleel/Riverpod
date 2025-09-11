import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/future_provider/future_provider.dart';

class FutureScreen extends ConsumerWidget {
  const FutureScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(futureProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Future Provider'),centerTitle: true,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            provider.when(
              data: (value) => Flexible(child: Text(value.count.toString())),
              error: (error, trace) => Text(error.toString()),
              loading: () => CircularProgressIndicator(),
            ),
            provider.when(
              data:
                  (value) => Flexible(
                    flex: 2,
                    child: ListView.builder(
                      itemCount: value.name.length,
                      itemBuilder: (context, index) {
                        final data = value.name[index];
                        return Center(child: Text(data));
                      },
                    ),
                  ),
              error: (error, trace) => Text(error.toString()),
              loading: () => CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
