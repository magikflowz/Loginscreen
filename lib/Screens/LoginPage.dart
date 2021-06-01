import 'package:login/Screens/SignUp.dart';
import 'package:login/controller/user_controller.dart';
import 'package:login/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<UserController>(builder: (_) {
        return Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
            "asset/background.png",
          ))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Form(
                    key: _.formKeyLogin,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: _.loginemailController,
                          decoration: InputDecoration(
                              labelText: 'EMAIL',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Please Enter a Email';
                            } else if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(input)) {
                              return 'Please Enter a Valid Email';
                            }
                          },
                        ),
                        SizedBox(height: 30.0),
                        TextFormField(
                          controller: _.loginpasswordController,
                          decoration: InputDecoration(
                              labelText: 'PASSWORD',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                          validator: (input) {
                            if (input.length < 8) {
                              return 'Password Should be  Contain Atleast 8 digit';
                            }
                          },
                          obscureText: true,
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          alignment: Alignment(1.0, 0.0),
                          padding: EdgeInsets.only(top: 15.0, left: 20.0),
                          child: InkWell(
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                        SizedBox(height: 100.0),
                        GestureDetector(
                          onTap: () {
                            _.signIn(); //we call this from controller,i use Getx statemanagemnt for easy flow and lastest
                            //and easy to user so sign is function or method that i call from controller un usercontroller
                          },
                          child: Container(
                            height: 40.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Colors.greenAccent,
                              color: Colors.red,
                              elevation: 7.0,
                              child: Center(
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        GestureDetector(
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
                                child: Center(
                                    child: Text(
                                  "Register",
                                  style: TextStyle(color: Colors.white),
                                ))),
                          ),
                        )
                      ],
                    ),
                  )),
              SizedBox(height: 15.0),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     Text(
              //       'New to Spotify ?',
              //       style: TextStyle(fontFamily: 'Montserrat'),
              //     ),
              //     SizedBox(width: 5.0),
              //     InkWell(
              //       onTap: () {
              //         Navigator.of(context).pushNamed('/signup');
              //       },
              //       child: Text(
              //         'Register',
              //         style: TextStyle(
              //             color: Colors.green,
              //             fontFamily: 'Montserrat',
              //             fontWeight: FontWeight.bold,
              //             decoration: TextDecoration.underline),
              //       ),
              //     )
              //   ],
              // )
            ],
          ),
        );
      }),
    );
  }
}
