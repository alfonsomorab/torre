import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:torre/src/models/jobs_models.dart';

class JobsProvider {
  String _url = "search.torre.co";

  Future<Jobs> getJobsSearch() async{

    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('https://search.torre.co/opportunities/_search/?lang=en&size=10&aggregate=true&offset=0'));

    // I have to replace this line with the query to search
    request.body = '''{\n    "bestfor": {\n        "username": "alfonsomorabravo"\n    }\n}\n''';
    request.headers.addAll(headers);

    final response = await request.send();

    if (response.statusCode == 200) {
      final r = await response.stream.bytesToString();
      Jobs jobs = new Jobs.fromJson(json.decode(r));

      for (var res in jobs.results) {
        print(res.objective);
      }
    }
    else {
      print(response.reasonPhrase);
    }

    return null;
  }
}