import 'dart:convert';
import 'dart:io';

class ApiClient {
  final httpClient = HttpClient();

  Future<List<dynamic>> getPosts() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final request = await httpClient.getUrl(url);
    final response = await request.close();
    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();
    final json = jsonDecode(jsonString) as List<dynamic>;
    return json;
  }
}
