import 'package:dirrocha_ecommerce/components/buttonWithIcon.dart';
import 'package:dirrocha_ecommerce/components/imageLoader.dart';
import 'package:dirrocha_ecommerce/components/textProduct.dart';
import 'package:flutter/material.dart';
import 'package:dirrocha_ecommerce/components/navigateSection.dart';
import 'package:go_router/go_router.dart';

class PageSucessBuyCart extends StatefulWidget {
  const PageSucessBuyCart({super.key});

  @override
  State<PageSucessBuyCart> createState() => _PageSucessBuyCartState();
}

class _PageSucessBuyCartState extends State<PageSucessBuyCart> {
  bool load = false;
  int _currentIndex = 0;
  final ScrollController _scrollController = ScrollController();

  void _onTabTapped(int index) {
    switch (index) {
      case 0:
        context.go('/');
      case 1:
        context.go('/explore');
      case 2:
        context.go('/login');
      case 3:
        context.go('/cart');
      default:
    }
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double wscreen = MediaQuery.of(context).size.width;
    wscreen = wscreen > 700 ? 700 : wscreen;

    return Scaffold(
      bottomNavigationBar: RoundedBottomNavigationBar(
        wscreen: wscreen,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
      backgroundColor: Colors.white,
      body: AnimatedOpacity(
        opacity: 1, // Controlando a opacidade
        duration: const Duration(seconds: 0), // Duração da transição
        child: Scrollbar(
          controller: _scrollController,
          thumbVisibility: true,
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.vertical,
            child: Center(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: wscreen < 700 ? 15 : 0),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 700),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 200),
                      SizedBox(
                        width: wscreen,
                        height: wscreen > 700 ? 200 : 350,
                        child: loadNetworkImageWithFallback('',
                            fallbackAsset: 'images/sucess.png',
                            fit: BoxFit.scaleDown),
                      ),
                      const SizedBox(height: 0),
                      Center(
                          child: textProduct(
                              text: 'Compra realizada com sucesso')),
                      const SizedBox(height: 30),
                      buttonWithIcon(wscreen, text: 'Ir para o inicio',
                          ontap: () {
                        context.go('/');
                      })
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
