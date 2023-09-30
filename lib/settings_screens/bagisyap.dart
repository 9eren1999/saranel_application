/* import 'dart:async'; */
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class DonationPage extends StatefulWidget {
  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  bool isButtonActive = false;
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  bool _availableForPurchase = true;
  List<ProductDetails> _products = [];

  String? selectedAmount;
  List<int> amounts = [20, 50, 100, 200, 500, 1000];
  Map<int, String> amountLinks = {
    20: "20tl",
    50: "50tl",
    100: "100tl",
    200: "200tl",
    500: "500tl",
    1000: "1000tl",
  };

  void onAmountDeselected() {
    setState(() {
      selectedAmount = null;
      isButtonActive = false;
    });
  }

  void onAmountSelected(int amount) {
    setState(() {
      selectedAmount = amount.toString();
      isButtonActive = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade800,
      appBar: AppBar(
        title: Text(
          "Saranel'e Destek Ol",
          style: appbarStyle(),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.blue.shade800,
            size: 19,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: ListView(
          children: [
            if (!_availableForPurchase)
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  color: Colors.red.shade600,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Üzgünüz, Saranel'e destek için işlemler şu an desteklenmiyor. Lütfen daha sonra tekrar deneyin.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, left: 10, right: 10, bottom: 15),
              child: Card(
                color: Colors.amber.shade600,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Saranel Platformu, yardıma ihtiyacı olan vatandaşları yardımsever insanlarla bir araya getiren tamamen ücretsiz bir uygulamadır. Fakat uygulamanın işleyişini sürdürebilmek için değerli destekçilerimize ihtiyacımız var. Yapacağınız bağışlarla, Saranel platformunun sunucu ve operasyonel giderlerine destek sağlayabilir, toplumsal yardımlaşma ve dayanışma misyonumuzun bir parçası olabilirsiniz.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 12,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Destek olmak istediğiniz miktarı belirleyin:",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        children: amounts.sublist(0, 3).map((amount) {
                          return ChoiceChip(
                              side: BorderSide.none,
                              label: Text(
                                '$amount TL',
                                style: TextStyle(color: Colors.blue.shade900),
                              ),
                              selected: selectedAmount == amount.toString(),
                              onSelected: (selected) {
                                if (selectedAmount == amount.toString()) {
                                  onAmountDeselected();
                                } else {
                                  onAmountSelected(amount);
                                }
                              },
                              backgroundColor: Colors.white,
                              selectedColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(color: Colors.white, width: 0),
                              ));
                        }).toList(),
                      ),
                      SizedBox(height: 10),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        children: amounts.sublist(3, 6).map((amount) {
                          return ChoiceChip(
                              side: BorderSide.none,
                              label: Text(
                                '$amount TL',
                                style: TextStyle(color: Colors.blue.shade900),
                              ),
                              selected: selectedAmount == amount.toString(),
                              onSelected: (selected) {
                                if (selectedAmount == amount.toString()) {
                                  onAmountDeselected();
                                } else {
                                  onAmountSelected(amount);
                                }
                              },
                              backgroundColor: Colors.white,
                              selectedColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(color: Colors.white, width: 0),
                              ));
                        }).toList(),
                      ),
                      SizedBox(height: 20),
                      if (isButtonActive && selectedAmount != null)
                        ElevatedButton(
                          onPressed: () async {
                            if (selectedAmount != null) {
                              final String? productSKU =
                                  amountLinks[int.parse(selectedAmount!)];
                              if (productSKU != null) {
                                final ProductDetails? product =
                                    _products.firstWhereOrNull(
                                        (product) => product.id == productSKU);
                                if (product != null) {
                                  final PurchaseParam purchaseParam =
                                      PurchaseParam(productDetails: product);
                                  await _inAppPurchase.buyNonConsumable(
                                      purchaseParam: purchaseParam);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Bu ürün şu an satın alınamıyor.')));
                                }
                              }
                            }
                          },
                          child: Text(
                            "Saranel'e Destek Ol",
                            style: TextStyle(
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.w400),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shadowColor:
                                MaterialStateProperty.all(Colors.transparent),
                            elevation: MaterialStateProperty.all(0.0),
                            side: MaterialStateProperty.all(BorderSide.none),
                          ),
                        ),
                      SizedBox(height: 20),
                      Text(
                        "Yapacağınız destek bir defalıktır, otomatik olarak yenilenmez.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 20)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _initializeInAppPurchase();
  }

  void _initializeInAppPurchase() async {
    final bool isAvailable = await _inAppPurchase.isAvailable();
    if (!isAvailable) {
      setState(() {
        _availableForPurchase = false;
      });
      return;
    }

    _inAppPurchase.purchaseStream.listen((purchaseDetailsList) {
      purchaseDetailsList.forEach((purchaseDetails) async {
        if (purchaseDetails.status == PurchaseStatus.pending) {
          // Satın alma işlemi bekliyor.
        } else {
          if (purchaseDetails.status == PurchaseStatus.error) {
            // Satın alma işlemi hatası.
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Satın alma işlemi başarısız.')));
          } else if (purchaseDetails.status == PurchaseStatus.purchased) {
            // Satın alma başarılı.
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Teşekkürler! Destek oldunuz.')));
            if (purchaseDetails.pendingCompletePurchase) {
              await _inAppPurchase.completePurchase(purchaseDetails);
            }
          }
        }
      });
    });
    final ProductDetailsResponse productDetailResponse =
        await _inAppPurchase.queryProductDetails(amountLinks.values.toSet());

    if (productDetailResponse.notFoundIDs.isNotEmpty) {
      setState(() {
        _availableForPurchase = false;
      });
      return;
    }

    setState(() {
      _products = productDetailResponse.productDetails;
    });
  }

  TextStyle appbarStyle() =>
      GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w800);
}
