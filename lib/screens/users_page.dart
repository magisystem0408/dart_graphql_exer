import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({key}) : super(key: key);

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List users = [];
  String _query = """
    query{
      users{
        name
        id
        profession
        age
      }
  }
  """;

  @override
  Widget build(BuildContext context) {
    return Query(
      // データを取得する
      options: QueryOptions(document: gql(_query)),
      builder: (result, {fetchMore, refetch}) {
        // ロード中の時はここでLoading中になる
        if (result.isLoading) {
          return CircularProgressIndicator();
        }
        users = result.data["users"];

        return (users.isNotEmpty)
            ? ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];

                  return Stack(
                    children: [
                      Container(
                          margin:
                              EdgeInsets.only(bottom: 23, left: 10, right: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(1),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 10),
                                    color: Colors.grey.shade300,
                                    blurRadius: 30)
                              ]),
                          padding: const EdgeInsets.all(20),
                          child: InkWell(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        user["name"].toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      Row(
                                        children: [
                                          InkWell(
                                              child: Container(
                                                child: Icon(
                                                  Icons.edit,
                                                  color: Colors.greenAccent,
                                                ),
                                              ),
                                              onTap: () async {
                                                print("edit");
                                              }),
                                          Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: InkWell(
                                              child: Container(
                                                child: Icon(
                                                  Icons.delete_forever,
                                                  color: Colors.red,
                                                ),
                                              ),
                                              onTap: () async{
                                                print("Delete");
                                              },
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, top: 8.0),
                                    child: Text(
                                        "職業：${user["profession"] ?? 'N/A'}"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, top: 8.0),
                                    child: Text("Age：${user["age"] ?? 'N/A'}"),
                                  ),
                                ],
                              ),
                            ),
                          ))
                    ],
                  );
                })
            : Container(
                child: Center(
                child: Text("No Item found"),
              ));
      },
    );
  }
}
