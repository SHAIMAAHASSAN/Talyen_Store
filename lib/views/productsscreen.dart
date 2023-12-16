import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talyen_store/view_model/product_view_model.dart';
import 'package:talyen_store/views/cartscreen.dart';
import 'package:talyen_store/widget/productcard.dart';
class ProductsScreen extends StatelessWidget {
   ProductsScreen( {required this.name} );
 var name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Icon(
            Icons.location_on,
            color: Colors.grey[700],
          ),
        ),
        title: Text(
          'Egypt, Cairo',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.person,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CartScreen();
            },
          ),
        ),
        child: const Icon(Icons.shopping_bag),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          // good morning bro
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text("Good morning, ${name.text}",style: TextStyle(color: Colors.redAccent,fontSize: 16),),
          ),

          const SizedBox(height: 4),

          // Let's order fresh items for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Let's order Everything you want",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 24),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(),
          ),

          const SizedBox(height: 24),

          // categories -> horizontal listview
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Flash Sales",
              style: TextStyle(
                //fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.redAccent,
              ),
            ),
          ),

          // recent orders -> show last 3
          Expanded(
            child: Consumer<ProductViewModel>(
              builder: (context, value, child) {
                return GridView.builder(
                  padding: const EdgeInsets.all(12),
                  //physics: const NeverScrollableScrollPhysics(),
                  itemCount:value.productsList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.2,
                  ),
                  itemBuilder: (context, index) {
                    return ProductCard(
                      itemName:value.productsList[index].name ,
                      itemPrice: value.productsList[index].price ,
                      image: value.productsList[index].image ,
                      color: value.productsList[index].color ,
                      onPressed: () =>
                          Provider.of<ProductViewModel>(context, listen: false)
                              .addItemToCart(index),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
