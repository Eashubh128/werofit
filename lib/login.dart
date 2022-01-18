import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:werofit/constants.dart';
import 'package:werofit/otppage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String verifID = "";
  final FirebaseAuth auth = FirebaseAuth.instance;

  final snack = SnackBar(
    content: Text("OTP generated !!"),
    duration: Duration(seconds: 1),
  );
  WeroConsts weroConsts = new WeroConsts();

  TextEditingController mycontroller = TextEditingController();

  /* Future<void> getData(String mobile) async {
    Uri url = Uri.parse(weroConsts.loginotp);
    var result = await http
        .post(url, body: {'token': weroConsts.token, 'mobile': mobile});
    var jsonData = result.body;

    print(jsonData);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              child: Center(
                child: Text(
                  "WEROFIT",
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Login to your",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Account",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Get started with your account",
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    SizedBox(height: 35),
                    ConstrainedBox(
                      constraints: BoxConstraints.tightFor(width: 345),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        controller: mycontroller,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                            hintText: "Mobile Number",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 345,
                      height: 65,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(60, 60, 60, 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: FlatButton(
                        onPressed: () {
                          //getData(mycontroller.text);
                          // otprecv(mycontroller.text);
                          ScaffoldMessenger.of(context).showSnackBar(snack);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Otp(phone: mycontroller.text)),
                          );
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
