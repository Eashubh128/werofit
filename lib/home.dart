import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String uid = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 50),
            height: 150,
            width: double.infinity,
            child: Text(
              "Werofit",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 15),
              color: Color.fromRGBO(229, 229, 229, 100),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Hello Rajesh",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "You have 3 orders today ",
                    style: TextStyle(color: Colors.blue[400]),
                  ),
                  GridView.count(
                      padding: EdgeInsets.only(right: 15, top: 30),
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Colors.white),
                          child: Icon(
                            Icons.grid_view,
                            color: Colors.blue[400],
                            size: 50,
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: Colors.white),
                            child: Icon(
                              Icons.history,
                              color: Colors.blue[400],
                              size: 50,
                            )),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: Colors.white),
                            child: Icon(
                              Icons.account_balance_wallet,
                              color: Colors.blue[400],
                              size: 50,
                            )),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Colors.white),
                          child: Icon(
                            Icons.notifications,
                            color: Colors.blue[400],
                            size: 50,
                          ),
                        )
                      ]),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue[300],
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Color.fromRGBO(229, 229, 229, 100),
              ),
              label: "home"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.grid_view,
              color: Color.fromRGBO(229, 229, 229, 100),
            ),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
              color: Color.fromRGBO(229, 229, 229, 100),
            ),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_box,
              color: Color.fromRGBO(229, 229, 229, 100),
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
} 
/*
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    uid = FirebaseAuth.instance.currentUser!.uid;
  }
}*/
