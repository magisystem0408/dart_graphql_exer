import 'package:flutter/material.dart';
import 'package:graphql_first/screens/home_screen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


void main() async{
  // ここら辺でgraphQLの設定をしている
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();
  final HttpLink link =
  HttpLink(("https://graphql-flutter-course.herokuapp.com/graphql"));
  ValueNotifier<GraphQLClient> client =ValueNotifier(
    GraphQLClient(link: link,cache: GraphQLCache(store:HiveStore() ))

  );

  runApp(MyApp(client: client,));
}

class MyApp extends StatelessWidget {
  final ValueNotifier<GraphQLClient> client;

  const MyApp({Key key, this.client}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: CacheProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
              // 視覚的なつまり具合(密度)を自動調整してくれる。
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: Theme.of(context).textTheme,
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: Colors.black87),
              textTheme: Theme.of(context).textTheme,
            )),
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}
