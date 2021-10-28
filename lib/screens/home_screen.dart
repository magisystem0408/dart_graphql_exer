
import 'package:flutter/material.dart';
import 'package:graphql_first/screens/users_page.dart';
import 'add_user_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    Widget content =UsersPage();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ねこマムシ",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 19,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.transparent,
        // 影
        elevation: 0,
      ),
      body: Center(
        child: content
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          final route =MaterialPageRoute(builder: (context) =>AddUserPage());

          await Navigator.push(context, route);
        },
        backgroundColor: Colors.lightGreen,
        child: Icon(Icons.group_add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
