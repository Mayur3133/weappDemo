import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_inapp_purchase/flutter_inapp_purchase.dart';

class InApp extends StatefulWidget {
  @override
  _InAppState createState() => new _InAppState();
}

class _InAppState extends State<InApp> {
  StreamSubscription? _purchaseUpdatedSubscription;
  StreamSubscription? _purchaseErrorSubscription;
  StreamSubscription? _conectionSubscription;
  final List<String> _productLists = Platform.isAndroid
      ? [
          'android.test.purchased',
          'point_1000',
          '5000_point',
          //   'android.test.canceled',
        ]
      : ['com.cooni.point1000', 'com.cooni.point5000'];

  // String _platformVersion = 'Unknown';
  List<IAPItem> _items = [];
  List<PurchasedItem> _purchases = [];
  Color bgcolor = Colors.white;

  Ref() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
    //_renderInApps();
    _getProduct();
  }

  @override
  void dispose() {
    if (_conectionSubscription != null) {
      _conectionSubscription!.cancel();
      _conectionSubscription = null;
    }
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = (await FlutterInappPurchase.instance.platformVersion)!;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // prepare
    var result = await FlutterInappPurchase.instance.initConnection;
    print('result: $result');

    if (!mounted) return;

    // setState(() {
    //   _platformVersion = platformVersion;
    // });

    try {
      String msg = await FlutterInappPurchase.instance.consumeAllItems;
      print('consumeAllItems: $msg');
    } catch (err) {
      print('consumeAllItems error: $err');
    }

    _conectionSubscription =
        FlutterInappPurchase.connectionUpdated.listen((connected) {
      print('connected: $connected');
    });

    _purchaseUpdatedSubscription =
        FlutterInappPurchase.purchaseUpdated.listen((productItem) {
      _getPurchases();
      print('purchase-updated: $productItem');
    });

    _purchaseErrorSubscription =
        FlutterInappPurchase.purchaseError.listen((purchaseError) {
      print('purchase-error: $purchaseError');
    });
    _getPurchases();
  }

  void _requestPurchase(IAPItem item) {
    FlutterInappPurchase.instance.requestPurchase(item.productId!);
  }

  Future _getProduct() async {
    List<IAPItem> items =
        await FlutterInappPurchase.instance.getProducts(_productLists);
    for (var item in items) {
      print('${item.toString()}');
      this._items.add(item);
    }

    this._items = items;
    // this._purchases = [];
    Ref();
  }

  Future _getPurchases() async {
    List<PurchasedItem>? items =
        await FlutterInappPurchase.instance.getAvailablePurchases();
    for (var item in items!) {
      print('${item.toString()}');
      this._purchases.add(item);
    }

    // this._items = [];
    this._purchases = items;
    Ref();
    if (_purchases.length > 0) {
      bgcolor = Colors.grey;
      Ref();
    }
  }

  Future _getPurchaseHistory() async {
    List<PurchasedItem>? items =
        await FlutterInappPurchase.instance.getPurchaseHistory();
    for (var item in items!) {
      print('${item.toString()}');
      this._purchases.add(item);
    }

    this._items = [];
    this._purchases = items;
    Ref();
  }

  List<Widget> _renderInApps() {
    List<Widget> widgets = this
        ._items
        .map((item) => Column(
              children: <Widget>[
                Stack(
                  children: [
                    Container(
                        padding: EdgeInsets.only(top: 10),
                        height: 170,
                        margin: EdgeInsets.only(bottom: 5.0),
                        child: Card(
                          elevation: 20,
                          color: bgcolor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${item.currency.toString()}\n${item.localizedPrice.toString()}\n${item.description.toString()} }",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                    Positioned(
                      left: 150,
                      bottom: 15,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey,
                            shadowColor: Colors.black54,
                            fixedSize: Size(100, 40)),
                        onPressed: () {
                          print("---------- Buy Item Button Pressed");
                          this._requestPurchase(item);
                        },
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                //height: 40,
                                alignment: Alignment.center,
                                child: Text('Buy Item'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ))
        .toList();
    return widgets;
  }

  List<Widget> _renderPurchases() {
    List<Widget> widgets = this
        ._purchases
        .map((item) => Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        item.toString(),
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ))
        .toList();
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width - 20;
    double buttonWidth = (screenWidth / 3) - 20;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.indigo,
                    shadowColor: Colors.black54,
                    fixedSize: Size(200, 40)),
                onPressed: () {
                  print("---------- Get Items Button Pressed");
                  this._getProduct();
                },
                child: Text(
                  'Get Items',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              Column(
                children: this._renderInApps(),
              )
            ],
          ),
        ),
      ),

      // Column(
      //   children: this._renderPurchases(),
      // ),
    );
  }
}
