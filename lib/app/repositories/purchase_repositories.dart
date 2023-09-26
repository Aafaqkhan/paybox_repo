import 'package:paybox/app/models/purchase_model.dart';
import 'package:paybox/app/providers/laravel_provider.dart';

class PurchaseRepository {
  LaravelApiClient? _laravelApiClient;

  PurchaseRepository() {
    _laravelApiClient = LaravelApiClient(); // Initialize _laravelApiClient here
  }

  Future<List<Data>> getPurchases() {
    return _laravelApiClient!.getPurchases();
  }
}
