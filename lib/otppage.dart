import 'package:flutter/gestures.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';

class Otp extends StatefulWidget {
  final String phone;
  const Otp({Key? key, required this.phone}) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final invalidsnack = SnackBar(
    content: Text("Invalid OTP!!"),
    duration: Duration(seconds: 1),
  );
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String _verificationCode = "";
  final FirebaseAuth auth = FirebaseAuth.instance;
  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                  (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int? resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }

  String enteredOTP = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(children: <Widget>[
          Container(
              width: double.infinity,
              child: Center(
                child: Text(
                  "W",
                  style: TextStyle(
                      fontSize: 80,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
              height: 308,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(91, 91, 91, 100),
                  Color.fromRGBO(49, 49, 49, 20)
                ], begin: Alignment.bottomRight, end: Alignment.topLeft),
              )),
          Expanded(
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 23, top: 37),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Enter Otp",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 11),
                      Text(
                        "We have sent you a otp to your",
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      RichText(
                          text: TextSpan(
                              text: "mobile number ",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                              children: [
                            TextSpan(
                                text: "  Change",
                                style: TextStyle(fontWeight: FontWeight.w500),
                                recognizer: TapGestureRecognizer()
                                  ..onTapDown = (details) {
                                    print("change pressed");
                                  })
                          ])),
                      SizedBox(
                        height: 44,
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: OtpTextField(
                          numberOfFields: 6,
                          borderColor: Color(0xFF512DA8),
                          borderWidth: 1,
                          fieldWidth: 30,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          margin: EdgeInsets.only(right: 20, left: 3),
                          showFieldAsBox: true,
                          onSubmit: (String otpCode) {
                            enteredOTP = otpCode;
                            print("otp submitted");
                            print(otpCode);
                          }, // end onSubmit
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 345,
                        height: 65,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(60, 60, 60, 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: FlatButton(
                          onPressed: () async {
                            try {
                              await FirebaseAuth.instance
                                  .signInWithCredential(
                                      PhoneAuthProvider.credential(
                                          verificationId: _verificationCode,
                                          smsCode: enteredOTP))
                                  .then((value) async {
                                if (value.user != null) {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home()),
                                      (route) => false);
                                }
                              });
                            } catch (e) {
                              FocusScope.of(context).unfocus();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(invalidsnack);
                            }

                            //verifyCode(widget.verifcode, enteredOTP);
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ])),
          )
        ]));
  }

  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }
}
