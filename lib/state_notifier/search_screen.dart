import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/state_notifier/search_provider.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(
            builder: (context, ref, child) {
              print('build textfield');
              final state = ref.read(complexProvider.notifier);
              return TextField(
                onChanged: (value) {
                  state.search(value);
                },
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              print('build text');
              final search = ref.watch(complexProvider.select((state)=>state.search));
              return Text(search);
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              print('build toggleButton');
              final state = ref.watch(complexProvider.select((state)=>state.isChanged));
              return Switch(value:state , onChanged: (value) {
                ref.read(complexProvider.notifier).isChanged(value);
              });
            },
          )
        ],
      ),),
    );
  }
}
