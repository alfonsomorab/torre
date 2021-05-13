import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:torre/src/models/people_models.dart';

class PeopleService with ChangeNotifier{

  List<Bio> people = [];

  PeopleService() {
    this.getPeopleSearchRandom();
  }

  getPeopleSearchRandom() async{

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
      PeopleResponse peopleResult = new PeopleResponse.fromJson(json.decode(r));

      this.people.addAll(peopleResult.results);
    }
    else {
      print(response.reasonPhrase);
    }

    notifyListeners();
  }

  getPeopleSearch(String query) async{

    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('https://search.torre.co/people/_search/?lang=en&size=10&aggregate=true&offset=0'));

    // I have to replace this line with the query to search
    request.body = '''{\n    "name": {\n        "term": "$query"\n    }\n}\n''';
    request.headers.addAll(headers);

    final response = await request.send();

    if (response.statusCode == 200) {
      final r = await response.stream.bytesToString();
      PeopleResponse peopleResult = new PeopleResponse.fromJson(json.decode(r));

      this.people = peopleResult.results;
    }
    else {
      print(response.reasonPhrase);
    }

    notifyListeners();
  }

}