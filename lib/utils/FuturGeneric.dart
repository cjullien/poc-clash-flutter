import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:adress_book/utils/Constantes.dart' as _constantes;

Future<dynamic> fetchDynamic() async {
  final response = await http.get(Uri.parse(_constantes.Url.url));
  if (response.statusCode == 200) {
    return jsonDecode(response.body)['_embedded']['users'];
  } else {
    throw Exception('Failed to load dynamic');
  }
}

Future<dynamic> deleteDynamic(int id) async {
  final url = Uri.parse(_constantes.Url.url + '/${id}');
  final request = http.Request("DELETE", url);
  request.headers.addAll(<String, String>{
    "Accept": "application/json",
  });
  final response = await request.send();
  if (response.statusCode != 204) return Future.error("error: status code ${response.statusCode}");
  return await response.stream.bytesToString();
}
