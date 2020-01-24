import 'package:flutter/material.dart';
import '../model/user.dart';
import './dashboard.dart';


class EditContactPage extends StatefulWidget {

 User user ; 

 EditContactPage({this.user});

  @override
  _EditContactPageState createState() => _EditContactPageState(user:user);
}

class _EditContactPageState extends State<EditContactPage> {
User user ; 
TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

final myController = TextEditingController();
final firstNameController = TextEditingController();
final lastNameController = TextEditingController();
final emailNameController = TextEditingController();
final phoneNumberController = TextEditingController();
final dobController = TextEditingController();
final genderController = TextEditingController();

_EditContactPageState({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backButton("Update Contact"),
      body: Scaffold(
       body: Container(
         
          child: Column(
            children: <Widget>[
             SizedBox(height: 40,),
                
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
              SizedBox(height: 20,),
              Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: <Widget>[
                       Text( "Firstname:",style: style,),
                      
                       SizedBox(
                          height: 45,
                          width: 259,
                         child: TextField(
                            controller: TextEditingController()..text = user.firstName,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              hintText: "firstname:",
                              border:OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
                            ),                         
                          ),
                       ) 
                     ],
                   ), 
              ),
     
      Container(
                 margin: const EdgeInsets.fromLTRB(20,20,20,20),
                  height: 1.5,
                  color: Colors.black
                ),
       Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: <Widget>[
                       Text( "Lastname:",style: style,),
                      SizedBox(
                          height: 45,
                          width: 259,
                         child: TextField(
                            controller: TextEditingController()..text = user.lastName,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              hintText: "lastname:",
                              border:OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
                            ),                         
                          ),
                       ) 
                        
                     ],
                   ), 
              ),
     
      Container(
                 margin: const EdgeInsets.fromLTRB(20,20,20,20),
                  height: 1.5,
                  color: Colors.black
                ),
       Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: <Widget>[
                       Text( "Email:",style: style,),
                     SizedBox(
                          height: 45,
                          width: 259,
                         child: TextField(
                            controller: TextEditingController()..text = user.email,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              hintText: "email:",
                              border:OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
                            ),                         
                          ),
                       ) 
                        
                     ],
                   ), 
              ),
     
      Container(
                 margin: const EdgeInsets.fromLTRB(20,20,20,20),
                  height: 1.5,
                  color: Colors.black
                ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: <Widget>[
                       Text( "DOB:",style: style,),
                      SizedBox(
                          height: 45,
                          width: 259,
                         child: TextField(
                            controller: TextEditingController()..text = user.dateOfBirth,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              hintText: "dob:",
                              border:OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
                            ),                         
                          ),
                       ) 
                        
                     ],
                   ), 
              ),
     
      Container(
                 margin: const EdgeInsets.fromLTRB(20,20,20,20),
                  height: 1.5,
                  color: Colors.black
                ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: <Widget>[
                       Text( "Gender:",style: style,),
                      SizedBox(
                          height: 45,
                          width: 259,
                         child: TextField(
                            controller: TextEditingController()..text = user.gender,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              hintText: "firstname:",
                              border:OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
                            ),                         
                          ),
                       ) 
                        
                     ],
                   ), 
              ),

      SizedBox(height: 60,),

      Material(
          elevation: 5.0,
          
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.redAccent,
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width / 2,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {

                
            },
            child: Text("Save",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
                   
          ),
        ),

            ],
          
         ),
       ),
      ),
    );
  }

  AppBar backButton(String title) {
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
              
      );
}
}