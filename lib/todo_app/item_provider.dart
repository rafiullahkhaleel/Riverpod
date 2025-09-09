import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/todo_app/item_model.dart';

final itemProvider = StateNotifierProvider<ItemNotifier, List<ItemModel>>((
  ref,
) {
  return ItemNotifier();
});

class ItemNotifier extends StateNotifier<List<ItemModel>> {
  ItemNotifier() : super([]);

  void addItem(String name, String data) {
    final item = ItemModel(
      name: name,
      data: data,
      id: DateTime.now().millisecond.toString(),
    );
    state.add(item);
    state = state.toList();
  }

  void delete(String id) {
    state.removeWhere((item) {
      return item.id == id;
    });
    state = state.toList();
  }

  void update(String name, String data, String id) {
    final targetIndex = state.indexWhere((items) => items.id == id);
    state[targetIndex].name = name;
    state[targetIndex].data = data;
    state = state.toList();
  }
}
