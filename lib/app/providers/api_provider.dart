import 'package:get/get.dart';
import 'package:paybox/app/services/global_service.dart';

import '../../commonWidget/custom_trace.dart';

mixin ApiClient {
  final globalService = Get.find<GlobalService>();
  // final authService = Get.find<AuthService>();
  String? baseUrl;

  String getBaseUrl(String path) {
    if (!path.endsWith('/')) {
      path += '/';
    }
    if (path.startsWith('/')) {
      path = path.substring(1);
    }
    if (!baseUrl!.endsWith('/')) {
      return '${baseUrl!}/$path';
    }
    return baseUrl! + path;
  }

  // For login And signup

  String getApiBaseUrl(String path) {
    String apiPath = globalService.global.value.apiPath!;
    if (path.startsWith('/')) {
      return getBaseUrl(apiPath) + path.substring(1);
    }
    return getBaseUrl(apiPath) + path;
  }

  Uri getApiBaseUri(String path) {
    return Uri.parse(getApiBaseUrl(path));
  }

  // For getDeals

  String getDealsApiBaseUrl(String path) {
    String apiPath = globalService.global.value.dealApiPath!;
    if (path.startsWith('/')) {
      return getBaseUrl(apiPath) + path.substring(1);
    }
    return getBaseUrl(apiPath) + path;
  }

  Uri getDealsApiBaseUri(String path) {
    return Uri.parse(getDealsApiBaseUrl(path));
  }

  // For deleteUser

  String deleteUserApiBaseUrl(String path) {
    String apiPath = globalService.global.value.deleteUserApiPath!;
    if (path.startsWith('/')) {
      return getBaseUrl(apiPath) + path.substring(1);
    }
    return getBaseUrl(apiPath) + path;
  }

  Uri deleteUserApiBaseUri(String path) {
    return Uri.parse(deleteUserApiBaseUrl(path));
  }

  // ------ **** --------

  Uri getBaseUri(String path) {
    return Uri.parse(getBaseUrl(path));
  }

  void printUri(StackTrace stackTrace, Uri uri) {
    Get.log(CustomTrace(stackTrace, message: uri.toString()).toString());
  }
}
