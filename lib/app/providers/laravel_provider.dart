// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
// import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:get/get.dart' as getprefix;
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paybox/app/models/category_model.dart' as categoryydata;
import 'package:paybox/app/models/allDeals_model.dart' as alldealsdata;
import 'package:paybox/app/models/loyalty_model.dart' as loyaltydata;
import 'package:paybox/app/models/purchase_model.dart' as purchasedata;
import 'package:paybox/app/models/deal_by_category_model.dart'
    as dealByCategorydata;
import 'package:paybox/app/models/nearest_deals_model.dart' as nearestdeals;

import 'package:paybox/app/models/deals_model.dart';
import 'package:paybox/app/providers/api_provider.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart' as foundation;
import 'package:paybox/commonWidget/ui.dart';

import '../models/user_model.dart';
import 'dio_client.dart';
import 'package:paybox/app/models/filter_deals_model.dart' as filterdeals;

// import 'dart:convert';
// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:get/get.dart';

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

  // void unForceRefresh() {
  //   if (!foundation.kIsWeb && !foundation.kDebugMode) {
  //     _optionsNetwork = buildCacheOptions(const Duration(days: 3),
  //         forceRefresh: true, options: _optionsNetwork);
  //     _optionsCache = buildCacheOptions(const Duration(minutes: 10),
  //         forceRefresh: false, options: _optionsCache);
  //   }
  // }

  Future<User> register(User user) async {
    Get.log('In Laravel Provider');
    Uri uri = getApiBaseUri("register");

    Get.log(uri.toString());
    var response = await _httpClient!.postUri(
      uri,
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
      _box!.write('token', token);
      print('toooooooooken: $token');

      // var name = responsedata["data"]['name'];
      // print('name: $name');

      // var email = responsedata["data"]['email'];
      // print('email: $email');

      var id = responsedata['data']["id"];
      _box!.write('id', id);
      Get.log("Id while signup : $id");

      // _box!.write('name', name);
      // _box!.write('email', email);
    }

    if (responsedata['success'] == true) {
      // response.data['data']['auth'] = true;
      print(responsedata['success']);
      print('2222');

      return User.fromJson(responsedata);
    } else {
      Get.showSnackbar(
          Ui.ErrorSnackBar(message: responsedata['error']['email'][0]));
      print('not 2222');
      throw Exception(responsedata['error']);
    }
  }

  Future<User> login(User user) async {
    print('1111');
    Uri uri = getApiBaseUri("login");
    print(user.email);
    print(user.password);

    Get.log(uri.toString());
    var response = await _httpClient!.postUri(
      uri,
      data: json.encode(user.toJson()),
      options: _optionsNetwork,
    );
    print(response.data);
    var responsedata = json.decode(response.data);
    var data = responsedata['data'];
    if (data != null) {
      print(responsedata);
      print('new resssssssssssssssssssssssssssssss');

      var token = responsedata["token"];
      Get.log('toooooooooken: $token');
      _box!.write('token', token);

      // var name = responsedata['data']["name"];
      // Get.log('Name2: $name');

      // var name = responsedata["data"]['name'];
      // print('name: $name');

      // var email = responsedata["data"]['email'];
      // print('email: $email');

      var id = responsedata['data']["id"];
      _box!.write('id', id);
      Get.log("Id while login : $id");

      // _box!.write('name', name);
      // _box!.write('email', email);
    }

    if (responsedata['success'] == true) {
      // response.data['data']['auth'] = true;
      print(responsedata['success']);
      print('2222');
      Get.log('Name 3: ${user.name}');
      return User.fromJson(responsedata);
    } else {
      Get.showSnackbar(Ui.ErrorSnackBar(message: responsedata['message']));
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
    Uri uri = getDealsApiBaseUri("store/fcmtoken");

    Get.log(uri.toString());

    Map<String, dynamic> requestData = {
      "user_id": userId,
      "fcm_id": fcmId,
      "platform": platform,
    };

    var response = await _httpClient!.postUri(
      uri,
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
    Uri uri = getDealsApiBaseUri("/forgot/password");

    Get.log(uri.toString());
    var response = await _httpClient!.postUri(
      uri,
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
    Uri uri = getDealsApiBaseUri("deals");

    Get.log(uri.toString());
    var response = await _httpClient!.getUri(
      uri,
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
    Uri uri = getDealsApiBaseUri("deal/1");

    Get.log(uri.toString());
    var response = await _httpClient!.getUri(
      uri,
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
    Uri uri = getDealsApiBaseUri("categories");
    // .replace(queryParameters: _queryParameters);
    Get.log(uri.toString());
    var response = await _httpClient!.getUri(uri, options: _optionsCache);
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
    Uri uri = getDealsApiBaseUri("all/deals");
    var response = await _httpClient!.getUri(uri, options: _optionsCache);

    var responsedata = json.decode(response.data);

    if (responsedata['success'] == true) {
      List<alldealsdata.Data> businessesWithDeals = [];
      for (var businessData in responsedata['data']) {
        List<alldealsdata.Deals> deals =
            (businessData['deals'] as List<dynamic>?)
                    ?.map<alldealsdata.Deals>((deal) => alldealsdata.Deals(
                          id: deal['id'],
                          businessName: deal['business_name'],
                          logo: deal['logo'] != null
                              ? alldealsdata.Logo.fromJson(deal['logo'])
                              : null,
                          banner: deal['banner'] != null
                              ? alldealsdata.Logo.fromJson(deal['banner'])
                              : null,
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
          logo: businessData['logo'] != null
              ? alldealsdata.Logo.fromJson(businessData['logo'])
              : null,

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
    Uri uri = getDealsApiBaseUri("store/get-stores");

    Get.log(uri.toString());
    var response = await _httpClient!.getUri(
      uri,
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
    var id = _box!.read('id');
    print('1111');
    Uri uri = getApiBaseUri("profile/$id");
    Get.log(id.toString());
    Get.log(uri.toString());
    var response = await _httpClient!.getUri(
      uri,
      //  data: json.encode(user.toJson()),
      options: _optionsNetwork,
    );
    // print(response.data);
    var responsedata = json.decode(response.data);
    // print(responsedata["success"]);
    // print('new resss');

    // var token = responsedata["token"];
    // print('toooooooooken: $token');
    Get.log('before Image');
    Get.log('IMAGE :: ' + responsedata['data']['name']);
    Get.log('After Image');
    if (responsedata['success'] == true) {
      // response.data['data']['auth'] = true;
      // print(responsedata['success']);
      print('2222 .. getUserProfile APi done');

      return User.fromJson(responsedata);
    } else {
      print('not 2222');
      throw Exception(responsedata['error']);
    }
  }

  Future<User> getAllUsers() async {
    print('1111');
    Uri uri = getDealsApiBaseUri("users");

    Get.log(uri.toString());
    var response = await _httpClient!.getUri(
      uri,
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
    Uri uri = getDealsApiBaseUri("restore/user/1");

    Get.log(uri.toString());
    var response = await _httpClient!.getUri(
      uri,
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
    Uri uri = getDealsApiBaseUri("delete/user/$id");
    // .replace(queryParameters: _queryParameters);
    Get.log(uri.toString());
    var response = await _httpClient!.getUri(uri, options: _optionsCache);
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

  Future<List<TrendingDeals>> getTrendingDeals() async {
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
          .map<TrendingDeals>((obj) => TrendingDeals.fromJson(obj))
          .toList();
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<User> storeToken() async {
    print('1111');
    Uri uri = getDealsApiBaseUri("/store/fcmtoken");

    Get.log(uri.toString());
    var response = await _httpClient!.postUri(
      uri,
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

  // Future<User> updateProfilePicture(File? profileImage) async {
  //   int id = _box!.read('id') ?? 2;
  //   Get.log(id.toString());
  //   print('1111');
  //   Uri uri = getDealsApiBaseUri("/update/profile/image/$id");

  //   // final request = http.MultipartRequest('POST', url)
  //   //   ..files.add(await http.MultipartFile.fromPath('profile_image', pickedImage.value!.path));

  //   // FormData formData = FormData.fromMap({
  //   //   "profile_image": await MultipartFile.fromFile(
  //   //     profileImage!.path,
  //   //     filename: "profile_image",
  //   //   ),
  //   // });

  //   var formData = FormData.fromMap({
  //     'files': [
  //       await MultipartFile.fromFile(profileImage!.path,
  //           filename: 'picture.jpeg')
  //     ],
  //   });

  //   Get.log(uri.toString());
  //   var response = await _httpClient!.postUri(
  //     uri,
  //     data: formData,
  //     options: _optionsNetwork,
  //   );
  //   print(response.data);
  //   var responsedata = json.decode(response.data);
  //   print(responsedata["success"]);
  //   print('new resss');

  //   // var token = responsedata["token"];
  //   // print('toooooooooken: $token');

  //   if (responsedata['success'] == true) {
  //     // response.data['data']['auth'] = true;
  //     print(responsedata['success']);
  //     print('2222  for updateProfile');

  //     return User.fromJson(responsedata);
  //   } else {
  //     print('not 2222');
  //     throw Exception(responsedata['error']);
  //   }
  // }

  Future<void> updateProfileImage(File? pickedImage) async {
    int id = _box!.read('id') ?? 2;
    Get.log('ID ::: $id');
    try {
      if (pickedImage == null) {
        return; // No image to update
      }

      var data = dio.FormData.fromMap({
        'profile': [
          await dio.MultipartFile.fromFile(
            pickedImage!.path,
            filename: 'picture.jpeg',
          ),
        ],
      });

      var dioClient = dio.Dio();
      var response = await dioClient.request(
        'https://paybox.jzmaxx.com/api/v2/update/profile/image/$id',
        options: dio.Options(
          method: 'POST',
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        print(json.encode(response.data));
        // Handle success, maybe update user profile data
      } else {
        print(response.statusMessage);
        // Handle error
      }
    } catch (error) {
      print('Error updating profile image: $error');
      // Handle error
    }
  }

  // Future<User> updateUser(User user) async {
  //   // final User user = authController.currentUser!.value;
  //   Get.log('333 .. $user');
  //   int id = _box!.read('id') ?? 2;
  //   Get.log(id.toString());
  //   Uri uri = getDealsApiBaseUri("/update/user/$id");

  //   Get.log(uri.toString());
  //   Get.log(id.toString());
  //   // Map updatedUser = {
  //   //   "name": "afaqUpdated",
  //   //   "telephone": "1234",
  //   // };

  //   var response = await _httpClient!.postUri(
  //     uri,
  //     data: json.encode(user.toJson()),
  //     options: _optionsNetwork,
  //   );

  //   var responsedata = json.decode(response.data);

  //   // var token = responsedata["token"];
  //   // print('toooooooooken: $token');

  //   if (responsedata['success'] == true) {
  //     // response.data['data']['auth'] = true;
  //     print(responsedata['success']);

  //     return User.fromJson(responsedata);
  //   } else {
  //     print('not 2222');
  //     throw Exception(responsedata['error']);
  //   }
  // }

  Future<void> updateUser(User user) async {
    int id = _box!.read('id') ?? 2;
    Get.log('ID ::: $id');
    try {
      if (user == null) {
        return; // No image to update
      }

      var data =
          FormData.fromMap({'name': user.name, 'telephone': user.telephone});

      var dio = Dio();
      var response = await dio.request(
        'https://paybox.jzmaxx.com/api/v2/update/user/$id',
        options: Options(
          method: 'POST',
        ),
        data: json.encode(user.toJson()),
        // data: data,
      );

      // var responsedata = json.decode(response.data);
      // var data = responsedata['data'];
      // if (data != null) print(responsedata["success"]);
      var responsedata = json.decode(response.data);

      if (response.statusCode == 200) {
        print(json.encode(response.data));
        Get.showSnackbar(Ui.SuccessSnackBar(message: responsedata['message']));
        // return User.fromJson(responsedata);
      } else {
        Get.log(response.statusCode.toString());
        print(response.statusMessage);
      }
    } catch (error) {
      print('Error updating profile image: $error');
      // Handle error
    }
  }

  Future<void> changePassword(String password) async {
    int id = _box!.read('id');

    Get.log('ID ::: $id');

    var data = FormData.fromMap({
      'id': id,
      'password': password,
    });

    var dio = Dio();
    var response = await dio.request(
      'https://paybox.jzmaxx.com/api/v2/forgot/password',
      options: Options(
        method: 'POST',
      ),
      data: data,
    );

    var responsedata = json.decode(response.data);

    if (response.statusCode == 200) {
      print(json.encode(response.data));
      Get.showSnackbar(Ui.SuccessSnackBar(message: responsedata['message']));
    } else {
      print(response.statusMessage);
    }
  }

  Future<void> fileComplain(
      {String email = '', String phone = '', String message = ''}) async {
    int id = _box!.read('id');

    Get.log('ID ::: $id');

    var headers = {'Content-Type': 'application/json'};
    var data = json.encode({
      "email": email,
      "phone": phone,
      "message": message,
    });
    var dio = Dio();
    var response = await dio.request(
      'https://paybox.jzmaxx.com/api/v2/filed/compliant',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    var responsedata = json.decode(response.data);

    if (response.statusCode == 200) {
      print(json.encode(response.data));
      Get.showSnackbar(Ui.SuccessSnackBar(message: responsedata['message']));
    } else {
      print(response.statusMessage);
    }
  }

  Future<List<loyaltydata.Data>> getLoyalties() async {
    var token = _box!.read('token');
    Get.log('token in getLoyalties ::: $token');
    // const _queryParameters = {
    //   'parent': 'true',
    //   'orderBy': 'order',
    //   'sortBy': 'asc',
    // };
    Uri uri = getDealsApiBaseUri("loyalties");

    var headers = {'Authorization': 'Bearer $token'};
    Get.log('Headers ::: $headers');
    // .replace(queryParameters: _queryParameters);
    Get.log(uri.toString());
    var response = await _httpClient!.getUri(
      uri,
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );
    Get.log('responseeeeee ready');

    var responsedata = json.decode(response.data);
    print(responsedata);

    if (responsedata['success'] == true) {
      Get.log('responseeeeee success');
      // List data = responsedata['data'];
      // List redeempoints = data[0]["loyalty_redeem_rules"];
      // var point = redeempoints[0]["points"];

      return responsedata['data']
          .map<loyaltydata.Data>((obj) => loyaltydata.Data.fromJson(obj))
          .toList();
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<List<purchasedata.Data>> getPurchases() async {
    var token = _box!.read('token');
    Get.log('token in getPurchases ::: $token');
    // const _queryParameters = {
    //   'parent': 'true',
    //   'orderBy': 'order',
    //   'sortBy': 'asc',
    // };
    Uri uri = getDealsApiBaseUri("get-my-purchases");

    var headers = {'Authorization': 'Bearer $token'};
    Get.log('Headers ::: $headers');
    // .replace(queryParameters: _queryParameters);
    Get.log(uri.toString());
    var response = await _httpClient!.getUri(
      uri,
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );
    Get.log('responseeeeee ready');

    var responsedata = json.decode(response.data);
    print(responsedata);

    if (responsedata['success'] == true) {
      Get.log('responseeeeee success in get pruchases');
      // List data = responsedata['data'];
      // List redeempoints = data[0]["loyalty_redeem_rules"];
      // var point = redeempoints[0]["points"];

      return responsedata['data']
          .map<purchasedata.Data>((obj) => purchasedata.Data.fromJson(obj))
          .toList();
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<void> purchaseDeal() async {
    // User user
    int id = _box!.read('id') ?? 0;
    Get.log('ID ::: $id');
    var headers = {'Content-Type': 'application/json'};
    var data = json.encode({
      "user_id": id,
      "deal_id": "8",
      "purchase_status": "Redeemed",
      "redeem_code": "123456"
    });
    var dio = Dio();
    var response = await dio.request(
      'https://paybox.jzmaxx.com/api/v2/purchase/deal',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
  }

  Future<List<dealByCategorydata.Data>> dealsByCategory(String id) async {
    // User user
    // int id = _box!.read('id') ?? 0;
    // Get.log('ID ::: $id');
    Get.log('dealsByCategory ::: $id');
    var headers = {'Content-Type': 'application/json'};
    var data = json.encode({"category_id": "$id"});
    var dio = Dio();
    var response = await dio.request(
      'https://paybox.jzmaxx.com/api/v2/store/deals/by-category',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    var responsedata = json.decode(response.data);

    if (responsedata['success'] == true) {
      return responsedata['data']
          .map<dealByCategorydata.Data>(
              (obj) => dealByCategorydata.Data.fromJson(obj))
          .toList();
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<List<nearestdeals.Data>> nearestDeals(String lat, String lng) async {
    var headers = {'Content-Type': 'application/json'};
    var data = json.encode({"latitude": lat, "longitude": lng});
    var dio = Dio();
    var response = await dio.request(
      'https://paybox.jzmaxx.com/api/v2/get/nearest/deals',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    Get.log('nearestDeals Api Done');

    var responsedata = json.decode(response.data);

    if (responsedata['success'] == true) {
      Get.log(responsedata['message']);
      // Get.log(responsedata);

      return responsedata['data']
          .map<nearestdeals.Data>((obj) => nearestdeals.Data.fromJson(obj))
          .toList();
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<List<filterdeals.Data>> filterDeals(String filter, List categoryIds,
      String sort, int radius, String lat, String lng, String location) async {
    var headers = {'Content-Type': 'application/json'};
    var data = json.encode({
      "filter": filter,
      "category_id": categoryIds,
      "sort": sort,
      "radius": radius,
      "latitude": lat,
      "longitude": lng,
      "location": location,

      // "filter": "category",
      // "category_id": ["5", "6", "7"],
      // "sort": "nearest",
      // "radius": 10,
      // "latitude": "33.699303",
      // "longitude": "72.971469",
      // "location": ""
    });
    var dio = Dio();
    var response = await dio.request(
      'https://paybox.jzmaxx.com/api/v2/search/deals',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    Get.log('filterDeals Api Done');

    var responsedata = json.decode(response.data);

    if (responsedata['success'] == true) {
      Get.log(responsedata['message']);
      print(responsedata);
      // Get.log(responsedata);

      return responsedata['data']
          .map<filterdeals.Data>((obj) => filterdeals.Data.fromJson(obj))
          .toList();
    } else {
      throw Exception(response.data['message']);
    }
  }
}
