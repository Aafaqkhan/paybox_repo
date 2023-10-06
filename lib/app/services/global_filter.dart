import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paybox/app/modules/deals/controller/deals_controller.dart';
import 'package:paybox/app/modules/deals/view/deals_view.dart';
import 'package:paybox/app/modules/root/controller/root_controller.dart';
import 'package:paybox/app/services/colors/custom_colors.dart';
import 'package:paybox/commonWidget/text_field_widget.dart';

class MyFilterDialog extends StatelessWidget {
  final DealsController dealsController = Get.put(DealsController());
  final OptionController optionController = Get.put(OptionController());

  final VoidCallback? onPressedApply;
  final VoidCallback? onPressedReset;

  // String filter = 'sort';

  MyFilterDialog({super.key, this.onPressedApply, this.onPressedReset});

  @override
  Widget build(BuildContext context) {
    // Get.log(dealsController.filter.value.toString());
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            title: const Text(
              'Filters',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            content: Container(
              // height: 400,
              width: 400,
              child: DefaultTabController(
                length: 3, // Number of tabs
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    TabBar(
                      onTap: (index) {
                        if (index == 0) {
                          optionController.filterSelected.value = 'sort';
                        } else if (index == 1) {
                          optionController.filterSelected.value = 'location';
                        } else if (index == 2) {
                          optionController.filterSelected.value = 'category';
                        }
                      },
                      // controller: dealsController.selectedTabIndex.obs,
                      isScrollable: true,
                      physics: NeverScrollableScrollPhysics(),
                      labelColor: Colors.black,
                      tabs: [
                        Tab(
                          child: Row(
                            children: [
                              Icon(
                                Icons.filter_1,
                                size: 11,
                              ),
                              SizedBox(
                                  width:
                                      8), // Add some spacing between the icon and text
                              Text(
                                'Sort by',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    fontFamily: 'Montserrat'),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.filter_1,
                              size: 11,
                            ),
                            SizedBox(
                                width:
                                    8), // Add some spacing between the icon and text
                            Text(
                              'Location',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  fontFamily: 'Montserrat'),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.filter_1,
                              size: 11,
                            ),
                            SizedBox(
                                width:
                                    8), // Add some spacing between the icon and text
                            Text(
                              'Category',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  fontFamily: 'Montserrat'),
                            ),
                          ],
                        ),
                      ],
                      //  controller: dealsController.selectedTabIndex,
                    ),
                    // Obx(() {
                    //   return Text(
                    //     'Filter: ${optionController.filterSelected}', // Observe changes
                    //     style: const TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 16,
                    //       color: Colors.black,
                    //     ),
                    //   );
                    // }),
                    // Obx(() {
                    //   return Text(
                    //     'Sort: ${optionController.selectedOption}', // Observe changes
                    //     style: const TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 16,
                    //       color: Colors.black,
                    //     ),
                    //   );
                    // }),
                    // Obx(() {
                    //   return Text(
                    //     'location: ${optionController.locationEntered}', // Observe changes
                    //     style: const TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 16,
                    //       color: Colors.black,
                    //     ),
                    //   );
                    // }),
                    // Obx(() {
                    //   return Text(
                    //     'Radius: ${optionController.radius}', // Observe changes
                    //     style: const TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 16,
                    //       color: Colors.black,
                    //     ),
                    //   );
                    // }),
                    // Obx(() {
                    //   return Text(
                    //     'Selected Categories: ${optionController.selectedCategories}', // Observe changes
                    //     style: const TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 16,
                    //       color: Colors.black,
                    //     ),
                    //   );
                    // }),
                    // Obx(() {
                    //   return Text(
                    //     'Lat: ${dealsController.latitude}', // Observe changes
                    //     style: const TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 16,
                    //       color: Colors.black,
                    //     ),
                    //   );
                    // }),
                    // Obx(() {
                    //   return Text(
                    //     'long: ${dealsController.longitude}', // Observe changes
                    //     style: const TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 16,
                    //       color: Colors.black,
                    //     ),
                    //   );
                    // }),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 300,
                          width: 400, // Adjust the height as needed
                          child: TabBarView(
                            children: [
                              // Content for Tab 1
                              SortBy(),
                              // Content for Tab 2
                              Location(),
                              // Content for Tab 3
                              Category(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0, right: 26),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FilterButton(
                      text: const Text(
                        'Reset',
                      ),
                      onPressed:
                          //  onPressedReset,
                          () async {
                        await dealsController.setFilterAppliedSelectedFalse();
                        Get.log(dealsController.filterApplied.value.toString());
                        Navigator.pop(context);
                        RootController rootController = Get.find<
                            RootController>(); // Get the existing instance
                        rootController.currentIndex.value = 2;
                      },
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Obx(() {
                      return FilterButton(
                        text: dealsController.isFilterLoading.value == false
                            ? Text(
                                'Apply',
                                style: TextStyle(color: Colors.white),
                              )
                            : const Align(
                                alignment: Alignment
                                    .center, // Center the CircularProgressIndicator
                                child: SizedBox(
                                  width:
                                      20, // Adjust the width to your desired value
                                  height: 20,
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                        color: AppColors.maincolor,
                        onPressed:
                            // onPressedApply,

                            dealsController.isFilterLoading.value == false
                                ? () async {
                                    await dealsController
                                        .getCurrentPosition(context);
                                    await dealsController.filterDeals(
                                      filter:
                                          optionController.filterSelected.value,
                                      categoryIds:
                                          optionController.selectedCategories,
                                      sort: optionController
                                          .selectedOption.value
                                          .toString(),
                                      location: optionController
                                          .locationEntered.value
                                          .toString(),
                                      radius: optionController.radius.value,
                                      lat: dealsController.latitude.value,
                                      lng: dealsController.longitude.value,
                                    );
                                    await dealsController
                                        .setFilterAppliedSelectedTrue();
                                    Get.log(dealsController.filterApplied.value
                                        .toString());
                                    Navigator.pop(context);
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => DealsView()));

                                    RootController rootController = Get.find<
                                        RootController>(); // Get the existing instance
                                    rootController.currentIndex.value = 2;
                                  }
                                : null,
                      );
                    }),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SortBy extends StatelessWidget {
  SortBy({super.key});

  final OptionController optionController = Get.put(OptionController());

  @override
  Widget build(BuildContext context) {
    // int selectedOption = 1;
    return Padding(
      padding: const EdgeInsets.only(top: 34.0),
      child: Column(
        children: [
          Obx(
            () => ListTile(
              title: const Text('Distance'),
              leading: Radio(
                value: 'distance',
                groupValue: optionController.selectedOption.value,
                onChanged: (value) {
                  optionController.updateSelectedOption(value as String);
                  Get.log(value.toString());
                },
              ),
            ),
          ),
          Obx(
            () => ListTile(
              title: const Text('Nearest'),
              leading: Radio(
                value: 'nearest',
                groupValue: optionController.selectedOption.value,
                onChanged: (value) {
                  optionController.updateSelectedOption(value as String);
                  Get.log(value.toString());
                },
              ),
            ),
          ),
          // Text('Selected Option: ${optionController.selectedOption.value}'),
        ],
      ),
    );
  }
}

class Location extends StatelessWidget {
  Location({super.key});

  final OptionController optionController = Get.put(OptionController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 34.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Location',
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
          TextFieldWidget(
            hintText: "Enter your Location",

            // labelText: "Email Address",
            // initialValue: controller.currentUser!.value.email,
            onChanged: (input) =>
                optionController.locationEntered.value = input!,
            // onSaved: (input) => controller.currentUser!.value.email = input!,
            // validator: (input) =>
            //     !input!.contains('@') ? "Should be a valid email".tr : null,
            // isFirst: false,
            // isLast: false,
            // iconData: Icons.alternate_email,
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Distance',
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
          TextFieldWidget(
            hintText: "Enter your Distance in Miles",
            // labelText: "Email Address",
            // initialValue: controller.currentUser!.value.email,
            onChanged: (input) =>
                optionController.radius.value = int.parse(input),
            keyboardType: TextInputType.number,
            // onSaved: (input) => controller.currentUser!.value.email = input!,
            // validator: (input) =>
            //     !input!.contains('@') ? "Should be a valid email".tr : null,
            // isFirst: false,
            // isLast: false,
            // iconData: Icons.alternate_email,
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final OptionController optionController = Get.put(OptionController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 34.0),
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(8, (index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 100, child: Text(_categoryNames[index])),
                Obx(
                  () => Checkbox(
                    value: optionController.isCheckedList[index],
                    onChanged: (bool? value) {
                      optionController.updateCheckbox(index, value ?? false);
                    },
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

final List<String> _categoryNames = [
  'Activity',
  'Aesthetic',
  'Barbers',
  'Beauty',
  'Children',
  'Desserts',
  'Food & Drinks',
  'Hair',
  'Health & fitness',
  'Retail'
];

class FilterButton extends StatelessWidget {
  final Color? color;
  final Color? disableColor;
  final Widget? text;
  final VoidCallback? onPressed;
  const FilterButton(
      {super.key, this.color, this.text, this.onPressed, this.disableColor});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            border: Border.all(
              color: Colors.black,
            )),
        width: 90,
        height: 40,
        child: MaterialButton(
          disabledColor: Colors.grey,
          color: color,
          onPressed: onPressed,
          child: text,
        ),
      ),
    );
  }
}

class OptionController extends GetxController {
  RxString selectedOption = 'distance'.obs;

  RxString locationEntered = ''.obs;

  RxInt radius = 10.obs;

  RxString filterSelected = 'sort'.obs;

  void updateSelectedOption(String value) {
    selectedOption.value = value;
  }

  // Location

  // Category checkList

  RxList<bool> isCheckedList = List.generate(10, (index) => false).obs;
  RxList<int> selectedCategories = <int>[].obs;

  void updateCheckbox(int index, bool value) {
    isCheckedList[index] = value;

    if (value) {
      // Add the index to the selectedCategories list
      selectedCategories.add(index);
    } else {
      // Remove the index from the selectedCategories list
      selectedCategories.remove(index);
    }
  }
}
