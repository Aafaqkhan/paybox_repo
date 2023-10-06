import 'package:paybox/app/models/category_model.dart' as categorydata;
import 'package:paybox/app/models/allDeals_model.dart' as alldealsdata;
import 'package:paybox/app/models/deal_by_category_model.dart'
    as dealByCategorydata;
<<<<<<< HEAD
import 'package:paybox/app/models/nearest_deals_model.dart' as nearestdeals;
=======
>>>>>>> c931483518b3abff07e356e13cda4a3dea0c28e8
import 'package:paybox/app/providers/laravel_provider.dart';
import 'package:paybox/app/models/filter_deals_model.dart' as filterdeals;

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
<<<<<<< HEAD

  Future<List<nearestdeals.Data>> nearestDeals(String lat, String lng) {
    // User user
    // _laravelApiClient = Get.find<LaravelApiClient>();

    return _laravelApiClient!.nearestDeals(lat, lng); // user
  }

  Future<List<filterdeals.Data>> filterDeals(String filter, List categoryIds,
      String sort, int radius, String lat, String lng, String location) {
    // User user
    // _laravelApiClient = Get.find<LaravelApiClient>();

    return _laravelApiClient!.filterDeals(
        filter, categoryIds, sort, radius, lat, lng, location); // user
  }
=======
>>>>>>> c931483518b3abff07e356e13cda4a3dea0c28e8
}
