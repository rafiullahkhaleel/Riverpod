import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_project/get_api/api_model.dart';

final postProvider = FutureProvider<List<PostModel>>((ref) async {
  try {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {
        "Content-Type": "application/json",
        "User-Agent": "FlutterApp/1.0", // custom user-agent
      },
    );
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      List<PostModel> postList =
          data.map((i) {
            return PostModel.fromJson(i);
          }).toList();
      return postList;
    } else {
      throw Exception("Failed with status code: ${response.statusCode}");
    }
  } catch (e,st) {
    print("❌ Error: $e");
    print("📌 StackTrace: $st");
    throw Exception("Something went wrong: $e");
  }
});
