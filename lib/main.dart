import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get_storage/get_storage.dart';

import 'app/providers/laravel_provider.dart';
import 'app/routes/theme1_app_pages.dart';
import 'app/services/auth_service.dart';
import 'app/services/global_service.dart';
import 'app/services/setting_service.dart';
import 'app/services/translation_service.dart';

initServices() async {
  Get.log('starting services ...');
  await GetStorage.init();
  await Get.putAsync(() => GlobalService().init());
  // await Firebase.initializeApp();
  await Get.putAsync(() => AuthService().init());

  await Get.putAsync(() => LaravelApiClient().init());
  // await Get.putAsync(() => FirebaseProvider().init());
  await Get.putAsync(() => SettingsService().init());
  // await Get.putAsync(() => TranslationService().init());R
  Get.log('All services started...');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();

  // GetStorage? _box;
  // late final String? token;

  // Theme1AppPages() {
  //   _box = GetStorage();
  //   token = _box!.read('token');
  // }

  runApp(
    GetMaterialApp(
      title: "GetX",
      initialRoute: Theme1AppPages.INITIAL,

      getPages: Theme1AppPages.routes,
      // localizationsDelegates: GlobalMaterialLocalizations.delegates,
      // supportedLocales: Get.find<TranslationService>().supportedLocales(),
      // translationsKeys: Get.find<TranslationService>().translations,
      // locale: Get.find<TranslationService>().getLocale(),
      // fallbackLocale: Get.find<TranslationService>().getLocale(),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
    ),
  );
}
