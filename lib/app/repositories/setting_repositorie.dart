import 'package:get/get.dart';
import 'package:paybox/app/providers/laravel_provider.dart';


class SettingRepository {
  LaravelApiClient? _laravelApiClient;

  SettingRepository() {
    _laravelApiClient = Get.find<LaravelApiClient>();
  }

  // Future<Setting> get() {
  //   return _laravelApiClient!.getSettings();
  // }

  // Future<List<dynamic>> getModules() {
  //   return _laravelApiClient.getModules();
  // }

  // Future<Map<String, String>> getTranslations(String locale) {
  //   return _laravelApiClient.getTranslations(locale);
  // }

  // Future<List<String>> getSupportedLocales() {
  //   return _laravelApiClient.getSupportedLocales();
  // }

  // Future<List<Address>> getAddresses() {
  //   return _laravelApiClient.getAddresses();
  // }
}
