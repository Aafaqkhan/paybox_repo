import 'package:get/get.dart';
import 'package:paybox/app/models/allDeals_model.dart' as alldealsdata;
import 'package:paybox/app/models/category_model.dart' as categorydata;
import 'package:paybox/app/repositories/deals_repositories.dart';
import 'package:paybox/commonWidget/ui.dart';

class DealsController extends GetxController {
  final categories = <categorydata.Data>[].obs;
  final allDeals = <alldealsdata.Data>[].obs;

  DealsRepository? _categoryRepository;

  DealsController() {
    _categoryRepository = DealsRepository();
  }

  @override
  void onInit() {
    super.onInit();
    getCategories();
    getAllDeals();
  }

  Future getCategories() async {
    if (_categoryRepository == null) Get.log('_categoryRepository is null');
    try {
      categories.assignAll(await _categoryRepository!.getCategories());
      print(categories[0].name);
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  Future getAllDeals() async {
    if (_categoryRepository == null) Get.log('_categoryRepository is null');
    try {
      allDeals.assignAll(await _categoryRepository!.getAllDeals());
      print(allDeals[0].businessTitle);
      print(allDeals);
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  Future refreshDeals({bool showMessage = false}) async {
    // await getSlider();
    await getCategories();
    // await getFeatured();
    // await getRecommendedSalons();
    // Get.find<RootController>().getNotificationsCount();
    if (showMessage) {
      Get.showSnackbar(
          Ui.SuccessSnackBar(message: "Home page refreshed successfully"));
    }
  }
}
