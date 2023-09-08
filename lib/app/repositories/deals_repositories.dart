import 'package:paybox/app/models/category_model.dart' as categorydata;
import 'package:paybox/app/models/allDeals_model.dart' as alldealsdata;
import 'package:paybox/app/models/deal_by_category_model.dart'
    as dealByCategorydata;
import 'package:paybox/app/providers/laravel_provider.dart';

class DealsRepository {
  LaravelApiClient? _laravelApiClient;

  DealsRepository() {
    _laravelApiClient = LaravelApiClient(); // Initialize _laravelApiClient here
  }

  Future<List<categorydata.Data>> getCategories() {
    return _laravelApiClient!.getCategories();
  }

  Future<List<alldealsdata.Data>> getAllDeals() {
    return _laravelApiClient!.getAllDeals();
  }

  Future<void> purchaseDeal() {
    // User user
    // _laravelApiClient = Get.find<LaravelApiClient>();

    return _laravelApiClient!.purchaseDeal(); // user
  }

  Future<List<dealByCategorydata.Data>> dealsByCategory(String id) {
    // User user
    // _laravelApiClient = Get.find<LaravelApiClient>();

    return _laravelApiClient!.dealsByCategory(id); // user
  }
}
