import 'package:dirrocha_ecommerce/CustomMessages/popupAlert.dart';
import 'package:dirrocha_ecommerce/components/itemCartHasBuy.dart';
import 'package:dirrocha_ecommerce/services/cart/deleteItemCart.dart';
import 'package:dirrocha_ecommerce/services/cart/getAllCartItens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemBuildCartHasBuy extends StatefulWidget {
  final List? futureItems;

  const ItemBuildCartHasBuy({super.key, this.futureItems});

  @override
  State<ItemBuildCartHasBuy> createState() => _ItemBuildCartHasBuyState();
}

class _ItemBuildCartHasBuyState extends State<ItemBuildCartHasBuy> {
  double result = 0.0;
  var resItem = [];
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() {
    setState(() {
      resItem = widget.futureItems!;
    });
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
                      return itemCartHasBuy(
                        constraints.maxWidth,
                        quantidade: item['quantity'].toString(),
                        subtext: item['price'].toString(),
                        text: item['name'],
                      );
                    }
                    return null;
                  },
                ),
              ],
            );
          },
        )
      ],
    );
  }
}
