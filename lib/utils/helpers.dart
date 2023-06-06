import 'package:razorpay_flutter/razorpay_flutter.dart';

class Helpers {
  void razorPayRerquest(
      String nameForRazorPay, String contactNo, String email) async {
    try {
      String orderIdFromResp = '';

      Razorpay razorpay = Razorpay();
      var options = {
        'key': 'rzp_test_mryEzjBhlIuI3g',
        'redirect': true,
        'amount': 100,
        'order_id': orderIdFromResp,
        'name': nameForRazorPay,
        //'${SharedPrefs().fname}',
        'description': 'Booking Payment',
        'retry': {'enabled': true, 'max_count': 1},
        'send_sms_hash': true,
        'prefill': {
          'contact': contactNo,
          //'${SharedPrefs().mobile}',
          'email': email
          //'${SharedPrefs().email}'
        },
        // 'external': {
        //   'wallets': ['paytm']
        // }
      };
      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
      razorpay.open(options);
    } catch (e) {}
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) async {
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    // showAlertDialog(
    //     context, "External Wallet Selected", "${response.walletName}");
  }
}
