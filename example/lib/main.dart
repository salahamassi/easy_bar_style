import 'package:easy_status_bar_style/easy_bar_style.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [styleRouteObserver],
      routes: {
        '/': (context) => const HomeScreen(),
        '/cart': (context) => const CartScreen(),
        '/payment': (context) => const PaymentScreen(),
        '/orders': (context) => const OrdersScreen(),
        '/ratings': (context) => const RatingsScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
      initialRoute: '/',
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SystemNavigationBarStyle(
      color: Colors.blue,
      child: StatusBarStyle(
        color: Colors.deepOrangeAccent,
        brightness: Brightness.light,
        maintainState: true,
        child: SizedBox(
          child: Container(
            color: Colors.amber,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  height: 120,
                  color: Colors.black,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/cart');
                  },
                  textColor: Colors.white,
                  child: const Text('Cart'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBarStyle(
      brightness: Brightness.dark,
      color: Colors.white60,
      child: Container(
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              height: 120,
              color: Colors.black,
              onPressed: () {
                Navigator.of(context).pushNamed('/payment');
              },
              textColor: Colors.white,
              child: const Text('Payment'),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBarStyle(
      color: Colors.lightGreenAccent,
      child: Container(
        color: Colors.lightGreenAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              height: 120,
              color: Colors.black,
              onPressed: () {
                Navigator.of(context).pushNamed('/orders');
              },
              textColor: Colors.white,
              child: const Text('Orders'),
            ),
          ],
        ),
      ),
    );
  }
}

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.red,
      body: Column(
        children: [
          MaterialButton(
            height: 120,
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pushNamed('/settings');
            },
            textColor: Colors.white,
            child: const Text('Orders'),
          ),
        ],
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyStyle(
      styles: const [
        SystemNavigationBarStyle(
          color: Colors.brown,
          iconBrightness: Brightness.light,
        ),
        StatusBarStyle(
          color: Colors.red,
          brightness: Brightness.light,
        ),
      ],
      child: Container(
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              height: 120,
              color: Colors.black,
              onPressed: () {
                Navigator.of(context).pushNamed('/ratings');
              },
              textColor: Colors.white,
              child: const Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingsScreen extends StatelessWidget {
  const RatingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyStyle(
      styles: const [
        StatusBarStyle(
          color: Colors.blue,
          brightness: Brightness.light,
        ),
        SystemNavigationBarStyle(
          color: Colors.brown,
          iconBrightness: Brightness.dark,
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.red,
        body: SafeArea(
          child: Column(
            children: [
              MaterialButton(
                height: 120,
                color: Colors.black,
                onPressed: () {
                  Navigator.of(context)
                      .popUntil((route) => route.settings.name == '/');
                },
                textColor: Colors.white,
                child: const Text('Ratings'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
