import 'package:dirrocha_ecommerce/CustomMessages/popupAlert.dart';
import 'package:dirrocha_ecommerce/components/itemCartBuildHasBuy.dart';
import 'package:dirrocha_ecommerce/services/cokiees/getCokiees.dart';
import 'package:dirrocha_ecommerce/services/cart/getAllCartItens.dart';
import 'package:flutter/material.dart';
import 'package:dirrocha_ecommerce/components/navigateSection.dart';
import 'package:go_router/go_router.dart';

class PageItensComprados extends StatefulWidget {
  const PageItensComprados({super.key});

  @override
  State<PageItensComprados> createState() => _PageItensCompradosState();
}

class _PageItensCompradosState extends State<PageItensComprados> {
  bool popupLoad1 = false;
  bool itemsLoaded = false;
  var items = [];
  int _currentIndex = 2;
  final ScrollController _scrollController = ScrollController();

  bool isLoading = true;
  double opacity = 0.0; // Inicializando a opacidade em 0
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _checkLoginStatus();
  }

  Future<bool> _checkLoginStatus() async {
    // ==============================================
    // chave jwt não encontrada
    if (!itemsLoaded) {
      List temp = await _loadData();

      if (temp.isEmpty) {
        if (!popupLoad1) {
          showIsAlertTheCartHasBuyIsEmpty(context);
          setState(() {
            popupLoad1 = true;
          });
        }
      }

      setState(() {
        items = temp;
        itemsLoaded = true;
      });
    }

    return true;
  }

  Future _loadData() async {
    var data = await fetchAllCartItemHasBuy();
    if (!mounted) return []; // Verifique se o widget ainda está montado
    return data;
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
      body: FutureBuilder<bool>(
        future: _checkLoginStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(), // Animação de carregamento
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.data!) {
            return const SizedBox(); // Não mostra nada se não estiver logado
          } else {
            return AnimatedOpacity(
              opacity: 1, // Controlando a opacidade
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
                          horizontal: wscreen < 700 ? 30 : 0),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 500),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 40),
                            Center(
                                child: Text(
                              "Minhas compras",
                              style: TextStyle(
                                  fontSize: wscreen >= 700 ? 30 : 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(.7)),
                            )),
                            const SizedBox(height: 40),
                            ItemBuildCartHasBuy(
                              futureItems: items,
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
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

Future checkJwtToken() async {
  // Implemente sua lógica para verificar se o JWT está presente
  // Retorne true se o usuário estiver logado, false caso contrário
  return await getJwtToken(); // Exemplo simples
}
