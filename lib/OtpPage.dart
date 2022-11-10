import 'package:flutter/material.dart';
import 'package:otp_signup_signin_app/HomePage.dart';
import 'package:otp_signup_signin_app/OtpVerification.dart';

class OtpPage extends StatefulWidget {
  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: OtpVerification(),
    );
  }
}
