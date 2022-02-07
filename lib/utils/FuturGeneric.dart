import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:adress_book/utils/Constantes.dart' as _constantes;

Future<dynamic> fetchDynamic() async {
  final response = await http.get(Uri.parse(_constantes.Url.url2 + '/1'));
  if (response.statusCode == 200) {
    return jsonDecode(response.body._embedded);
  } else {
    throw Exception('Failed to load dynamic');
  }
}
