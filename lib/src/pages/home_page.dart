import 'package:flutter/material.dart';
import 'package:torre/src/providers/jobs_provider.dart';
import 'package:torre/src/providers/people_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final jobsProvider = new JobsProvider();
    final peopleProvider = new PeopleProvider();
    peopleProvider.getPeopleSearch();
    return Scaffold(
      body: SafeArea(

        child: Text("Holaaaa!!"),

      ),
    );
  }
}
