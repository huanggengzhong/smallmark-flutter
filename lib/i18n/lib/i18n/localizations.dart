import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class HYLocalizations {
  final Locale locale;
  HYLocalizations(this.locale);
//  自定义一个of方法,为了取值简写
  static HYLocalizations of(BuildContext context){
    return Localizations.of(context,HYLocalizations);
  }
  static Map<String, Map<String, String>> _localizedValues = {};
//  加载json语言文件
  Future loadJson()async{
//    1.加载json
  final jsonString=await rootBundle.loadString("assets/json/i18n.json");
  // 2.解析json
    Map<String,dynamic> map=json.decode(jsonString);
//    注意不能直接final map=json.decode(jsonString),因为上面Map<String, String>规定了这个,不然会报错
    _localizedValues=map.map((key,value){
      return MapEntry(key,value.cast<String,String>());//<String,dynamic>转成<String,String>类型
    });
  }
  String get title{
    return _localizedValues[locale.languageCode]["title"];
  }
  String get hello{
    return _localizedValues[locale.languageCode]["hello"];
  }
  String get pickTime{
    return _localizedValues[locale.languageCode]["pickTime"];
  }
}