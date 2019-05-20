import 'package:flutter/material.dart';
import './pages/index_page.dart';
import 'package:provide/provide.dart';
import './provide/child_category.dart';

// void main() => runApp(MyApp());
void main() {
  var childCategory = ChildCategory();
  
   final providers = Providers()
      ..provide(Provider<ChildCategory>.value(childCategory));

    runApp(ProviderNode(
      providers: providers,
      child: MyApp(),
    ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: '百姓生活家',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.pink),
        home: IndexPage(),
      ),
    );
  }
}
