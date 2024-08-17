import 'dart:math';
import 'package:dirrocha_ecommerce/components/itemCategories.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemGridCategories extends StatefulWidget {
  final bool activateButtom;
  final List<String>? futureItems;

  const ItemGridCategories(
      {super.key, this.futureItems, this.activateButtom = true});

  @override
  State<ItemGridCategories> createState() => _ItemGridCategoriesState();
}

class _ItemGridCategoriesState extends State<ItemGridCategories> {
  int count = 6;
  final Random _random = Random();

  final List<Color> _colorOptions = const [
    Color(0xFFEFF8F2), // Cor 1
    Color(0xFFFFF6EE), // Cor 2
    Color(0xFFFDE8E4), // Cor 3
    Color(0xFFF4EBF7), // Cor 4
    Color(0xFFFEF8E5), // Cor 5
    Color(0xFFEDF7FC), // Cor 6
  ];

  void incrementCount() {
    setState(() {
      count += 6;
    });
  }

  Color _getRandomColor() {
    // Seleciona uma cor aleatória da lista
    return _colorOptions[_random.nextInt(_colorOptions.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            // ItemService itemService = ItemService(data: widget.futureItems!);
            // itemService.validarItens();

            int crossAxisCount;
            double childAspectRatio;

            if (constraints.maxWidth < 320) {
              crossAxisCount = 1;
              childAspectRatio = 2;
            } else if (constraints.maxWidth < 380) {
              crossAxisCount = 2;
              childAspectRatio = 2;
            } else if (constraints.maxWidth < 415) {
              crossAxisCount = 2;
              childAspectRatio = 2;
            } else if (constraints.maxWidth < 450) {
              crossAxisCount = 2;
              childAspectRatio = 2;
            } else if (constraints.maxWidth < 500) {
              crossAxisCount = 2;
              childAspectRatio = 2;
            } else if (constraints.maxWidth < 550) {
              crossAxisCount = 2;
              childAspectRatio = 2;
            } else if (constraints.maxWidth < 600) {
              crossAxisCount = 3;
              childAspectRatio = 2;
            } else {
              crossAxisCount = 3;
              childAspectRatio = 2;
            }
            int limit = widget.futureItems!.length;

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
                  itemCount: limit,
                  itemBuilder: (context, index) {
                    var data = widget.futureItems![index];

                    return InkWell(
                      onTap: () {
                        context.go('/search?product=$data');
                      },
                      child: itemCategories(
                        title: data,
                        color: _getRandomColor(), // Cor aleatória da lista
                      ),
                    );
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
