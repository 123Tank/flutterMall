import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/detail_info.dart';

import './details_page/details_top_area.dart';

class DetailsPage extends StatelessWidget {
  final String goodsId;
  DetailsPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              print('返回上一页');
              Navigator.pop(context);
            },
          ),
          title: Text('商品详细页'),
        ),
        body: FutureBuilder(
            future: _getBackInfo(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                    child: Row(
                  children: <Widget>[
                    DetailsTopArea()
                  ],
                ));
              } else {
                return Text('加载中........');
              }
            }));
  }

  Future _getBackInfo(BuildContext context) async {
    await Provide.value<DetailInfoProvide>(context).getGoodsInfo(goodsId);
    return '完成加载';
  }
}
