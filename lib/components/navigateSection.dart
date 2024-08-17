// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoundedBottomNavigationBar extends StatelessWidget {
  final double wscreen;
  final int currentIndex;
  final Function(int) onTap;

  const RoundedBottomNavigationBar({
    super.key,
    required this.wscreen,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // double wscreenV = constraints.maxWidth;
    double hscreen = 100.0;
    double sizeIcon = 45.0;
    double sizeText = 15.0;

    if (wscreen < 640) {
      hscreen = 80.0;
      sizeText = 13.0;
      sizeIcon = 35.0;
    }

    return Container(
      height: hscreen,
      alignment: Alignment.bottomCenter,
      child: Container(
        width: wscreen,
        height: hscreen,
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          mouseCursor: MouseCursor.uncontrolled,
          unselectedItemColor: Colors.black.withOpacity(.5),
          selectedItemColor: const Color(0xff53B175),
          iconSize: sizeIcon,
          unselectedFontSize: sizeText,
          elevation: 20,
          backgroundColor: Colors.white.withOpacity(1),
          currentIndex: currentIndex,
          onTap: onTap,
          items: [
            // ====================================================
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'images/icons/iconShop.svg',
                height: sizeIcon,
                color: currentIndex == 0
                    ? const Color(0xff53B175)
                    : Colors.black.withOpacity(0.5),
              ),
              label: "Shop",
            ),
            // ====================================================
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'images/icons/iconExplore.svg',
                height: sizeIcon,
                color: currentIndex == 1
                    ? const Color(0xff53B175)
                    : Colors.black.withOpacity(0.5),
              ),
              label: "Explorar",
            ),
            // ====================================================
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'images/icons/iconAccount.svg',
                height: sizeIcon,
                color: currentIndex == 2
                    ? const Color(0xff53B175)
                    : Colors.black.withOpacity(0.5),
              ),
              label: "Conta",
            ),
            // ====================================================
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'images/icons/iconCart.svg',
                height: sizeIcon,
                color: currentIndex == 3
                    ? const Color(0xff53B175)
                    : Colors.black.withOpacity(0.5),
              ),
              label: "Carrinho",
            ),
          ],
        ),
      ),
    );
  }
}
