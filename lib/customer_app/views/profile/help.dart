import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery_app/customer_app/services/signup_user_service.dart';
class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignUpUserService>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Help"),),
      body: ListView.builder(
        itemCount: provider.user.length,
        itemBuilder: (ctx,i){
          return ListTile(
            leading: ClipOval(
              child: Image.network(provider.user[i].image,height: 80,width: 50,fit: BoxFit.fill,),
            ),
            title: Text("${provider.user[i].email}"),
            subtitle: Text("${provider.user[i].password}"),
            trailing: Text("${provider.user[i].randomNumber}"),
          );
        },
      )
    );
  }
}