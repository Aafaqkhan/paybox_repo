import 'dart:convert';

import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:paybox/app/models/category_model.dart';
import 'package:paybox/app/modules/auth/controllers/auth_controller.dart';
import 'package:paybox/app/providers/api_provider.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart' as foundation;
import 'package:paybox/app/services/auth_service.dart';

import '../models/user_model.dart';
import 'dio_client.dart';

class LaravelApiClient extends GetxService with ApiClient {
  DioClient? _httpClient;
  dio.Options? _optionsNetwork;
  dio.Options? _optionsCache;

  LaravelApiClient() {
    baseUrl = globalService.baseUrl;
    _httpClient = DioClient(baseUrl, dio.Dio());
  }

  Future<LaravelApiClient> init() async {
    _optionsNetwork = _httpClient!.optionsNetwork;
    _optionsCache = _httpClient!.optionsCache;
    return this;
  }

  bool isLoading({String? task, List<String>? tasks}) {
    return _httpClient!.isLoading(task: task, tasks: tasks);
  }

  void setLocale(String locale) {
    _optionsNetwork!.headers!['Accept-Language'] = locale;
    _optionsCache!.headers!['Accept-Language'] = locale;
  }

  void forceRefresh() {
    if (!foundation.kIsWeb && !foundation.kDebugMode) {
      _optionsCache = dio.Options(headers: _optionsCache!.headers);
      _optionsNetwork = dio.Options(headers: _optionsNetwork!.headers);
    }
  }

  void unForceRefresh() {
    if (!foundation.kIsWeb && !foundation.kDebugMode) {
      _optionsNetwork = buildCacheOptions(const Duration(days: 3),
          forceRefresh: true, options: _optionsNetwork);
      _optionsCache = buildCacheOptions(const Duration(minutes: 10),
          forceRefresh: false, options: _optionsCache);
    }
  }

  Future<User> register(User user) async {
    print('1111');
    Uri _uri = getApiBaseUri("register");

    Get.log(_uri.toString());
    var response = await _httpClient!.postUri(
      _uri,
      data: json.encode(user.toJson()),
      options: _optionsNetwork,
    );
    print(response.data);
    var responsedata = json.decode(response.data);
    print(responsedata["success"]);
    print('new resss');

    var token = responsedata["token"];
    print('toooooooooken: $token');

    if (responsedata['success'] == true) {
      // response.data['data']['auth'] = true;
      print(responsedata['success']);
      print('2222');

      return User.fromJson(responsedata);
    } else {
      print('not 2222');
      throw Exception(responsedata['error']);
    }
  }

  Future<User> login(User user) async {
    print('1111');
    Uri _uri = getApiBaseUri("login");

    Get.log(_uri.toString());
    var response = await _httpClient!.postUri(
      _uri,
      data: json.encode(user.toJson()),
      options: _optionsNetwork,
    );
    print(response.data);
    var responsedata = json.decode(response.data);
    print(responsedata["success"]);
    print('new resss');

    var token = responsedata["token"];
    print('toooooooooken: $token');

    if (responsedata['success'] == true) {
      // response.data['data']['auth'] = true;
      print(responsedata['success']);
      print('2222');

      return User.fromJson(responsedata);
    } else {
      print('not 2222');
      throw Exception(responsedata['error']);
    }
  }

  Future<User> forgotPassword() async {
    print('1111');
    Uri _uri = getDealsApiBaseUri("/forgot/password");

    Get.log(_uri.toString());
    var response = await _httpClient!.postUri(
      _uri,
      // data: json.encode(user.toJson()),
      options: _optionsNetwork,
    );
    print(response.data);
    var responsedata = json.decode(response.data);
    print(responsedata["success"]);
    print('new resss');

    var token = responsedata["token"];
    print('toooooooooken: $token');

    if (responsedata['success'] == true) {
      // response.data['data']['auth'] = true;
      print(responsedata['success']);
      print('2222 done for forgotPassword');

      return User.fromJson(responsedata);
    } else {
      print('not 2222');
      throw Exception(responsedata['error']);
    }
  }

