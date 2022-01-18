import 'package:flutter/material.dart';

class orders_history extends StatefulWidget {
  const orders_history({Key? key}) : super(key: key);

  @override
  _orders_historyState createState() => _orders_historyState();
}

class _orders_historyState extends State<orders_history> {
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
          "Order History",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        height: 100,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: ListTile(
          leading: Icon(Icons.people),
          trailing: Icon(
            Icons.calendar_today,
            color: Colors.blue[700],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Order id = w001"),
              Text("Product id = ws001"),
            ],
          ),
          title: Text(
            "Zakir",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
