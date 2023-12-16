import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talyen_store/view_model/product_view_model.dart';
import 'package:talyen_store/views/loginscreen.dart';
import 'package:talyen_store/views/productsscreen.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key,required this.username});
    var username;
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductViewModel>(
        builder: (context, value, child) {

      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(margin: EdgeInsets.all(10),
              child: CircleAvatar(
                  maxRadius: 80, backgroundImage: AssetImage("images/logo.jpg")),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Welcome ${username.text} in Talyen's Store ",
                style: TextStyle(fontSize: 18, decoration: TextDecoration.none,color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Everything you want find here",
                style: TextStyle(color: Colors.grey, fontSize: 16, decoration: TextDecoration.none,),
              ),
            ),
            Container(margin: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductsScreen(name: username),
                      ));
                  if(username!= null){

                  }

                },
                child: Text("Get Started",style: TextStyle(color: Colors.white),),
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.pinkAccent),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
