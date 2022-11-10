import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:otp_signup_signin_app/OtpPage.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:sms_autofill/sms_autofill.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String phoneNumberinput = '';
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Please Sign up with phone number to get Registered'),
          SizedBox(
            height: 20,
          ),
          IntlPhoneField(
            decoration: InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(borderSide: BorderSide()),
            ),
            initialCountryCode: 'IN',
            onChanged: (phone) {
              phoneNumberinput = phone.completeNumber;
            },
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
            child: Text(
              'Continue',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: (() async {
              await FirebaseAuth.instance.verifyPhoneNumber(
                phoneNumber: phoneNumberinput,
                verificationCompleted: (PhoneAuthCredential credential) {},
                verificationFailed: (FirebaseAuthException e) {},
                codeSent: (String verificationId, int? resendToken) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => OtpPage())));
                },
                codeAutoRetrievalTimeout: (String verificationId) {},
              );
            }),
          ),
        ]);
  }
}
