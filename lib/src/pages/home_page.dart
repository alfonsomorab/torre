import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:torre/src/providers/jobs_provider.dart';
import 'package:torre/src/providers/people_provider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => new _NavigationModel(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _MyBottomNavigationBar(),
      ),
    );
  }
}

class _MyBottomNavigationBar extends StatelessWidget {

  const _MyBottomNavigationBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
      currentIndex: navigationModel.currentPage,
      onTap: (i) => navigationModel.currentPage = i,
      items: [
        BottomNavigationBarItem(
          icon: Icon( Icons.people ),
          title: Text('People')
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.business_center ),
          title: Text('Jobs')
        ),

      ]
    );
  }
}

class _Pages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavigationModel>(context);

    return PageView(
      controller: navigationModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Container(
          color: Colors.amber,
        ),
        Container(
          color: Colors.blueAccent,
        ),
      ],
    );
  }
}


class _NavigationModel with ChangeNotifier{
  int _currentPage = 0;
  PageController _pageController = new PageController();


  int get currentPage => this._currentPage;

  set currentPage( int value ){
    this._currentPage = value;
    _pageController.animateToPage(
        value,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOut
    );
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
