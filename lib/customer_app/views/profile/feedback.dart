import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  TextEditingController messageController = TextEditingController();
  double defaulfRaiting = 1.0;
  double textRaiting = 1.0;
  ratingText(){
    if(defaulfRaiting == 1.0){
      setState(() {
        textRaiting = 1.0;
      });
    }else if(defaulfRaiting == 2.0){
      setState(() {
        textRaiting = 2.0;
      });
    }else if(defaulfRaiting == 3.0){
      textRaiting = 3.0;
    }else if(defaulfRaiting == 4.0){
      textRaiting = 4.0;
    }else{
      textRaiting = 5.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FeedBack"),),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("How was your overall experience?",style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                SizedBox(height: 10,),
                Text("It will help us to serve you better"),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmoothStarRating(
                      size: 40,
                      color: kThemeColor,
                      borderColor: kThemeColor,
                      rating: 0,
                      onRated: (val){
                        setState(() {
                          setState(() {
                            ratingText();
                            defaulfRaiting = val;
                          });
                        });
                      },
                    ),
                    SizedBox(width: 10,),
                    Text("$textRaiting",style: TextStyle(fontSize: 20),)
                  ],
                ),
                SizedBox(height: 10,),
                Text("It's Excellent",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Text("Your Message (optional)",style: TextStyle(fontSize: 15),),
                SizedBox(height: 10,),
                TextField(
                  maxLines: 10,
                  controller: messageController,
                  decoration: InputDecoration(
                      hintText: "Please specify in detail",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10,),
                MaterialButton(
                  onPressed: (){},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: kThemeColor)
                  ),
                  minWidth: MediaQuery.of(context).size.width,
                  color: kThemeColor,
                  height: 50,
                  child: Text("Submit"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}