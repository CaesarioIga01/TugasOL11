import 'package:flutter/material.dart';
import 'package:oll11/cart.dart';
import 'package:oll11/money.dart';
import 'package:provider/provider.dart';

class MultiPage extends StatefulWidget {
  @override
  _MultiPageState createState() => _MultiPageState();
}

class _MultiPageState extends State<MultiPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<Money>(
            builder: (context) => Money(),
          ),
          ChangeNotifierProvider<Cart>(
            builder: (context) => Cart(),
          ),
        ],
        child: Scaffold(
          floatingActionButton: Consumer<Money>(
            builder: (context, money, _) => Consumer<Cart>(
              builder: (context, cart, _) => FloatingActionButton(
                onPressed: () {
                  if (money.balance >= 50000) {
                    cart.quantity += 1;
                    money.balance -= 50000;
                  }
                },
                child: Icon(Icons.add_shopping_cart),
                backgroundColor: Colors.blue,
              ),
            ),
          ),
          appBar: AppBar(
            leading: Icon(
              Icons.multiline_chart,
              color: Colors.black,
            ),
            backgroundColor: Colors.cyan[100],
            title: Text(
              "Multi Provider",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Balance"),
                    Container(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Consumer<Money>(
                          builder: (context, money, _) => Text(
                            money.balance.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      height: 30,
                      width: 150,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 2)),
                    ),
                  ],
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Consumer<Cart>(
                      builder: (context, cart, _) => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "T - Shirts (50000) x " + cart.quantity.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            (500 * cart.quantity).toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  height: 30,
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
