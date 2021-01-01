import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/resturant_app/views/home/menu/add_more_menu_fields.dart';
import 'package:food_delivery_app/resturant_app/views/home/menu/edit_menu_items.dart';

class OfferCard extends StatelessWidget {
  final String title;
  final String price;
  final List<Widget> children;
  final Function delet;
  final Function edit;
  OfferCard({this.children, this.price, this.title,this.delet,this.edit});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  onPressed: edit,
                  icon: Icon(Icons.edit),
                )
              ],
            ),
            Column(
              children: children,
            ),
            SizedBox(
              height: 30,
            ),
            Text(price),
            Row(
              children: [
                Expanded(
                  child: OutlineButton(
                    highlightedBorderColor: kThemeColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddMoreMenuFields(),
                        ),
                      );
                    },
                    child: Text("Add More"),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: delet,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