  Future<User> getDeals() async {
    print('1111');
    Uri _uri = getDealsApiBaseUri("deals");

    Get.log(_uri.toString());
    var response = await _httpClient!.getUri(
      _uri,
      // data: json.encode(user.toJson()),
      options: _optionsNetwork,
    );
    print(response.data);
    var responsedata = json.decode(response.data);
    print(responsedata["success"]);
    print('new resss');

    // var token = responsedata["token"];
    // print('toooooooooken: $token');

    if (responsedata['success'] == true) {
      // response.data['data']['auth'] = true;
      print(responsedata['success']);
      print('2222 .. Deals APi done');

      return User.fromJson(responsedata);
    } else {
      print('not 2222');
      throw Exception(responsedata['error']);
    }
  }

  Future<User> getDealById() async {
    print('1111');
    Uri _uri = getDealsApiBaseUri("deal/1");

    Get.log(_uri.toString());
    var response = await _httpClient!.getUri(
      _uri,
      // data: json.encode(user.toJson()),
      options: _optionsNetwork,
    );
    print(response.data);
    var responsedata = json.decode(response.data);
    print(responsedata["success"]);
    print('new resss');

    // var token = responsedata["token"];
    // print('toooooooooken: $token');

    if (responsedata['success'] == true) {
      // response.data['data']['auth'] = true;
      print(responsedata['success']);
      print('2222 .. getDealById  APi done');

      return User.fromJson(responsedata);
    } else {
      print('not 2222');
      throw Exception(responsedata['error']);
    }
  }

  Future<List<Data>> getCategories() async {
    print('1111');
    Uri _uri = getDealsApiBaseUri("categories");

    Get.log(_uri.toString());
    var response = await _httpClient!.getUri(
      _uri,
      // data: json.encode(user.toJson()),
      options: _optionsNetwork,
    );
    print(response.data);
    var responsedata = json.decode(response.data);

    print(responsedata["success"]);
    print('new resss');

    // var token = responsedata["token"];
    // print('toooooooooken: $token');

    if (responsedata['success'] == true) {
      // response.data['data']['auth'] = true;
      print(responsedata['success']);
      print(responsedata["data"].toString());
      print('2222 .. Categories APi done');
      print(responsedata["data"][0]['name'].toString());

      // return Category.fromJson(responsedata);

      var categories = responsedata["data"];

      print('Categorieeeeeeeeeeeeees');

      print(categories);
      // print('First category name: ${categories[0].data}');

      return categories;
    } else {
      print('not 2222');
      throw Exception(responsedata['error']);
    }
  }

  Future<User> getStores() async {
    print('1111');
    Uri _uri = getDealsApiBaseUri("store/get-stores");

    Get.log(_uri.toString());
    var response = await _httpClient!.getUri(
      _uri,
      // data: json.encode(user.toJson()),
      options: _optionsNetwork,
    );
    print(response.data);
    var responsedata = json.decode(response.data);
    print(responsedata["success"]);
    print('new resss');

    // var token = responsedata["token"];
    // print('toooooooooken: $token');

    if (responsedata['success'] == true) {
      // response.data['data']['auth'] = true;
      print(responsedata['success']);
      print('2222 .. Categories APi done');

      return User.fromJson(responsedata);
    } else {
      print('not 2222');
      throw Exception(responsedata['error']);
    }
  }

  Future<User> getUserProfile() async {
    print('1111');
    Uri _uri = getApiBaseUri("profile/1");

    Get.log(_uri.toString());
    var response = await _httpClient!.getUri(
      _uri,
      // data: json.encode(user.toJson()),
      options: _optionsNetwork,
    );
    print(response.data);
    var responsedata = json.decode(response.data);
    print(responsedata["success"]);
    print('new resss');

    // var token = responsedata["token"];
    // print('toooooooooken: $token');

    if (responsedata['success'] == true) {
      // response.data['data']['auth'] = true;
      print(responsedata['success']);
      print('2222 .. getUserProfile APi done');

      return User.fromJson(responsedata);
    } else {
      print('not 2222');
      throw Exception(responsedata['error']);
    }
  }

