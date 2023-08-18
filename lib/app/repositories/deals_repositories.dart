import 'package:paybox/app/models/category_model.dart';
import 'package:paybox/app/providers/laravel_provider.dart';

class DealsRepository {
  LaravelApiClient? _laravelApiClient;

  DealsRepository() {
    _laravelApiClient = LaravelApiClient(); // Initialize _laravelApiClient here
  }

  Future<List<Data>> getCategories() {
    return _laravelApiClient!.getCategories();
  }
}
