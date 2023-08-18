import 'package:get/get.dart';
import 'package:paybox/app/models/deals_model.dart';
import 'package:paybox/app/providers/laravel_provider.dart';

class HomeRepository {
  LaravelApiClient? _laravelApiClient;

  HomeRepository() {
    _laravelApiClient = LaravelApiClient();
  }

  Future<List<TrendingDealsModel>> getTrendingDeals() {
    return _laravelApiClient!.getTrendingDeals();
  }

  // Future<void> getDeals() {
  //   _laravelApiClient = Get.find<LaravelApiClient>();
  //   print('00000');
  //   return _laravelApiClient!.getDeals();
  // }

  Future<void> getDealById() {
    _laravelApiClient = Get.find<LaravelApiClient>();
    print('00000');
    return _laravelApiClient!.getDealById();
  }

  // Future<List<Data>> getCategories() {
  //   _laravelApiClient = Get.find<LaravelApiClient>();
  //   print('00000');
  //   return _laravelApiClient!.getCategories();
  // }

  Future<void> getStores() {
    _laravelApiClient = Get.find<LaravelApiClient>();
    print('00000');
    return _laravelApiClient!.getStores();
  }

  // Future<User> register(User user) {
  //   _laravelApiClient = Get.find<LaravelApiClient>();
  //   print('00000');
  //   return _laravelApiClient!.register(user);
  // }

  // Future<User> login(User user) {
  //   _laravelApiClient = Get.find<LaravelApiClient>();
  //   print('00000');
  //   return _laravelApiClient!.login(user);
  // }
}
