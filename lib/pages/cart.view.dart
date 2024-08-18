import 'package:dirrocha_ecommerce/CustomMessages/popupAlert.dart';
import 'package:dirrocha_ecommerce/components/itemCartBuild.dart';
import 'package:dirrocha_ecommerce/services/cokiees/deleteCokiees.dart';
import 'package:dirrocha_ecommerce/services/cokiees/getCokiees.dart';
import 'package:dirrocha_ecommerce/services/cart/getAllCartItens.dart';
import 'package:dirrocha_ecommerce/services/validToken/fetch.dart';
import 'package:flutter/material.dart';
import 'package:dirrocha_ecommerce/components/navigateSection.dart';
import 'package:go_router/go_router.dart';

class PageCart extends StatefulWidget {
  const PageCart({super.key});

  @override
  State<PageCart> createState() => _PageCartState();
}

class _PageCartState extends State<PageCart> {
  bool popupLoad1 = false;
  bool popupLoad2 = false;
  bool popupLoad3 = false;
  bool itemsLoaded = false;
  var items = [];
  int _currentIndex = 3;
  final ScrollController _scrollController = ScrollController();

  bool isLoading = true;
  double opacity = 0.0; // Inicializando a opacidade em 0
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await _checkLoginStatus();
  }

  Future<bool> _checkLoginStatus() async {
    var isLoggedIn = await checkJwtToken();
    // ==============================================
    // chave jwt não encontrada
    if (isLoggedIn == null) {
      if (!popupLoad1) {
        showLoginAlertIsloginCheck(context);
        setState(() {
          popupLoad1 = true;
        });
      }
      return false;
    } else {
      // ==============================================
      //           chave jwt encontrada
      //      validando o token jwt se é valido
      //          CHAVE EM VALIDAÇÃO
      bool check = await fetchIsValidToken(isLoggedIn);
      if (!check) {
        await deleteJwtToken();
        if (!popupLoad2) {
          showLoginAlertExpiredSession(context);
          setState(() {
            popupLoad2 = true;
          });
        }
      } else {
        // ==============================================
        //        chave jwt encontrada
        //          CHAVE JA VALIDADA

        if (!itemsLoaded) {
          List temp = await _loadData();

          if (temp.isEmpty) {
            if (!popupLoad3) {
              showIsAlertTheCartIsEmpty(context);
              setState(() {
                popupLoad3 = true;
              });
            }
          }

          setState(() {
            items = temp;
            itemsLoaded = true;
          });
        }
      }

      return true;
    }
  }

  Future _loadData() async {
    var data = await fetchAllCartItem();
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
                              "Meu Carrinho",
                              style: TextStyle(
                                  fontSize: wscreen >= 700 ? 30 : 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(.7)),
                            )),
                            const SizedBox(height: 40),
                            items.isNotEmpty
                                ? ItemBuildCart(
                                    futureItems: items,
                                  )
                                : Container(),
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
