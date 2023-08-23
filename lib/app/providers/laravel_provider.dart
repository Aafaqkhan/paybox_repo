// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paybox/app/models/category_model.dart' as categoryydata;
import 'package:paybox/app/models/allDeals_model.dart' as alldealsdata;

import 'package:paybox/app/models/deals_model.dart';
import 'package:paybox/app/modules/auth/controllers/auth_controller.dart';
import 'package:paybox/app/providers/api_provider.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart' as foundation;
import 'package:paybox/app/services/auth_service.dart';
import 'package:paybox/app/services/global_trending_deals_card.dart';

import '../models/user_model.dart';
import 'dio_client.dart';

class LaravelApiClient extends GetxService with ApiClient {
  GetStorage? _box;

  DioClient? _httpClient;
  dio.Options? _optionsNetwork;
  dio.Options? _optionsCache;

  LaravelApiClient() {
    baseUrl = globalService.baseUrl;
    _httpClient = DioClient(baseUrl, dio.Dio());
    _box = GetStorage();
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
    Get.log('In Laravel Provider');
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
    var data = responsedata["data"];
    if (data != null) {
      var token = responsedata["token"];
      print('toooooooooken: $token');

      var id = responsedata["id"];
      print('id: $id');

      var name = responsedata["data"]['name'];
      print('name: $name');

      var email = responsedata["data"]['email'];
      print('email: $email');

      _box!.write('token', token);
      _box!.write('name', name);
      _box!.write('email', email);
      _box!.write('id', id);
    }

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
    var data = responsedata['data'];
    if (data != null) {
      print(responsedata["success"]);
      print('new resss');

      var token = responsedata["token"];
      print('toooooooooken: $token');

      var name = responsedata["data"]['name'];
      print('name: $name');

      var email = responsedata["data"]['email'];
      print('email: $email');

      _box!.write('token', token);
      _box!.write('name', name);
      _box!.write('email', email);
    }

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

  Future<void> getFcmToken(
    String userId,
    String fcmId,
    String platform,
  ) async {
    print('1111');
    Uri _uri = getDealsApiBaseUri("store/fcmtoken");

    Get.log(_uri.toString());

    Map<String, dynamic> requestData = {
      "user_id": userId,
      "fcm_id": fcmId,
      "platform": platform,
    };

    var response = await _httpClient!.postUri(
      _uri,
      data: json.encode(requestData),
      options: _optionsNetwork,
    );
    var responsedata = json.decode(response.data);

    if (responsedata['success'] == true) {
      // response.data['data']['auth'] = true;
      print(responsedata['message']);

      // return User.fromJson(responsedata);
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

  Future<List<categoryydata.Data>> getCategories() async {
    // const _queryParameters = {
    //   'parent': 'true',
    //   'orderBy': 'order',
    //   'sortBy': 'asc',
    // };
    Uri _uri = getDealsApiBaseUri("categories");
    // .replace(queryParameters: _queryParameters);
    Get.log(_uri.toString());
    var response = await _httpClient!.getUri(_uri, options: _optionsCache);
    Get.log('responseeeeee ready');

    var responsedata = json.decode(response.data);
    print(responsedata);

    if (responsedata['success'] == true) {
      Get.log('responseeeeee success');
      return responsedata['data']
          .map<categoryydata.Data>((obj) => categoryydata.Data.fromJson(obj))
          .toList();
    } else {
      throw Exception(response.data['message']);
    }
  }

  // Future<List<alldealsdata.Data>> getAllDeals() async {
  //   // const _queryParameters = {
  //   //   'parent': 'true',
  //   //   'orderBy': 'order',
  //   //   'sortBy': 'asc',
  //   // };
  //   Uri _uri = getDealsApiBaseUri("all/deals");
  //   // .replace(queryParameters: _queryParameters);
  //   Get.log(_uri.toString());
  //   var response = await _httpClient!.getUri(_uri, options: _optionsCache);
  //   Get.log('responseeeeee ready');

  //   var responsedata = json.decode(response.data);
  //   print(responsedata);

  //   if (responsedata['success'] == true) {
  //     Get.log('responseeeeee success');
  //     return responsedata['data']
  //         .map<alldealsdata.Data>((obj) => alldealsdata.Data.fromJson(obj))
  //         .toList();
  //   } else {
  //     throw Exception(response.data['message']);
  //   }
  // }

  Future<List<alldealsdata.Data>> getAllDeals() async {
    Uri _uri = getDealsApiBaseUri("all/deals");
    var response = await _httpClient!.getUri(_uri, options: _optionsCache);

    var responsedata = json.decode(response.data);

    if (responsedata['success'] == true) {
      List<alldealsdata.Data> businessesWithDeals = [];
      for (var businessData in responsedata['data']) {
        List<alldealsdata.Deals> deals =
            (businessData['deals'] as List<dynamic>?)
                    ?.map<alldealsdata.Deals>((deal) => alldealsdata.Deals(
                          id: deal['id'],
                          businessName: deal['business_name'],
                          businessLogo: deal['business_logo'],
                          address: deal['address'],
                          dealPrice: deal['deal_price'],
                          startPrice: deal['start_price'],
                          endDate: deal['end_date'],
                          description: deal['description'],
                          about: deal['about'],

                          // salevalue: deal[''],
                        ))
                    .toList() ??
                [];

        alldealsdata.Data businessWithDeals = alldealsdata.Data(
          businessTitle: businessData['business_title'],
          logo: businessData['logo'],
          address: businessData['address'],
          deals: deals, // Assign the deals list to the businessWithDeals
        );

        businessesWithDeals.add(businessWithDeals);
      }

      return businessesWithDeals;
    } else {
      throw Exception(responsedata['message']);
    }
  }

  // Future<List<Data>> getCategories() async {
  //   print('1111');
  //   Uri _uri = getDealsApiBaseUri("categories");

  //   Get.log(_uri.toString());
  //   var response = await _httpClient!.getUri(
  //     _uri,
  //     // data: json.encode(user.toJson()),
  //     options: _optionsNetwork,
  //   );
  //   print(response.data);
  //   var responsedata = json.decode(response.data);

  //   print(responsedata["success"]);
  //   print('new resss');

  // var token = responsedata["token"];
  // print('toooooooooken: $token');

  //   if (responsedata['success'] == true) {
  //     // response.data['data']['auth'] = true;
  //     print(responsedata['success']);
  //     print(responsedata["data"].toString());
  //     print('2222 .. Categories APi done');
  //     print(responsedata["data"][0]['name'].toString());

  //     // return Category.fromJson(responsedata);

  //     var categories = responsedata["data"];

  //     print('Categorieeeeeeeeeeeeees');

  //     print(categories);
  //     // print('First category name: ${categories[0].data}');

  //     return categories;
  //   } else {
  //     print('not 2222');
  //     throw Exception(responsedata['error']);
  //   }
  // }

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

  Future getDeleteUser() async {
    // const _queryParameters = {
    //   'parent': 'true',
    //   'orderBy': 'order',
    //   'sortBy': 'asc',
    // };
    print('5');
    var id = _box!.read('id');
    Uri _uri = getDealsApiBaseUri("delete/user/$id");
    // .replace(queryParameters: _queryParameters);
    Get.log(_uri.toString());
    var response = await _httpClient!.getUri(_uri, options: _optionsCache);
    Get.log('responseeeeee ready');

    var responsedata = json.decode(response.data);
    print(responsedata);

    if (responsedata['success'] == true) {
      Get.log('responseeeeee success');
      // return responsedata['data']['trendingDeals']
      //     .map<TrendingDealsModel>((obj) => TrendingDealsModel.fromJson(obj))
      //     .toList();
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<List<TrendingDealsModel>> getTrendingDeals() async {
    // const _queryParameters = {
    //   'parent': 'true',
    //   'orderBy': 'order',
    //   'sortBy': 'asc',
    // };

    Uri _uri = getDealsApiBaseUri("deals");
    // .replace(queryParameters: _queryParameters);
    Get.log(_uri.toString());
    var response = await _httpClient!.getUri(_uri, options: _optionsCache);
    Get.log('responseeeeee ready');

    var responsedata = json.decode(response.data);
    print(responsedata);

    if (responsedata['success'] == true) {
      Get.log('responseeeeee success');
      return responsedata['data']['trendingDeals']
          .map<TrendingDealsModel>((obj) => TrendingDealsModel.fromJson(obj))
          .toList();
    } else {
      throw Exception(response.data['message']);
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

  Future<User> updateProfilePicture() async {
    print('1111');
    Uri _uri = getDealsApiBaseUri("/update/profile/image/1");

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
    int id = _box!.read('id') ?? 2;
    Get.log(id.toString());
    Uri _uri = getDealsApiBaseUri("/update/user/$id");

    Get.log(_uri.toString());
    Map updatedUser = {
      "name": "afaq",
      "telephone": "1234",
    };

    var response = await _httpClient!.postUri(
      _uri,
      data: json.encode(updatedUser),
      options: _optionsNetwork,
    );

    var responsedata = json.decode(response.data);

    // var token = responsedata["token"];
    // print('toooooooooken: $token');

    if (responsedata['success'] == true) {
      // response.data['data']['auth'] = true;
      print(responsedata['success']);

      return User.fromJson(responsedata);
    } else {
      print('not 2222');
      throw Exception(responsedata['error']);
    }
  }
}
