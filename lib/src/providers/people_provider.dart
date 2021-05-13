import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:torre/src/models/bio_model.dart';
import 'package:torre/src/models/people_model.dart';

class PeopleProvider {

  String _url = "search.torre.co";

  Future<People> getPeopleSearch() async{

    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('https://search.torre.co/people/_search/?lang=en&size=10&aggregate=true&offset=0'));

    // I have to replace this line with the query to search
    request.body = '''{\n    "name": {\n        "term": "alfonso mora"\n    }\n}\n''';
    request.headers.addAll(headers);

    final response = await request.send();

    if (response.statusCode == 200) {
      final r = await response.stream.bytesToString();
      People peopleResult = new People.fromJson(json.decode(r));

      for (var res in peopleResult.results) {
        print(res.name);
      }
    }
    else {
      print(response.reasonPhrase);
    }

    return null;
  }

}