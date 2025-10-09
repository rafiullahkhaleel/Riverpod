import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/get_api/get_api_provider.dart';

class GetApiScreen extends ConsumerWidget {
  const GetApiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Get Api'), centerTitle: true,backgroundColor: Colors.white,),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final provider = ref.watch(postProvider);
            return provider.when(
              data:
                  (data) => ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final item = data[index];
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 4),
                        elevation: 3,
                        child: ListTile(
                          title: Text(item.title ?? ''),
                          subtitle: Text(item.body ?? ''),
                        ),
                      );
                    },
                  ),
              error: (error, trace) {
                print("Error $error    StackTrace $trace");
                return Text('$error\n$trace');
              },
              loading: () => CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