  Future<User> getAllUsers() async {
    print('1111');
    Uri _uri = getDealsApiBaseUri("users");

    Get.log(_uri.toString());
    var response = await _httpClient!.getUri(
      _uri,
      // data: json.encode(user.toJson()),
      options: _optionsNetwork,
    );
    print(response.data);
    var responsedata = json.decode(response.data);
    print(responsedata["success"]);
    print('new resss');

    // var token = responsedata["token"];
    // print('toooooooooken: $token');

    if (responsedata['success'] == true) {
      // response.data['data']['auth'] = true;
      print(responsedata['success']);
      print('2222 .. getAllUsers APi done');

      return User.fromJson(responsedata);
    } else {
      print('not 2222');
      throw Exception(responsedata['error']);
    }
  }

  Future<User> restoreUpdate() async {
    print('1111');
    Uri _uri = getDealsApiBaseUri("restore/user/1");

    Get.log(_uri.toString());
    var response = await _httpClient!.getUri(
      _uri,
      // data: json.encode(user.toJson()),
      options: _optionsNetwork,
    );
    print(response.data);
    var responsedata = json.decode(response.data);
    print(responsedata["success"]);
    print('new resss');

    // var token = responsedata["token"];
    // print('toooooooooken: $token');

    if (responsedata['success'] == true) {
      // response.data['data']['auth'] = true;
      print(responsedata['success']);
      print('2222 .. restoreUpdate APi done');

      return User.fromJson(responsedata);
    } else {
      print('not 2222');
      throw Exception(responsedata['error']);
    }
  }

  Future<User> deleteUser() async {
    print('1111');
    Uri _uri = deleteUserApiBaseUri("user/1");

    Get.log(_uri.toString());
    var response = await _httpClient!.getUri(
      _uri,
      // data: json.encode(user.toJson()),
      options: _optionsNetwork,
    );
    print(response.data);
    var responsedata = json.decode(response.data);
    print(responsedata["success"]);
    print('new resss');

    // var token = responsedata["token"];
    // print('toooooooooken: $token');

    if (responsedata['success'] == true) {
      // response.data['data']['auth'] = true;
      print(responsedata['success']);
      print('2222 .. deleteUser APi done');

      return User.fromJson(responsedata);
    } else {
      print('not 2222');
      throw Exception(responsedata['error']);
    }
  }

  Future<User> storeToken() async {
    print('1111');
    Uri _uri = getDealsApiBaseUri("/store/fcmtoken");

    Get.log(_uri.toString());
    var response = await _httpClient!.postUri(
      _uri,
      // data: json.encode(),
      options: _optionsNetwork,
    );
    print(response.data);
    var responsedata = json.decode(response.data);
    print(responsedata["success"]);
    print('new resss');

    // var token = responsedata["token"];
    // print('toooooooooken: $token');

    if (responsedata['success'] == true) {
      // response.data['data']['auth'] = true;
      print(responsedata['success']);
      print('2222  for storeToken');

      return User.fromJson(responsedata);
    } else {
      print('not 2222');
      throw Exception(responsedata['error']);
    }
  }

  Future<User> updateProfile() async {
    print('1111');
    Uri _uri = getDealsApiBaseUri("/update/profile/pictire/1");

    Get.log(_uri.toString());
    var response = await _httpClient!.postUri(
      _uri,
      // data: json.encode(),
      options: _optionsNetwork,
    );
    print(response.data);
    var responsedata = json.decode(response.data);
    print(responsedata["success"]);
    print('new resss');

    // var token = responsedata["token"];
    // print('toooooooooken: $token');

    if (responsedata['success'] == true) {
      // response.data['data']['auth'] = true;
      print(responsedata['success']);
      print('2222  for updateProfile');

      return User.fromJson(responsedata);
    } else {
      print('not 2222');
      throw Exception(responsedata['error']);
    }
  }

  Future<User> updateUser() async {
    print('1111');
    Uri _uri = getDealsApiBaseUri("/update/user/1");

    Get.log(_uri.toString());
    var response = await _httpClient!.postUri(
      _uri,
      // data: json.encode(),
      options: _optionsNetwork,
    );
    print(response.data);
    var responsedata = json.decode(response.data);
    print(responsedata["success"]);
    print('new resss');

    // var token = responsedata["token"];
    // print('toooooooooken: $token');

    if (responsedata['success'] == true) {
      // response.data['data']['auth'] = true;
      print(responsedata['success']);
      print('2222  for updateUser');

      return User.fromJson(responsedata);
    } else {
      print('not 2222');
      throw Exception(responsedata['error']);
    }
  }
}
