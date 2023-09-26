import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:paybox/app/modules/deals/controller/deals_controller.dart';

class StripePaymentController {
  String stripeSecretKey = "sk_test_PSPNJekAE1hOtqLg3x6Dg8a200oQOBXlv0";
  Map<String, dynamic>? paymentIntentData = {};

  final DealsController dealsController = DealsController();

  Future<void> makePayment(
      {required String amount,
      required String currency,
      required BuildContext context}) async {
    // dealsController.isPaymentSheetLoading.value = true;
    // Get.log(dealsController.isPaymentSheetLoading.value.toString());

    print('lllllllllllllllllllll');
    print(amount);
    try {
      Get.log('Present Payment Sheet 000');

      paymentIntentData = await createPaymentIntent(amount, currency);
      Get.log('Present Payment Sheet 111');

      if (paymentIntentData != null) {
        Get.log('Present Payment Sheet 222');

        await Stripe.instance
            .initPaymentSheet(
                paymentSheetParameters: SetupPaymentSheetParameters(
                    style: ThemeMode.dark,
                    merchantDisplayName: 'Prospects',
                    customerId: paymentIntentData!['customer'],
                    paymentIntentClientSecret:
                        paymentIntentData!['client_secret'],
                    customerEphemeralKeySecret:
                        paymentIntentData!['ephemeralKey'],
                    customFlow: true))
            .then((value) {});

        Get.log('Present Payment Sheet 333');
        await displayPaymentSheet(context, 'cleanseId');
        dealsController.isPaymentSheetLoading.value = false;
      }
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet(BuildContext context, String cleanseId) async {
    try {
      Get.log('Present Payment Sheet');
      await Stripe.instance.presentPaymentSheet();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Payment Successful')));
    } on Exception catch (e) {
      if (e is StripeException) {
        print("Error from Stripe: ${e.error.localizedMessage}");
      } else {
        print("Unforeseen error: $e");
      }
    } catch (e) {
      print("exception:$e");
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization': 'Bearer $stripeSecretKey',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      print(response.statusCode);
      print(response.body);
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  // calculateAmount(String amount) {
  //   final a = ((double.parse(amount).ceil()) * 100).toInt();
  //   return a.toString();
  // }
}
