import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'read_game.dart';


class ApiService {
  static Future<List<Readgame>> read() async {
    final String url = "https://www.gamerpower.com/api/giveaways";
    try{
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return compute(readgameFromJson, response.body);
      } 
      else {
        throw Exception("Error status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Network error: ${e.toString()}");
    }
  }
}