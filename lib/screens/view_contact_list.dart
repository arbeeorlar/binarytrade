import 'package:binary_contact/screens/add_contact.dart';
import 'package:binary_contact/screens/view_contact.dart';
import 'package:binary_contact/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/user.dart';
import '../model/data.dart';
import './dashboard.dart';



Future<Data> fetchPost() async {
  final response = await http.get(Constant.url);

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Data.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class ViewContactListPage extends StatefulWidget {
  @override
  _ViewContactListPageState createState() => _ViewContactListPageState();
}

class _ViewContactListPageState extends State<ViewContactListPage> {

Future<Data> data;
final myController = TextEditingController();
List<User> favouriteUser;
String filter ;
bool favourite ;
  @override
  void initState() {
    super.initState();
    data = fetchPost();
    favourite =  false ;
    favouriteUser =  new List<User>();
    myController.addListener((){
       setState(() {
         filter = myController.text ; 
       });
    });
  }


@override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

    final emailTextField =  TextField(
      obscureText: false,
          style: style,
          controller: myController,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              fillColor: Colors.black,
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "search:",
              border:OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))
              ),
    ); 



    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).primaryColor,
      //   title: Text("Contact"),
      // ),
      body: Container(
        color: Colors.white70,
        padding: const EdgeInsets.only(right: 20,left: 20),
       
        child: Column(
          children: <Widget>[
           SizedBox(height: 10,),
           Padding(
             padding:EdgeInsets.all(15), 
               child: Container(
                 child:emailTextField
               ),
           ),
           
          //  SizedBox(height: 4,),
            Expanded(
             child: FutureBuilder<Data>(
              future: data,
              builder: (context, snapshot) {
              if (snapshot.hasData) {
                //print("----------"  + snapshot.data[].firstName);
                return  ListView.builder(
                  padding: EdgeInsets.only(left: 10.0),
                  itemCount: snapshot.data.data.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context,int index){
                     User user  =    User(id:snapshot.data.data[index]['id'],
                                             firstName: snapshot.data.data[index]['first_name'],
                                             lastName: snapshot.data.data[index]['last_name'],
                                             email: snapshot.data.data[index]['email'],
                                             phoneNumber: snapshot.data.data[index]['phone_no'],
                                             gender: snapshot.data.data[index]['gender'],
                                             dateOfBirth: snapshot.data.data[index]['date_of_birth']);
                    // final user = User.fromJson(json.decode(snapshot.data.data[index].toString()));
                    return filter == null || filter == "" ?  GestureDetector(
                      onTap: (){
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ViewContactPage(user:user)));
             
                      },
                    child:Card(
                      elevation: 10,
                     child: Container(
                        height: 120,
                        child:Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 25.0,
                               child:Container(
                                child: Icon(Icons.people,color: Colors.black,),
                              ),
                            ),
                            SizedBox(width: 10.0,),
                             Container(
                               padding: EdgeInsets.all(20.0),
                               child: Column(
                                 children: <Widget>[
                                     
                                     Text("${snapshot.data.data[index]['first_name']} ${snapshot.data.data[index]['last_name']}",
                                     textAlign: TextAlign.start,style:style,),
                                     SizedBox(height: 5.0,),
                                     Text("${snapshot.data.data[index]['email']}",style: TextStyle(fontFamily: 'Montserrat', fontSize: 15.0),),
                                 ],
                               ),
                             ),
                           Container(
                             height: 20,
                             width: 20,
                             padding: EdgeInsets.all(5),
                             child: IconButton(icon: Icon(favourite ? Icons.star_border:Icons.star), onPressed: (){
                                      setState(() {
                                         //update favourite
                                         favouriteUser.add(user);
                                         favourite = true ;
                                      });
                                },),
                            ),
                          ],
                        ),
                        )

                     ),
                   )
                  ): snapshot.data.data[index]['first_name'].contains(filter) ? 
                  new Card(child: new Text(snapshot.data.data[index]['first_name'])) 
                  : new Container();}
                );

              }else if (snapshot.hasError) {
                 print("${snapshot.error}");
                   return Text("${snapshot.error}");
              }
                return Center(
                  child: Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.all(5),
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                      valueColor : AlwaysStoppedAnimation(Colors.red),
                    ),
                  ),
                );
              }
             )
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddContactPage()));
              // Route route = MaterialPageRoute(builder: (context) => AddContactPage());
              // Navigator.push(context, route);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}