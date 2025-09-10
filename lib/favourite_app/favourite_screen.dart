import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/favourite_app/favourite_provider.dart';

class FavouriteScreen extends ConsumerWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              ref.read(favouriteProvider.notifier).favourite(value);
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(value: 'All', child: Text('All')),
                PopupMenuItem(value: 'Favourite', child: Text('Favourite')),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              ref.read(favouriteProvider.notifier).filtered(value);
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final data = ref.watch(favouriteProvider);
              return Expanded(
                child: ListView.builder(
                  itemCount: data.filteredItems.length,
                  itemBuilder: (context, index) {
                    final items = data.filteredItems[index];
                    return ListTile(
                      title: Text(items.name),
                      trailing:
                          items.favourite
                              ? Icon(Icons.favorite)
                              : Icon(Icons.favorite_border),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          print('build floatButton');
          return FloatingActionButton(
            onPressed: () {
              ref.read(favouriteProvider.notifier).addItem();
            },
            child: Icon(Icons.add),
          );
        },
      ),
    );
  }
}
