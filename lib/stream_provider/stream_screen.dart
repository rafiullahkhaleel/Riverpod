import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/stream_provider/stream_provider.dart';

class StreamScreen extends ConsumerWidget {
  const StreamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Steam Provider')),
      body: Consumer(
        builder: (context, ref, child) {
          final provider = ref.watch(streamProvider);
          return Center(
            child: provider.when(
              data:
                  (price) => Text(
                    price.toStringAsFixed(2).toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              error: (error, trace) => Text('Error $error'),
              loading: () => CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
