import 'package:paybox/app/models/loyalty_model.dart';
import 'package:paybox/app/providers/laravel_provider.dart';

class LoyaltyRepository {
  LaravelApiClient? _laravelApiClient;

  LoyaltyRepository() {
    _laravelApiClient = LaravelApiClient(); // Initialize _laravelApiClient here
  }

  Future<List<Data>> getLoyalties() {
    return _laravelApiClient!.getLoyalties();
  }
}
