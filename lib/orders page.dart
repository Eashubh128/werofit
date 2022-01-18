import 'package:flutter/material.dart';

class Orders_page extends StatefulWidget {
  const Orders_page({Key? key}) : super(key: key);

  @override
  _Orders_pageState createState() => _Orders_pageState();
}

class _Orders_pageState extends State<Orders_page> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 229, 229, 1),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_left,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Orders",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.people),
            trailing: Icon(
              Icons.calendar_today,
              color: Colors.blue[700],
            ),
            title: Text(
              "Zakir",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            subtitle: Text("OrderId = w001"),
          );
        },
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
