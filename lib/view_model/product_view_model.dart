import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talyen_store/model/user_model.dart';

import '../model/product_model.dart';

class ProductViewModel extends ChangeNotifier {
  final List<Product> productsList = [
    Product(
        image: AssetImage("images/image1.jpg"),
        name: "Defacto Baby Girl Checked Strap Crinkle Dress ",
        price: " 499.00",
        color: Colors.pink[50]),
    Product(
        image: AssetImage("images/image2.jpg"),
        name: "Mothercare Floral Tiered Dress",
        price: " 450.00",
        color: Colors.green[100]),
    Product(
        image: AssetImage("images/image3.jpg"),
        name: "A Cute Baby Dress In A Dress",
        price: " 349.00",
        color: Colors.yellow[100]),
    Product(
        image: AssetImage("images/image4.jpg"),
        name: "Children's Dress Of Ribbed Rib And Tulle",
        price: " 399.00",
        color: Colors.brown[200]),
    Product(
        image: AssetImage("images/image5.jpg"),
        name: "Kids FANZEY Girls Ruffle Trim One Shoulder Dress",
        price: " 499.00",
        color: Colors.red[100]),
    Product(
        image: AssetImage("images/image6.jpg"),
        name:
            "Jewelry Kids Set Necklaces, Bracelet, Earring And Ring Gold Plated",
        price: " 350.00",
        color: Colors.orange[100]),
    Product(
        image: AssetImage("images/image7.jpg"),
        name: "Elastic Hair Tie Multi-Color 4 Pcs",
        price: " 50.00",
        color: Colors.pink[50]),
    Product(
        image: AssetImage("images/image8.jpg"),
        name:
            "2pcs Anti-UV Sunglasses Kid Boy Baby Girls Sun Flower Pink+White",
        price: " 215.00",
        color: Colors.red[200]),
    Product(
        image: AssetImage("images/image9.jpg"),
        name:
            "Fashion Flat Sneakers Shoes - Comfortable Slip-on Shoes For Kids - Pink Color",
        price: " 325.00",
        color: Colors.pink[100]),
    Product(
        image: AssetImage("images/image10.jpg"),
        name: "Flat Sneaker Shoes Casual For Kids -Rose",
        price: " 350.00",
        color: Colors.purple[200]),
  ];


  List <Product> cartList = <Product>[];
  User user  = User ("");
  String get username => user.username;

  get cartItems => cartList;

  get  products=> productsList;

  void updateUsername(String newUsername){
    user.username=newUsername;
    notifyListeners();
  }
  // add item to cart
  void addItemToCart(int index) {
cartList.add(productsList[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    cartList.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i].price);
    }
    return totalPrice.toStringAsFixed(2);
  }
}


