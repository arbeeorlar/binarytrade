import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../model/user.dart';
import '../util/constants.dart';
import 'view_contact_list.dart';
import './dashboard.dart';

class AddContactPage extends StatefulWidget {
  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {

TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
final myController = TextEditingController();
final firstNameController = TextEditingController();
final lastNameController = TextEditingController();
final emailNameController = TextEditingController();
final phoneNumberController = TextEditingController();
final dobController = TextEditingController();
final genderController = TextEditingController();
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backButton("Add Contact"),
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
                           controller: firstNameController,
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
                           controller: lastNameController,
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
                            controller: emailNameController,
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
                            controller: dobController,
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
                            controller: genderController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              hintText: "gender:",
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
                       Text( "Mobile No:",style: style,),
                      SizedBox(
                          height: 45,
                          width: 259,
                         child: TextField(
                            controller: phoneNumberController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              hintText: "Mobile No:",
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
            onPressed: () async {

              if(firstNameController.text.isEmpty){
                   showAlertDialog("Firstname is Required",context);
              }else if(lastNameController.text.isEmpty){
                   showAlertDialog("Last Name is Required",context);
              }else if(genderController.text.isEmpty){
                    showAlertDialog("Gender is Required",context);
              }else if(emailNameController.text.isEmpty){
                  showAlertDialog("Email is Required",context);
              }else if(phoneNumberController.text.isEmpty){
                   showAlertDialog("PhoneNumber is Required",context);
              }else if(dobController.text.isEmpty){
                  showAlertDialog("DOB is Required",context);
              }else{
                 User user  =  new  User(
                    firstName: firstNameController.text,
                    lastName: lastNameController.text,
                    phoneNumber: phoneNumberController.text,
                    gender: genderController.text,
                    dateOfBirth: dobController.text,
                    email: emailNameController.text,
                 );
                 

                    String url = Constant.url;
                    Map<String, String> headers = {"Content-type": "application/json"};
                    
                    String json = jsonEncode(user.toJson2());

                    print("${json}");

                    // make POST request
                    Response response = await post(url, headers: headers, body: json);
                    // check the status code for the result
                    int statusCode = response.statusCode;
                    // this API passes back the id of the new item added to the body
                    String body = response.body;
                 
                     if(statusCode == 200){
                        // showAlertDialog("Request Saved Successfully",context);
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardPage()));
            
                     }

              }
             
                
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


void   showAlertDialog(String  title,BuildContext context){
    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Contact"),
                            content: Text(title),
                            actions: <Widget>[
                              FlatButton(
                                child: Text("Ok"),
                                onPressed: (){
                                  
                                },
                              )
                            ],
                          );
                        },
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