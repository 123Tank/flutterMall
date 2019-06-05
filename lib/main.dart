import 'package:flutter/material.dart';
import './pages/index_page.dart';
import 'package:provide/provide.dart';
import './provide/child_category.dart';
import './provide/category_goods_list.dart';
import './provide/detail_info.dart';

import 'package:fluro/fluro.dart';
import './routers/routes.dart';
import './routers/application.dart';


// void main() => runApp(MyApp());
void main() {
  var childCategory = ChildCategory();
  var categoryGoodsListProvide= CategoryGoodsListProvide();
  var detailInfoProvide = DetailInfoProvide();
  
   final providers = Providers()
      ..provide(Provider<ChildCategory>.value(childCategory))
      ..provide(Provider<CategoryGoodsListProvide>.value(categoryGoodsListProvide))
      ..provide(Provider<DetailInfoProvide>.value(detailInfoProvide));

    runApp(ProviderNode(
      providers: providers,
      child: MyApp(),
    ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final router = Router();
    Routes.configureRoutes(router);
    Application.router=router;

    return Container(
      child: MaterialApp(
        title: '百姓生活家',
        onGenerateRoute: Application.router.generator,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.pink),
        home: IndexPage(),
      ),
    );
  }
}
