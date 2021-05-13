import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:torre/src/services/people_service.dart';
import 'package:torre/src/widgets/bios_list_widget.dart';

class PeopleSearchPage extends StatefulWidget {

  @override
  _PeopleSearchPageState createState() => _PeopleSearchPageState();
}

class _PeopleSearchPageState extends State<PeopleSearchPage> {

  final myTextController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final peopleService = Provider.of<PeopleService>(context);

    final page = Container(
        color: Colors.black,
        height: double.infinity,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container (

                padding: EdgeInsets.only(top: 40, bottom: 20, left: 15),
                child: Text('Search people',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 60, left: 20, right: 20),
                child: Row(
                    children: [
                      Container(
                        child: TextField(
                          controller: myTextController,
                        ),
                        width: MediaQuery.of(context).size.width * 0.7,
                      ),

                      IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          if (myTextController.text.length > 0)
                            peopleService.getPeopleSearch(myTextController.text);
                          setState(() {});
                        },
                      )
                    ]
                ),

              ),
              ( peopleService.people.length > 0 )
              ? Expanded(child: BiosListWidget( peopleService.people ))
              : Center( child: CircularProgressIndicator() ),
          ])
      );

    return page;
  }
}
