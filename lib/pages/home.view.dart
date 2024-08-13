import 'package:flutter/material.dart';

import 'package:dirrocha_ecommerce/components/fieldWidget.dart';
import 'package:dirrocha_ecommerce/components/Carousel.dart';
import 'package:dirrocha_ecommerce/components/itemBuild.dart';
import 'package:dirrocha_ecommerce/components/logo.dart';
import 'package:dirrocha_ecommerce/components/navigateSection.dart';
import 'package:dirrocha_ecommerce/components/sectionTitleAndOptions.dart';
import 'package:dirrocha_ecommerce/components/sectionTitleLogo.dart';
import 'package:dirrocha_ecommerce/services/getItem/getAllProducts.service.dart';
import 'package:go_router/go_router.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  TextEditingController controllerSearch = TextEditingController();
  late List<Map<String, dynamic>> _items;
  int _currentIndex = 0;
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = true;
  double _opacity = 0.0; // Inicializando a opacidade em 0

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    var data = await fetchItems();
    setState(() {
      _items = data; // Armazena os itens carregados
      _isLoading = false; // Dados carregados
      _opacity = 1.0; // Ajustando a opacidade para 1 após carregar
    });
  }

  void _onTabTapped(int index) {
    setState(() {
      switch (index) {
        case 0:
          context.go('/');
        case 1:
          context.go('/');
        case 2:
          context.go('/login');
        case 3:
          context.go('/');
        default:
      }
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
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(), // Animação de carregamento
            )
          : AnimatedOpacity(
              opacity: _opacity, // Controlando a opacidade
              duration: const Duration(seconds: 0), // Duração da transição
              child: Scrollbar(
                controller: _scrollController,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.vertical,
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: wscreen < 700 ? 15 : 0),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 700),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ==============================================================
                            const SizedBox(height: 30),
                            // ==============================================================
                            Align(alignment: Alignment.center, child: logo()),
                            // ==============================================================
                            const SizedBox(height: 10),
                            Align(
                                alignment: Alignment.center,
                                child: sectionTitleLogo()),
                            // ==============================================================
                            const SizedBox(height: 10),
                            // ==============================================================
                            Align(
                                alignment: Alignment.center,
                                child: fieldWidget(wscreen,
                                    controller: controllerSearch)),
                            // ==============================================================
                            const SizedBox(height: 10),
                            // ==============================================================
                            const Carousel(
                              images: [
                                'images/bannerImage.png',
                                'images/banner1.png',
                                'images/banner2.png',
                                'images/logoSemFundo.png',
                              ],
                            ),
                            // ==============================================================
                            const SizedBox(height: 20),
                            // ==============================================================
                            sectionTitleAndSection(wscreen),
                            // ==============================================================
                            const SizedBox(height: 20),
                            // ==============================================================
                            ItemGrid(futureItems: _items),
                            // ==============================================================
                            const SizedBox(height: 30),
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
