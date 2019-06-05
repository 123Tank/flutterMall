import 'package:flutter/material.dart';
import 'dart:convert';
import '../model/details.dart';
import '../service/service_method.dart';

class DetailInfoProvide with ChangeNotifier {
  DetailsModel goodsInfo = null;
  // 获取商品详情
  getGoodsInfo(String id ){
    var formData = { 'goodId':id, };
    
    request('getGoodDetailById',formData:formData).then((val){
      var responseData= json.decode(val.toString());
      print(responseData);
      goodsInfo=DetailsModel.fromJson(responseData);
      
      notifyListeners();
    });
   

  }
}