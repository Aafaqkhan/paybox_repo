import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paybox/app/services/setting_service.dart';

import '../repositories/setting_repositorie.dart';

class TranslationService extends GetxService {
  final translations = <String, Map<String, String>>{}.obs;

  static List<String> languages = [];

  SettingRepository? _settingsRepo;
  GetStorage? _box;

  TranslationService() {
    _settingsRepo = SettingRepository();
    _box = GetStorage();
  }
  // initialize the translation service by loading the assets/locales folder
  // the assets/locales folder must contains file for each language that named
  // with the code of language concatenate with the country code
  // for example (en_US.json)
  Future<TranslationService> init() async {
    // languages = await _settingsRepo.getSupportedLocales();
    await loadTranslation();
    return this;
  }

  Future<void> loadTranslation({locale}) async {
    locale = locale ?? getLocale().languageCode;
    // Map<String, String> translations =
    // await _settingsRepo.getTranslations(locale);
    // Get.addTranslations({locale: translations});
  }

  Locale getLocale() {
    String? locale = _box!.read<String>('language');
    if (locale!.isEmpty) {
      locale = Get.find<SettingsService>().setting.value.mobileLanguage;
    }
    return fromStringToLocale(locale!);
  }

  // get list of supported local in the application
  List<Locale> supportedLocales() {
    return TranslationService.languages.map((locale) {
      return fromStringToLocale(locale);
    }).toList();
  }

  // Convert string code to local object
  Locale fromStringToLocale(String locale) {
    if (locale.contains('_')) {
      // en_US
      return Locale(
          locale.split('_').elementAt(0), locale.split('_').elementAt(1));
    } else {
      // en
      return Locale(locale);
    }
  }
}
