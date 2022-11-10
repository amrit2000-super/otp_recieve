import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpVerification extends StatefulWidget {
  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  void initState() {
    super.initState();
    listenOtp();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PinFieldAutoFill(
            cursor: Cursor(
                color: Color.fromARGB(255, 152, 63, 63),
                enabled: true,
                blinkWaitForStart: Duration(seconds: 1),
                blinkHalfPeriod: Duration(seconds: 1)),
            decoration: UnderlineDecoration(
                colorBuilder: FixedColorBuilder(Colors.black)),
            codeLength: 6),
      ],
    );
    Navigator.of(context).pop();
  }

  void listenOtp() async {
    await SmsAutoFill().listenForCode;
  }
}
