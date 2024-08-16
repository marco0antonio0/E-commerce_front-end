import 'package:dirrocha_ecommerce/CustomMessages/popupAlert.dart';
import 'package:dirrocha_ecommerce/components/buttonWithIcon.dart';
import 'package:dirrocha_ecommerce/components/imageLoader.dart';
import 'package:dirrocha_ecommerce/components/sectionPriceProduct.dart';
import 'package:dirrocha_ecommerce/components/textProduct.dart';
import 'package:dirrocha_ecommerce/entitites/item.entity.dart';
import 'package:dirrocha_ecommerce/services/cokiees/deleteCokiees.dart';
import 'package:dirrocha_ecommerce/services/cokiees/getCokiees.dart';
import 'package:dirrocha_ecommerce/services/cart/addItemCart.dart';
import 'package:dirrocha_ecommerce/services/products/getProductsByProviderAndId.service.dart';
import 'package:dirrocha_ecommerce/services/validToken/fetch.dart';
import 'package:dirrocha_ecommerce/services/validarItem/validar.service.dart';
import 'package:flutter/material.dart';
import 'package:dirrocha_ecommerce/components/navigateSection.dart';
import 'package:dirrocha_ecommerce/components/sectionTitleAndOptions.dart';
import 'package:go_router/go_router.dart';

class PageProduct extends StatefulWidget {
  final String id;
  final String provider;
  const PageProduct({super.key, required this.id, required this.provider});

  @override
  State<PageProduct> createState() => _PageProductState();
}

class _PageProductState extends State<PageProduct> {
  late ItemEntity item;
  bool load = false;
  int _currentIndex = 0;
  final ScrollController _scrollController = ScrollController();
// Inicializando a opacidade em 0

  @override
  void initState() {
    super.initState();
    _loadData();
  }

// final successAlert = buildButton(
//     onTap: () {

//     },
//     title: 'Success',
//     text: 'Transaction Completed Successfully!',
//     leadingImage: 'assets/success.gif',
//   );

  Future<void> _loadData() async {
    var data = await fetchItemsByProviderAndId(
        provider: widget.provider, id: widget.id);
    if (data == null) {
      context.go('/404');
    } else {
      ItemService itemService = ItemService(data: [data]);
      itemService.validarItens();
      ItemEntity temp = itemService.getItem(0);
      setState(() {
        load = temp.title.isNotEmpty;
        item = temp;
      });
    }
  }

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
      body: !load
          ? const Center(
              child: CircularProgressIndicator(), // Animação de carregamento
            )
          : AnimatedOpacity(
              opacity: 1, // Controlando a opacidade
              duration: const Duration(seconds: 0), // Duração da transição
              child: Scrollbar(
                controller: _scrollController,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.vertical,
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 700),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: wscreen,
                            height: wscreen > 700 ? 200 : 350,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(50),
                                  bottomRight: Radius.circular(50),
                                )),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: loadNetworkImageWithFallback(item.imgUrl,
                                  fit: BoxFit.scaleDown),
                            ),
                          ),
                          // ==============================================================
                          const SizedBox(height: 20),

                          // ==============================================================
                          //                    title product
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: wscreen < 700 ? 15 : 0),
                            child: sectionTitleAndSection(wscreen,
                                text: item.title),
                          ),
                          // ==============================================================
                          const SizedBox(height: 15),
                          // ==============================================================
                          //                    price product
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: wscreen < 700 ? 15 : 0),
                              child: sectionPriceProduct(price: item.price)),
                          // ==============================================================
                          const SizedBox(height: 20),
                          // ==============================================================
                          //                    text product
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: wscreen < 700 ? 15 : 0),
                              child: textProduct(text: item.subtitle)),
                          // ==============================================================
                          const SizedBox(height: 50),
                          // ==============================================================
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: wscreen < 700 ? 15 : 0),
                              child: buttonWithIcon(wscreen,
                                  icon: Icons.shopping_cart,
                                  text: "Adiciona", ontap: () async {
                                var res = await getJwtToken();
                                // ==============================================
                                //         chave jwt não encontrada
                                if (res == null) {
                                  showLoginAlertIslogin(
                                      context, wscreen > 500 ? 500 : wscreen);
                                } else {
                                  // ==============================================
                                  //           chave jwt encontrada
                                  //      validando o token jwt se é valido
                                  //          CHAVE EM VALIDAÇÃO
                                  bool check = await fetchIsValidToken(res);
                                  if (!check) {
                                    await deleteJwtToken();
                                    showLoginAlertExpiredSession(context);
                                  } else {
                                    await fetchAddCartItem(
                                      context,
                                      price: item.price,
                                      productName: item.title,
                                      popup: true,
                                      productId: item.id,
                                      provider: item.provider,
                                    );
                                  }
                                }
                              })),
                          // ==============================================================
                          const SizedBox(height: 100),
                          // ==============================================================
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
