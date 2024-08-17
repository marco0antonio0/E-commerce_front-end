import 'package:flutter/material.dart';

import 'package:dirrocha_ecommerce/components/fieldWidget.dart';
import 'package:dirrocha_ecommerce/components/Carousel.dart';
import 'package:dirrocha_ecommerce/components/itemBuild.dart';
import 'package:dirrocha_ecommerce/components/logo.dart';
import 'package:dirrocha_ecommerce/components/navigateSection.dart';
import 'package:dirrocha_ecommerce/components/sectionTitleAndOptions.dart';
import 'package:dirrocha_ecommerce/components/sectionTitleLogo.dart';
import 'package:dirrocha_ecommerce/services/products/getAllProducts.service.dart';
import 'package:go_router/go_router.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  TextEditingController controllerSearch = TextEditingController();
  late Future<List> _itemsFuture;
  int _currentIndex = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _itemsFuture = _loadData();
  }

  Future<List> _loadData() async {
    return await fetchItems();
  }

  void _onTabTapped(int index) {
    setState(() {
      switch (index) {
        case 0:
          context.go('/');
          break;
        case 1:
          context.go('/explore');
          break;
        case 2:
          context.go('/login');
          break;
        case 3:
          context.go('/cart');
          break;
        default:
          break;
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
      body: FutureBuilder<List>(
        future: _itemsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(), // Indicador de carregamento
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar dados.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum item encontrado.'));
          } else {
            return Scrollbar(
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
                          const SizedBox(height: 30),
                          Align(alignment: Alignment.center, child: logo()),
                          const SizedBox(height: 10),
                          Align(
                              alignment: Alignment.center,
                              child: sectionTitleLogo()),
                          const SizedBox(height: 10),
                          Align(
                              alignment: Alignment.center,
                              child: fieldWidget(wscreen,
                                  context: context,
                                  controller: controllerSearch,
                                  isReactive: true, action: () async {
                                if (controllerSearch.text.isEmpty) {
                                  context.go("/");
                                } else {
                                  context.go(
                                      '/search?product=${controllerSearch.text}');
                                }
                                setState(() {
                                  _itemsFuture =
                                      _loadData(); // Recarregar dados com base na pesquisa
                                });
                              })),
                          const SizedBox(height: 10),
                          const Carousel(
                            images: [
                              'images/bannerImage.png',
                              'images/banner1.png',
                              'images/banner2.png',
                              'images/logoSemFundo.png',
                            ],
                          ),
                          const SizedBox(height: 20),
                          sectionTitleAndSection(wscreen),
                          const SizedBox(height: 20),
                          ItemGrid(
                              futureItems:
                                  snapshot.data!), // Passar itens carregados
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
