import 'package:dushshop/screens/orders_screen.dart';
import 'package:dushshop/screens/product_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/product_overview_screen.dart';
import '../provider/orders.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderdata = Provider.of<Orders>(context).order;
    return Drawer(
      child: Column(children: [
        AppBar(
          title: const Text(
            ' Options',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(
            Icons.shop,
            color: Colors.pinkAccent,
          ),
          title: const Text(
            'Shop',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 18),
          ),
          onTap: () => Navigator.of(context).pushReplacementNamed('/'),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(
            Icons.payment,
            color: Colors.pinkAccent,
          ),
          title: const Text(
            'Order',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 18),
          ),
          onTap: () {
            if (orderdata.isNotEmpty) {
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routeName);
            } else {
              Navigator.of(context).pushReplacementNamed('/');
            }
          },
        ),
      ]),
    );
  }
}
