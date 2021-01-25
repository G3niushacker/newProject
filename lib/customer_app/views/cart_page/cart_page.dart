import 'package:flutter/material.dart';
import 'package:food_delivery_app/customer_app/model/resturant/resturants_providers.dart';
import 'package:food_delivery_app/customer_app/views/cart_page/components/cart_item.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  void getTotal(BuildContext context) async{
    final pro = Provider.of<NearResturantsProvider>(context,listen: false);
    await Future.delayed(Duration(seconds: 3));
    pro.total();
  }

  @override
  void initState() {
    super.initState();
    final pro = Provider.of<NearResturantsProvider>(context,listen: false);
    // pro.check();
    pro.getUserIdEmail();
    // getTotal(context);
  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NearResturantsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),
        backgroundColor: Colors.white,
        title: Text("Order Details",style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("My Cart",style: TextStyle(fontSize: 18),),
              SizedBox(height: 10,),
              ListView.separated(
                separatorBuilder: (ctx,i){
                  return Divider();
                },
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: provider.cartItems.length,
                itemBuilder: (ctx,i){
                  var list = provider.cartItems[i];
                  return CartItem(
                    title: list.itemName,
                    subtitle: list.itemDescription,
                    image: "https://tripps.live/tripp_food/${list.itemImage}",
                    price: '120',
                    qty: '1',
                  );
                },
              ),
              SizedBox(height: 20,),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Delivery Address",style: TextStyle(fontSize: 18),),
                    ListTile(
                      leading: Icon(Icons.home_filled),
                      title: Text("Building no 12 Street 11"),
                      subtitle: Text("Jaddah Saudi Arabia"),
                      trailing: IconButton(onPressed: (){},icon: Icon(Icons.arrow_forward_ios),),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Payment Method",style: TextStyle(fontSize: 18),),
                    ListTile(
                      leading: Icon(Icons.credit_card_sharp),
                      title: Text("VISA Classic"),
                      subtitle: Text("7889 8787 787 7887"),
                      trailing: Radio(
                        value: 0,
                        onChanged: (val){

                        },
                        groupValue: 1,
                      ),
                    ),
                    ListTile(
                      leading: Icon(FontAwesome.money),
                      title: Text("Cash on delivery"),
                      trailing: Radio(
                        value: 1,
                        onChanged: (val){

                        },
                        groupValue: 1,
                      ),
                    )
                  ],
                ),
              ),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Other Instructions',
                  border: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal)
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Order Info",style: TextStyle(fontSize: 20),),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Subtotal"),
                        Text("${6598} SAR")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Delivery fee"),
                        Text("${50} SAR")
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total"),
                        Text("${6648} SAR",style: TextStyle(fontSize: 20),)
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 50,
                color: kThemeColor,
                minWidth: MediaQuery.of(context).size.width,
                onPressed: (){
                  provider.sendOrder();
                  // Navigator.pushNamed(context, deliDocuments);

                },
                child: Text("Place Order",
                  style: TextStyle(color: Colors.white),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
