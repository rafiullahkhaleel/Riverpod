import 'package:flutter_riverpod/flutter_riverpod.dart';

final complexProvider = StateNotifierProvider<ComplexProvider, SearchState>((ref) {
  return ComplexProvider();
});

class ComplexProvider extends StateNotifier<SearchState> {
  ComplexProvider() : super(SearchState(search: '',isChanged: false));

  void search(String query) {
    state = state.copyWith(search: query);
  }
  void isChanged(bool value) {
    state = state.copyWith(isChanged: value);
  }
}

class SearchState {
  final String search;
  final bool isChanged;
  SearchState({required this.search,required this.isChanged});

  SearchState copyWith({String? search,bool? isChanged}) {
    return SearchState(search: search ?? this.search, isChanged: isChanged ?? this.isChanged);
  }
}
