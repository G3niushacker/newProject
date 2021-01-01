import 'package:flutter/material.dart';

class RecentOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recent Orders"),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              leading: ClipOval(
                child: Image.network(
                  "https://www.dailymoss.com/wp-content/uploads/2019/08/funny-profile-pic59.jpg",
                  fit: BoxFit.fill,
                ),
              ),
              title: Text("Umer hijaz"),
              subtitle: Text("cop 72 phase 2 DHA Saudi Arebia"),
              trailing: Text("12/12/2020"),
            ),
          ),
          Card(
            child: ListTile(
              leading: ClipOval(
                child: Image.asset("images/user.png"),
              ),
              title: Text("Muhammad ali"),
              subtitle: Text("strea phase 2 DHA Saudi Arebia"),
              trailing: Text("12/12/2020"),
            ),
          ),
          Card(
            child: ListTile(
              leading: ClipOval(
                child: Image.asset("images/user.png"),
              ),
              title: Text("Umer hijaz"),
              subtitle: Text("cop 72 phase 2 DHA Saudi Arebia"),
              trailing: Text("12/12/2020"),
            ),
          ),
          Card(
            child: ListTile(
              leading: ClipOval(
                child: Image.asset("images/user.png"),
              ),
              title: Text("Umer hijaz"),
              subtitle: Text("cop 72 phase 2 DHA Saudi Arebia"),
              trailing: Text("12/12/2020"),
            ),
          ),
        ],
      ),
    );
  }
}
