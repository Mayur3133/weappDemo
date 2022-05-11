import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class paymentgtw extends StatefulWidget {
  const paymentgtw({Key? key}) : super(key: key);

  @override
  State<paymentgtw> createState() => _paymentgtwState();
}

class _paymentgtwState extends State<paymentgtw> {
  Map<String, dynamic>? paymentIntentData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              makePayment(amount: '5', currency: 'USD');
            },
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Make Payment',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> makePayment(
      {required String amount, required String currency}) async {
    try {
      paymentIntentData = await createPaymentIntent(amount, currency);
      if (paymentIntentData != null) {
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
          applePay: true,
          googlePay: true,
          testEnv: true,
          merchantCountryCode: 'US',
          merchantDisplayName: 'Prospects',
          customerId: paymentIntentData!['customer'],
          paymentIntentClientSecret: paymentIntentData!['client_secret'],
          customerEphemeralKeySecret: paymentIntentData!['ephemeralKey'],
        ));
        displayPaymentSheet();
      }
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51KxjzaSCwVxg8MzfdoWlmbQXCQd9VZdaCJvTZrU1WSOKiKKMuklQ86qz6fjfM29pEkeuW6YDAoXVcw3Go5EIvVgL00RVV47o1z',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Payment Successful"),
          margin: const EdgeInsets.all(10),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.green,
        ),
      );
      // snackbar('Payment', 'Payment Successful',
      //     snackPosition: SnackPosition.BOTTOM,

    } on Exception catch (e) {
      if (e is StripeException) {
        print("Error from Stripe: ${e.error.localizedMessage}");
      } else {
        print("Unforeseen error: ${e}");
      }
    } catch (e) {
      print("exception:$e");
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }
}

//
// class PaymentController {
//   Map<String, dynamic>? paymentIntentData;
//
//   Future<void> makePayment(
//       {required String amount, required String currency}) async {
//     try {
//       paymentIntentData = await createPaymentIntent(amount, currency);
//       if (paymentIntentData != null) {
//         await Stripe.instance.initPaymentSheet(
//             paymentSheetParameters: SetupPaymentSheetParameters(
//               applePay: true,
//               googlePay: true,
//               testEnv: true,
//               merchantCountryCode: 'US',
//               merchantDisplayName: 'Prospects',
//               customerId: paymentIntentData!['customer'],
//               paymentIntentClientSecret: paymentIntentData!['client_secret'],
//               customerEphemeralKeySecret: paymentIntentData!['ephemeralKey'],
//             ));
//         displayPaymentSheet();
//       }
//     } catch (e, s) {
//       print('exception:$e$s');
//     }
//   }
//
//   displayPaymentSheet() async {
//     try {
//       await Stripe.instance.presentPaymentSheet();
//       snackbar('Payment', 'Payment Successful',
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.green,
//           colorText: Colors.white,
//           margin: const EdgeInsets.all(10),
//           duration: const Duration(seconds: 2));
//     } on Exception catch (e) {
//       if (e is StripeException) {
//         print("Error from Stripe: ${e.error.localizedMessage}");
//       } else {
//         print("Unforeseen error: ${e}");
//       }
//     } catch (e) {
//       print("exception:$e");
//     }
//   }
//
//   //  Future<Map<String, dynamic>>
//   createPaymentIntent(String amount, String currency) async {
//     try {
//       Map<String, dynamic> body = {
//         'amount': calculateAmount(amount),
//         'currency': currency,
//         'payment_method_types[]': 'card'
//       };
//       var response = await http.post(
//           Uri.parse('https://api.stripe.com/v1/payment_intents'),
//           body: body,
//           headers: {
//             'Authorization': 'Bearer Your Stripe Secret Key',
//             'Content-Type': 'application/x-www-form-urlencoded'
//           });
//       return jsonDecode(response.body);
//     } catch (err) {
//       print('err charging user: ${err.toString()}');
//     }
//   }
//
//   calculateAmount(String amount) {
//     final a = (int.parse(amount)) * 100;
//     return a.toString();
//   }
// }
