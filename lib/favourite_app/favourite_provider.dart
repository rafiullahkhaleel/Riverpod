import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/favourite_app/favourite_item.dart';
import 'package:riverpod_project/favourite_app/favourite_state.dart';

final favouriteProvider =
    StateNotifierProvider<FavouriteNotifier, FavouriteState>((ref) {
      return FavouriteNotifier();
    });

class FavouriteNotifier extends StateNotifier<FavouriteState> {
  FavouriteNotifier()
    : super(FavouriteState(allItems: [], filteredItems: [], search: ''));
  void addItem() {
    List<FavouriteItems> item = [
      FavouriteItems(name: 'Rafi', id: 1, favourite: false),
      FavouriteItems(name: 'Jan', id: 2, favourite: true),
      FavouriteItems(name: 'Kamran', id: 3, favourite: false),
      FavouriteItems(name: 'Uamr', id: 4, favourite: true),
      FavouriteItems(name: 'Hanfi', id: 5, favourite: false),
      FavouriteItems(name: 'Asad', id: 6, favourite: true),
    ];
    state = state.copyWith(
      allItems: item.toList(),
      filteredItems: item.toList(),
    );
  }

  void filtered(String query) {
    if (query.isEmpty) {
      state = state.copyWith(filteredItems: state.allItems);
    } else {
      final results = state.allItems.where((item) {
        return item.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
      state = state.copyWith(filteredItems: results);
    }
  }
  void favourite(String option) {
    if (option == 'All') {
      state = state.copyWith(filteredItems: state.allItems);
    } else {
      final results = state.allItems.where((item) {
        return item.favourite == true;
      }).toList();
      state = state.copyWith(filteredItems: results);
    }
  }

}
