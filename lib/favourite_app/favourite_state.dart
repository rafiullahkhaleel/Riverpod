import 'package:riverpod_project/favourite_app/favourite_item.dart';

class FavouriteState {
  final List<FavouriteItems> allItems;
  final List<FavouriteItems> filteredItems;
  final String search;

  FavouriteState({
    required this.allItems,
    required this.filteredItems,
    required this.search,
  });

  FavouriteState copyWith({
    List<FavouriteItems>? allItems,
    List<FavouriteItems>? filteredItems,
    String? search,
  }) {
    return FavouriteState(
      allItems: allItems ?? this.allItems,
      filteredItems: filteredItems ?? this.filteredItems,
      search: search ?? this.search,
    );
  }
}
