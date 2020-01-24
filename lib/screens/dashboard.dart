
import 'package:binary_contact/screens/view_contact_list.dart';
import 'package:flutter/material.dart';
import './dashboard.dart';



class DashboardPage  extends StatefulWidget {
  @override
  _DashboardStatePage createState() => _DashboardStatePage();
}

class _DashboardStatePage extends State<DashboardPage> {

int _currentIndex = 0;
final List<Widget> _children = [ViewContactListPage(),null];


OnTapClickEvent(int  index){
    setState(() {
         _currentIndex =  index ;
    });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Contact"),
      ),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey,
        currentIndex: _currentIndex, // this will be set when a new tab is tapped
        onTap: OnTapClickEvent,
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.all_inclusive),
           title: new Text('All'),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.favorite),
           title: new Text('Favourite'),
         ),
           
          ],
        ),
    );
  }
}