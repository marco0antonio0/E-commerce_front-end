import 'package:dirrocha_ecommerce/CustomMessages/popupAlert.dart';
import 'package:dirrocha_ecommerce/components/buttonWithResult.dart';
import 'package:dirrocha_ecommerce/components/itemCart.dart';
import 'package:dirrocha_ecommerce/services/cart/addItemCart.dart';
import 'package:dirrocha_ecommerce/services/cart/deleteItemCart.dart';
import 'package:dirrocha_ecommerce/services/cart/finalizeCart.dart';
import 'package:dirrocha_ecommerce/services/cart/getAllCartItens.dart';
import 'package:dirrocha_ecommerce/services/cart/removeItemCart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemBuildCart extends StatefulWidget {
  final List? futureItems;

  const ItemBuildCart({super.key, this.futureItems});

  @override
  State<ItemBuildCart> createState() => _ItemBuildCartState();
}

class _ItemBuildCartState extends State<ItemBuildCart> {
  double result = 0.0;
  var resItem = [];
  @override
  void initState() {
    super.initState();
    _loadData();
    calculateTotalSum();
  }

  _loadData() {
    setState(() {
      resItem = widget.futureItems!;
    });
  }

  incrementItem(index) {
    setState(() {
      resItem[index]['quantity'] += 1;
    });
    calculateTotalSum();
  }

  decrementItem(index) async {
    setState(() {
      resItem[index]['quantity'] -= 1;
    });
    if (resItem[index]['quantity'] == 0) {
      await fetchDeletCartItem(
          productId: resItem[index]['productId'],
          provider: resItem[index]['provider']);
      List temp = await fetchAllCartItem();
      if (temp.isEmpty) {
        showIsAlertTheCartIsEmpty(context);
      }
    }
    calculateTotalSum();
  }

  void calculateTotalSum() {
    double sum = 0.0;
    for (var item in resItem) {
      sum += item['quantity'] * item['price'];
    }

    setState(() {
      result = sum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.futureItems!.length,
                  itemBuilder: (context, index) {
                    // ItemEntity data = itemService.getItem(index);
                    var item = resItem[index];
                    if (item['quantity'] > 0) {
                      return itemCart(constraints.maxWidth,
                          add: () async {
                            await fetchAddCartItem(
                              context,
                              productId: item['productId'].toString(),
                              provider: item['provider'],
                            );
                            incrementItem(index);
                          },
                          remove: () async {
                            await fetchRemoveCartItem(
                              context,
                              productId: item['productId'].toString(),
                              provider: item['provider'],
                            );
                            await decrementItem(index);
                          },
                          quantidade: item['quantity'].toString(),
                          subtext: item['price'].toString(),
                          text: item['name'],
                          ontap: () async {
                            // context.go('/register');
                          });
                    }
                    return null;
                  },
                ),
                resItem.isEmpty
                    ? Container()
                    : buttonWithResult(constraints.maxWidth,
                        result: result,
                        text: 'Finalizar compra', ontap: () async {
                        await fetchFinalizeCartItem(context);
                      })
              ],
            );
          },
        )
      ],
    );
  }
}
