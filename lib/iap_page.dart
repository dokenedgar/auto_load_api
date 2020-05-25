import 'dart:async';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class PurchasePage extends StatefulWidget {
  @override
  _PurchasePageState createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  final InAppPurchaseConnection _iap = InAppPurchaseConnection.instance;
  List<ProductDetails> _products = <ProductDetails>[];
  List<String> _productsNotFound = <String>[];
  List<PurchaseDetails> _purchases = <PurchaseDetails>[];
  StreamSubscription _subscription;
  bool apiAvailable = false;
  final Set<String> _productIds = <String>{'some_product'};

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }

  Future<void> _initialize() async {
    apiAvailable = await _iap.isAvailable();
    if (apiAvailable) {
      _subscription = _iap.purchaseUpdatedStream
          .listen((List<PurchaseDetails> data) => setState(() {
                print('NEW PURCHASE');
                _purchases.addAll(data);
              }));
      final Set<String> ids = <String>{'sample_product'};
      final ProductDetailsResponse response =
          await _iap.queryProductDetails(ids);
      setState(() {
        /*
        print(response.productDetails[0].title);
        print(response.productDetails[0].description);
        print(response.productDetails[0].id);
        print(response.productDetails[0].price);
        print('SKU DETAIL');
        print(response.productDetails[0].skuDetail.title);
        print(response.productDetails[0].skuDetail.description);
        print(response.productDetails[0].skuDetail.price);
        print(response.productDetails[0].skuDetail.originalPrice);
        print(response.productDetails[0].skuDetail.sku);
        print(response.productDetails[0].skuDetail.subscriptionPeriod);
        print(response.productDetails[0].skuDetail.type);
        print(response.productDetails[0].skuDetail.freeTrialPeriod);
        */
        _products = response.productDetails;
        _productsNotFound = response.notFoundIDs;
      });
    }
  }

  void _buyProduct(ProductDetails product){
    final PurchaseParam purchaseParam = PurchaseParam(productDetails: product);
    _iap.buyNonConsumable(purchaseParam: purchaseParam);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(apiAvailable ? 'Available IAP' : 'IAP NOT AVAILABLE'),
      ),
      body: Center(
        child: _products.isEmpty
            ? const Text('Empty Products')
            : RaisedButton(
                child: const Text('Buy'),
                onPressed: () => _buyProduct(_products[0]),
              ),
      ),
    );
  }
}
