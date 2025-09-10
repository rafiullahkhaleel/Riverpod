class FavouriteItems {
  final String name;
  final int id;
  final bool favourite;

  FavouriteItems({
    required this.name,
    required this.id,
    required this.favourite,
  });

  FavouriteItems copyWith({String? name, int? id, bool? favourite}) {
    return FavouriteItems(
      name: name ?? this.name,
      id: id ?? this.id,
      favourite: favourite ?? this.favourite,
    );
  }
}
