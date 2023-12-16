import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:talyen_store/view_model/product_view_model.dart';
import 'package:talyen_store/views/homescreen.dart';
import 'package:talyen_store/views/productsscreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var username= TextEditingController();
    return Consumer<ProductViewModel>(
        builder: (context, value, child) { return Scaffold(

          body: SafeArea(
            child: Container(
              margin: EdgeInsets.all(40),
              padding: EdgeInsets.all(40),
              child: Column(
                children: [
                  CircleAvatar(backgroundImage:AssetImage("images/logo.jpg") ,maxRadius: 60,) ,
                  Container(
                    width: 500,
                    margin: EdgeInsets.all(15),
                    child: TextField(
                      controller: username,

                      decoration: const InputDecoration(
                        filled: true,
                        labelText: 'Username',
                      ),
                    ),
                  ),

                  Container(
                    width: 500,
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      decoration: const InputDecoration(
                        filled: true,
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(3),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          child: const Text(
                            'CANCEL',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.pink[100],
                          ),
                          onPressed: () { Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>HomeScreen(username: username,),
                          ));},
                        ),
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        ElevatedButton(
                          child: const Text('Sign In',style: TextStyle(color: Colors.white),),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.pinkAccent),),
                          onPressed: () async{
                            await (  Fluttertoast.showToast(
                              msg: 'Please enter a username',
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              backgroundColor: Colors.white,

                            ));
                            await Future.delayed(Duration(milliseconds:700));
                            RouteSettings routeSettings =
                            RouteSettings(arguments: {"text"});

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(username: username),
                                settings: routeSettings,
                              ),
                            );



                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );});
  }
}

