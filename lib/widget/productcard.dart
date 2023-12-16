import 'package:awesome_rating/awesome_rating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String itemName;
  final String itemPrice;
  final ImageProvider image;
  final color;
  void Function()? onPressed;

  ProductCard({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.image,
    required this.color,
    required this.onPressed,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  Color _color = Colors.grey;
  Color _colorStar = Colors.red;

  double rating=0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //floatingActionButton: FloatingActionButton(
      // backgroundColor: Colors.transparent,
      //  onPressed: () { },
      //  child:  Icon(Icons.favorite_border_outlined,size: 16,color: color,),
      //  ),
      body: Padding(
         padding: const EdgeInsets.all(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: widget.color,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // item image
              Padding(
                padding: EdgeInsets.all(5),
                  child: Image(
                    image: widget.image,
                    height:50,
                  )),

              // item name
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  widget.itemName,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
             Padding(
               padding: const EdgeInsets.fromLTRB(10, 0, 0, 7),
               child: Row(
                 children: [
                   AwesomeStarRating(),
                  // AwesomeStarRating(),
                 /* AwesomeStarRating(
                     starCount: 5,
                     //rating: 5.0,
                     size: 20.0,
                    // borderColor: Colors.orange,
                     //color:_colorStar,
                     //filledIconData: Icons.star,
                    //customRatingWidget: RatingWidget(full: Icon(Icons.star_outlined,color: Colors.orange,),
                      //  half: Icon(Icons.star_half_outlined,color: Colors.orange),
                      //  empty: Icon(Icons.star_border_purple500_outlined,)),
                     color: _colorStar,
                  //  onSelectedIconColor: Colors.orange,
                     borderColor: Colors.orange,
                     onRatingChanged: (double value){
                       setState((){
                         _colorStar= Colors.orange;
                        // _colorStar=Colors.orange;
                         rating = value;

                       });
                     },


                   ),

                   Padding(
                     padding: const EdgeInsets.only(left: 5),
                     child: Text(rating.toString()),
                   ),*/
               ]
               ),
             ),
              MaterialButton(
                onPressed: widget.onPressed,
                color: widget.color,
                child: Text(
                  "EGP" + widget.itemPrice,
                  style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 3, 1),
                  child: IconButton(
                    icon: Icon(Icons.favorite, size: 18,color: _color,),
                   color: _color,
                    //hoverColor: Colors.red,
                    onPressed: () {
                      setState(() {
                        _color = Colors.red;
                      });
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
