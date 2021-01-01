import 'package:flutter/material.dart';

class Offer extends StatelessWidget {
  final String title;
  final String discription;
  final String image;
  Offer({this.discription, this.image, this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      discription,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Image.asset(
                    image,
                    height: 50,
                    width: 80,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
