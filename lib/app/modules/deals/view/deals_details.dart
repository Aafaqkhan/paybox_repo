import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paybox/app/modules/deals/controller/deals_controller.dart';
import 'package:paybox/app/routes/app_routes.dart';
import 'package:paybox/app/services/colors/custom_colors.dart';
import 'package:paybox/app/services/global_payment_details.dart';
import 'package:paybox/app/services/global_stripe.dart';
import 'package:paybox/commonWidget/block_button_widget.dart';

class DealsDetails extends StatelessWidget {
  final String? image;
  final String? buisnessName;
  final String? address;
  final String? saleValue;
  final String? subHeading;
  final String? endDate;
  final String? startPrice;
  final String? dealPrice;
  final String? description;
  final String? about;

  const DealsDetails({
    super.key,
    this.image,
    this.buisnessName,
    this.address,
    this.saleValue,
    this.subHeading,
    this.endDate,
    this.startPrice,
    this.dealPrice,
    this.description,
    this.about,
  });

  void _showPaymentDetailsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: PaymentDetails(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final DealsController dealsController = DealsController();

    GetStorage? _box = GetStorage();

    var token = _box!.read('token');

    print(buisnessName);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deals'),
        backgroundColor: const Color(0xff3242F6),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 133,
                width: double.infinity,
                child: Column(
                  children: [
                    Stack(children: [
                      Container(
                        height: 133,
                        color: Colors.black,
                        width: double.infinity,
                        child: Opacity(
                          opacity: 0.5,
                          child: Image.network(
                            "https://paybox.jzmaxx.com/storage/stores/banner/${image!}",
                            fit: BoxFit.cover,
                          ),
                          //               Image.network(
                          //       "https://paybox.jzmaxx.com/" + widget.avatarpath!),
                          // ),
                        ),
                      ),
                      Positioned(
                        top: 14,
                        right: 1,
                        child: Container(
                          height: 31,
                          width: 83,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              // color: Color(0xff3242F6),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  bottomLeft: Radius.circular(12))),
                          child: TextWidget(
                              text: '$saleValue% off',
                              textStyle: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xff3242F6))),
                        ),
                      ),
                      Positioned(
                          width: 290,
                          left: 16,
                          top: 32,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                buisnessName ?? "",
                                style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Montserrat"),
                              ),
                              Text(
                                address ?? "",
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    // fontWeight: FontWeight.w700,
                                    fontFamily: "Montserrat"),
                              ),
                            ],
                          )),
                    ]),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // Text('asd,'),
                    // SizedBox(
                    //   height: 60,
                    //   width: 263,
                    //   child: Column(
                    //     children: [
                    //       Padding(
                    //         padding:
                    //              EdgeInsets.only(top: 16, left: 8, right: 27),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             TextWidget(
                    //                 text: 'Tea for two',
                    //                 textStyle:  TextStyle(
                    //                     color: Color(0xff000000),
                    //                     fontSize: 14,
                    //                     fontFamily: "Montserrat",
                    //                     fontWeight: FontWeight.w700)),
                    //             TextWidget(
                    //                 text: '10',
                    //                 textStyle:  TextStyle(
                    //                     color: Color(0xff000000),
                    //                     fontSize: 10,
                    //                     fontFamily: "Montserrat",
                    //                     fontWeight: FontWeight.w500,
                    //                     decoration: TextDecoration.lineThrough)),
                    //           ],
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding:  EdgeInsets.only(left: 8, right: 27),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             TextWidget(
                    //                 text: '2 cup tea',
                    //                 textStyle:  TextStyle(
                    //                     color: Color(0xff000000),
                    //                     fontSize: 12,
                    //                     fontFamily: "Montserrat",
                    //                     fontWeight: FontWeight.w400)),
                    //             TextWidget(
                    //                 text: '4.5',
                    //                 textStyle:  TextStyle(
                    //                   color: Color(0xff3242F6),
                    //                   fontSize: 14,
                    //                   fontFamily: "Montserrat",
                    //                   fontWeight: FontWeight.w700,
                    //                 )),
                    //           ],
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 300,
                          child: Text(subHeading ?? "",
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w700)),
                        ),
                        Column(
                          children: [
                            Text(startPrice ?? "",
                                style: const TextStyle(
                                    fontSize: 13,
                                    decoration: TextDecoration.lineThrough)),
                            Text(
                              dealPrice ?? "",
                              style: const TextStyle(
                                  color: Color(0xff3242F6),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                    Text('Ends on $endDate',
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: "Montserrat",
                        )),
                    const SizedBox(
                      height: 32,
                    ),
                    const Text('Description',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700)),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(description ?? ""),
                    const SizedBox(
                      height: 32,
                    ),
                    Text('About $buisnessName',
                        style: const TextStyle(
                            fontSize: 14,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700)),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(about ?? ""),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() {
                      return Center(
                        child: SizedBox(
                          width: 330,
                          height: 40,
                          child: BlockButtonWidget(
                            color: const Color(0xff3242F6),
                            text: dealsController.isPaymentSheetLoading.value ==
                                    false
                                ? const Text(
                                    'Purchase',
                                    style: TextStyle(color: Colors.white),
                                  )
                                : const Align(
                                    alignment: Alignment
                                        .center, // Center the CircularProgressIndicator
                                    child: SizedBox(
                                      width:
                                          30, // Adjust the width to your desired value
                                      height: 30,
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                            onPressed: dealsController
                                        .isPaymentSheetLoading.value ==
                                    false
                                ? () async {
                                    if (token == null) {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              content: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Text(
                                                      "Please ",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily:
                                                              "Montserrat",
                                                          fontSize: 12),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Get.offAllNamed(
                                                            Routes.LOGIN);
                                                      },
                                                      child: Text(
                                                        "Login here",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                "Montserrat",
                                                            color: AppColors
                                                                .greencolr,
                                                            fontSize: 13),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    }

                                    if (token != null) {
                                      dealsController
                                          .isPaymentSheetLoading.value = true;
                                      Get.log('before payment sheet');
                                      await StripePaymentController()
                                          .makePayment(
                                              amount: dealPrice!,
                                              currency: 'GBP',
                                              context: context);
                                      Get.log('After payment sheet');
                                      // dealsController.purchaseDeal();

                                      dealsController
                                          .isPaymentSheetLoading.value = false;

                                      // _showPaymentDetailsDialog(context);
                                    }
                                  }
                                : null,
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
