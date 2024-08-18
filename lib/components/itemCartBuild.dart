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

  Future incrementItem(index) async {
    // avisa a interface da quantidade de items
    setState(() {
      resItem[index]['quantity'] += 1;
    });
    // avisa a interface de calculo total
    calculateTotalSum();
    // fetch api
    await fetchAddCartItem(
      context,
      productId: resItem[index]['productId'].toString(),
      provider: resItem[index]['provider'],
    );
  }

  Future decrementItem(index) async {
    // avisa a interface da quantidade de items
    setState(() {
      resItem[index]['quantity'] -= 1;
    });
    // avisa a interface de calculo total
    calculateTotalSum();
    // fetch api
    await fetchRemoveCartItem(
      context,
      productId: resItem[index]['productId'].toString(),
      provider: resItem[index]['provider'],
    );
    // Se a quantidade de item for igual a zero
    if (resItem[index]['quantity'] == 0) {
      // fetch api
      await fetchDeletCartItem(
          productId: resItem[index]['productId'],
          provider: resItem[index]['provider']);
      // ===============================================
      // fetch api
      List temp = await fetchAllCartItem();
      if (temp.isEmpty) {
        showIsAlertTheCartIsEmpty(context);
      }
    }
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
                  itemCount: resItem.length,
                  itemBuilder: (context, index) {
                    var item = resItem[index];
                    if (item['quantity'] > 0) {
                      return itemCart(
                        constraints.maxWidth,
                        add: () async {
                          await incrementItem(index);
                        },
                        remove: () async {
                          await decrementItem(index);
                        },
                        quantidade: item['quantity'].toString(),
                        subtext: item['price'].toString(),
                        text: item['name'],
                      );
                    }
                    return Container();
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
