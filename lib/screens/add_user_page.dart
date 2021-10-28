import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({key}) : super(key: key);

  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  // フォームをコントロールするkeyとして使う
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "add a user",
          style: TextStyle(
              color: Colors.grey, fontSize: 19, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.lightGreen,
        elevation: 0,
      ),

      // 画面超えたら自動的にスクロールできるようにする
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24),
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 10),
                    color: Colors.grey.shade300,
                    blurRadius: 30),
              ]),
          child: Column(
            children: [
              Mutation(
                options: MutationOptions(
                    document: gql(insertUser()),
                    fetchPolicy: FetchPolicy.noCache,
                    onCompleted: (data) {


                    }),
                builder: (runMutation, result) {
                  return Form(
                    key: _formKey,
                    child: Column(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

String insertUser() {
  return "";
}
