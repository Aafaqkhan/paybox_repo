import 'package:paybox/app/models/category_model.dart' as categorydata;
import 'package:paybox/app/models/allDeals_model.dart' as alldealsdata;
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
}
