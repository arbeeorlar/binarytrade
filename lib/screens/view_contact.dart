import 'package:binary_contact/model/user.dart';
import 'package:flutter/material.dart';
import 'edit_contact.dart';
import 'view_contact_list.dart';
import './dashboard.dart';

class ViewContactPage extends StatefulWidget {
  
  User user ;
  
  ViewContactPage({this.user});

  @override
  _ViewConatctPageState createState() => _ViewConatctPageState(user:this.user);
}

class _ViewConatctPageState extends State<ViewContactPage> {
   User user ;

TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
_ViewConatctPageState({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:backButton("View Contact",this.user),
      body: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
                SizedBox(height: 80,),
                
                Center(
                  child:SizedBox(
                   height: 100,
                   width: 100,
                   child: CircleAvatar(
                           radius: 100.0,
                           backgroundImage: AssetImage(
                             "assets/images/lion_head.png"
                           ),
                         ),
                  )        
                ),
               SizedBox(height: 10,),
                Center(
                  child: Container(
                  child: Text(user.firstName),
                
                  ),
                ),
                                 
              Text("${user.firstName} ${user.lastName} ",textAlign: TextAlign.center,style:style,),
                                     SizedBox(height: 5.0,),
             Text("${user.email}",style: TextStyle(fontFamily: 'Montserrat', fontSize: 15.0),),


                 Container(
                 margin: const EdgeInsets.fromLTRB(20,40,20,20),
                  height: 1.5,
                  color: Colors.black
                ),

              Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: <Widget>[
                       Text( "Date of Birth:",style: style,),
                       Text( user.dateOfBirth,style: style,textAlign: TextAlign.right,),
                        IconButton(
                          iconSize: 30.0,
                          color: Colors.blueGrey,
                         alignment: Alignment.topRight,
                         icon: const Icon(Icons.cake),
                          onPressed: () {

                          },
                        )
                        
                     ],
                   ), 
              ),
     
      Container(
                 margin: const EdgeInsets.fromLTRB(20,40,20,20),
                  height: 1.5,
                  color: Colors.black
                ),
              Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: <Widget>[
                       Text( "Date of Birth:",style: style,),
                       Text( user.gender,style: style,textAlign: TextAlign.right,),
                        IconButton(
                          iconSize: 30.0,
                          color: Colors.blueGrey,
                         alignment: Alignment.topRight,
                         icon: const Icon(null),
                          onPressed: () {

                          },
                        )
                        
                     ],
                   ), 
              ),
                                
              Container(
                 margin: const EdgeInsets.fromLTRB(20,40,20,20),
                  height: 1.5,
                  color: Colors.black
                ),
              Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: <Widget>[
                       Text( "Mobile:",style: style,),
                       Text( user.phoneNumber,style: style,textAlign: TextAlign.right,),
                        IconButton(
                          iconSize: 30.0,
                          color: Colors.blueGrey,
                         alignment: Alignment.topRight,
                         icon: const Icon(Icons.call),
                          onPressed: () {

                          },
                        )
                        
                     ],
                   ), 
              ),

            ],
         ),
        ),
      ),
    );
  }
  AppBar backButton(String title,User user) {
    return AppBar(
             backgroundColor: Theme.of(context).primaryColor,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardPage()));
            
                },
                ),
          title: 
              Text(title,
              style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18,fontStyle: FontStyle.normal),
              ),
              elevation: 0.0,
              actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.edit),
                        onPressed: () {
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EditContactPage(user: user,)));
            
                      },
                ),
              ],
      );
}
}