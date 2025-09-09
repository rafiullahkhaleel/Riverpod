import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/todo_app/item_provider.dart';

class ItemScreen extends ConsumerWidget {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          print('build items');
          final data = ref.watch(itemProvider);
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final items = data[index];
              return ListTile(
                title: Text(items.name),
                subtitle: Text(items.data),
                trailing: Row(mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                      onTap: (){
                        ref.read(itemProvider.notifier).update('Khan','5/5/2423',items.id);
                      },
                      child: Icon(Icons.edit)),
                  InkWell(
                      onTap: (){
                        ref.read(itemProvider.notifier).delete(items.id);
                      },
                      child: Icon(Icons.delete)),
                ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          print('build floatButton');
          return FloatingActionButton(
            onPressed: () {
              ref.read(itemProvider.notifier).addItem('Rafiullah', '1/2/2222');
            },
            child: Icon(Icons.add),
          );
        },
      ),
    );
  }
}
