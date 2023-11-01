import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';

class PayTest extends StatefulWidget {
  const PayTest({Key? key}) : super(key: key);

  @override
  State<PayTest> createState() => _PayTestState();
}

class _PayTestState extends State<PayTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Pay"),
          onPressed: () async {
            var request = BraintreeDropInRequest(
              tokenizationKey: "sandbox_w3y6h2kk_f6dwk59vc6ftrbw5",
              collectDeviceData: true,
              paypalRequest: BraintreePayPalRequest(
                amount: '10.00',
                displayName: 'John Winston'
              ),
              cardEnabled: true,
            );
            BraintreeDropInResult? result = await BraintreeDropIn.start(request);
            if (result != null) {
              print(result.paymentMethodNonce.description);
              print(result.paymentMethodNonce.nonce);
            }
          },
        ),
      ),
    );
  }
}
