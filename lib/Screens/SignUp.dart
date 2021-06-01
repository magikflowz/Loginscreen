import 'package:login/Screens/LoginPage.dart';
import 'package:login/const/button_widget.dart';
import 'package:login/const/error_message_text.dart';
import 'package:login/const/spaces_widgets.dart';
import 'package:login/const/text_field.dart';
import 'package:login/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<UserController>(
          builder: (_) {
            return Container(
              child: SingleChildScrollView(
                child: Form(
                  key: _.formKeySignUp,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

   Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                      child: Text('Create New Account',
                          style: TextStyle(
                              fontSize: 40.0, fontWeight: FontWeight.bold)),
                    ),
                   
                  ],
                ),
              ),
                      textBox(
                        controller: _.firstNameController,
                        hint: 'First Name',
                        validator: (input) {
                          if (input.length < 4) {
                            return 'First name Should be contain atleast 4 letter';
                          }
                        },
                        onSave: (input) {
                          _.userData.firstName = input;
                        },
                      ),
                      spc20,
                      textBox(
                        controller: _.lastNameController,
                        hint: 'Last Name',
                        onSave: (input) {
                          _.userData.lastName = input;
                        },
                      ),
                      spc20,
                      textBox(
                        controller: _.signUpemailController,
                        hint: 'Email',
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Please Enter a Email';
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(input)) {
                            return 'Please Enter a Valid Email';
                          }
                        },
                        onSave: (input) {
                          _.userData.email = input;
                        },
                      ),
                      spc20,
                      textBox(
                          hint: 'Password',
                          texthide: true,
                          validator: (input) {
                            if (input.length < 8) {
                              return 'Password Should be  Contain Atleast 8 digit';
                            }
                          },
                          controller: _.signUppasswordController),
                    
                    
                 
                  
                      spc20,
                       errorMessageText(_.errorMessage),
                      if (_.errorMessage != '') spc20,
                        GestureDetector(
                          onTap: (){
                              onTap: () async {
                          final FormState formState =
                              _.formKeySignUp.currentState;
                          if (formState.validate()) {
                            print('Form is validate');
                           
                              _.signUp();
                           
                          } else {
                            print('Form is not Validate');
                          }
                        };
                          },
                          child:
                           Container(
                            height: 40.0,
                            color: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.red,
                                      style: BorderStyle.solid,
                                      width: 1.0),
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: 
                            Center(child: Text("Register",style: TextStyle(color: Colors.white),))
                            ),
                          ),
                          
                        ),
                        SizedBox(height: 20),
                            GestureDetector(
                              onTap:(){
                                Get.off( MyHomePage());
                              } 
                              ,
                              child: Container(
                              height: 40.0,
                              color: Colors.transparent,
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black,
                                        style: BorderStyle.solid,
                                        width: 1.0),
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: 
                              Center(child: Text("Go Back",style: TextStyle(color: Colors.white),))
                              ),
                          ),
                            ),
                    ],
                  ),
                ),
              ),
            );
          }, 
        ));
  }
}