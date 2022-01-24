import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:helloworld/utils/Constantes.dart' as _constantes;

Future<dynamic> fetchDynamic() async {
  final response = await http.get(Uri.parse(_constantes.Url.url1));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load dynamic');
  }
}
