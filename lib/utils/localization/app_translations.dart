import 'package:get/get.dart';
import 'package:pocketPath/utils/localization/en_us.dart';
import 'package:pocketPath/utils/localization/tr_tr.dart';
import 'package:pocketPath/utils/localization/de_de.dart';
import 'package:pocketPath/utils/localization/fr_fr.dart';
import 'package:pocketPath/utils/localization/es_es.dart';
import 'package:pocketPath/utils/localization/pt_br.dart';
import 'package:pocketPath/utils/localization/zh_cn.dart';
import 'package:pocketPath/utils/localization/hi_in.dart';
import 'package:pocketPath/utils/localization/ar_sa.dart';
import 'package:pocketPath/utils/localization/ru_ru.dart';
import 'package:pocketPath/utils/localization/ms_my.dart';
import 'package:pocketPath/utils/localization/id_id.dart';
import 'package:pocketPath/utils/localization/bn_bd.dart';
import 'package:pocketPath/utils/localization/ja_jp.dart';
import 'package:pocketPath/utils/localization/ko_kr.dart';
import 'package:pocketPath/utils/localization/it_it.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'tr_TR': trTR,
        'de_DE': deDE,
        'fr_FR': frFR,
        'es_ES': esES,
        'pt_BR': ptBR,
        'zh_CN': zhCN,
        'hi_IN': hiIN,
        'ar_SA': arSA,
        'ru_RU': ruRU,
        'ms_MY': msMY,
        'id_ID': idID,
        'bn_BD': bnBD,
        'ja_JP': jaJP,
        'ko_KR': koKR,
        'it_IT': itIT,
      };
}
