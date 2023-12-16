import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AwesomeStarRating extends StatefulWidget {
  @override
  _AwesomeStarRatingState createState() => _AwesomeStarRatingState();
}

class _AwesomeStarRatingState extends State<AwesomeStarRating> {
  double rating = 0;
  final Color _selectedStarColor = Colors.yellow;
  final Color _unselectedStarColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(Icons.star, color: Colors.yellow),
          onRatingUpdate: (double value) {
            setState(() {
              rating=value;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(rating.toString()),
        ),

      ],
    );
  }
}