import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:i18n_demo/i18n/localizations.dart';

class HYLocalizationsDelegate extends LocalizationsDelegate<HYLocalizations> {
  static HYLocalizationsDelegate delegate = HYLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ["zh", "en"].contains(locale.languageCode);
  }

  @override
  bool shouldReload(LocalizationsDelegate<HYLocalizations> old) {
    return false;
  }

//  真正加载数据
  @override
  Future<HYLocalizations> load(Locale locale) async {
    final localization = HYLocalizations(locale);
    await localization.loadJson();
    return localization;
//   return SynchronousFuture(HYLocalizations(locale));//没有抽离json文件的时候:SynchronousFuture转同步方法
//    // TODO: implement load
//    throw UnimplementedError();
  }
}
