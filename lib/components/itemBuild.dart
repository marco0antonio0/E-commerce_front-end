import 'package:dirrocha_ecommerce/components/buttonWithIcon.dart';
import 'package:dirrocha_ecommerce/entitites/item.entity.dart';
import 'package:dirrocha_ecommerce/services/validarItem/validar.service.dart';
import 'package:flutter/material.dart';
import 'package:dirrocha_ecommerce/components/item.dart';
import 'package:go_router/go_router.dart'; // Certifique-se de que 'Item' é uma classe pública

class ItemGrid extends StatefulWidget {
  final List<Map<String, dynamic>>? futureItems;

  const ItemGrid({super.key, this.futureItems});

  @override
  _ItemGridState createState() => _ItemGridState();
}

class _ItemGridState extends State<ItemGrid> {
  int count = 6;

  void incrementCount() {
    setState(() {
      count += 6;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            ItemService itemService = ItemService(data: widget.futureItems!);
            itemService.validarItens();

            int crossAxisCount;
            double childAspectRatio;

            if (constraints.maxWidth < 320) {
              crossAxisCount = 1;
              childAspectRatio = 0.85;
            } else if (constraints.maxWidth < 380) {
              crossAxisCount = 2;
              childAspectRatio = 0.6;
            } else if (constraints.maxWidth < 415) {
              crossAxisCount = 2;
              childAspectRatio = 0.7;
            } else if (constraints.maxWidth < 450) {
              crossAxisCount = 2;
              childAspectRatio = 0.65;
            } else if (constraints.maxWidth < 500) {
              crossAxisCount = 2;
              childAspectRatio = 0.8;
            } else if (constraints.maxWidth < 550) {
              crossAxisCount = 2;
              childAspectRatio = 0.9;
            } else if (constraints.maxWidth < 600) {
              crossAxisCount = 3;
              childAspectRatio = 2 / 3.5;
            } else {
              crossAxisCount = 3;
              childAspectRatio = 3 / 4.2;
            }

            return Column(
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    childAspectRatio: childAspectRatio,
                  ),
                  itemCount: itemService.getLength() > count
                      ? count
                      : itemService.getLength(),
                  itemBuilder: (context, index) {
                    ItemEntity data = itemService.getItem(index);

                    return InkWell(
                      onTap: () {
                        context.go('/produto?d=${data.id}&p=${data.provider}');
                      },
                      child: item(
                        price: data.price,
                        title: data.title,
                        subtitle: data.subtitle,
                        imgUrl: data.imgUrl,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                buttonWithIcon(constraints.maxWidth,
                    ontap: incrementCount, icon: Icons.add, text: "ver mais")
              ],
            );
          },
        )
      ],
    );
  }
}
