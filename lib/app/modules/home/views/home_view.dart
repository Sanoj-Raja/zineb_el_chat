import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zineb_el_chat/app/widgets/recent_chats.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {},
        ),
        title: Text(
          'Zineb El Chat',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        // elevation: 1.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {
              print('Logout has been clicked.');
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            // SizedBox(
            //   height: 4,
            // ),
            RecentChats(),
          ],
        ),
      ),
    );
  }
}
