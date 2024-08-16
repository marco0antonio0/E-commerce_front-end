import 'package:dirrocha_ecommerce/CustomMessages/popupAlert.dart';
import 'package:dirrocha_ecommerce/components/buttonWithIconV2.dart';
import 'package:flutter/material.dart';
import 'package:dirrocha_ecommerce/components/logo.dart';
import 'package:dirrocha_ecommerce/components/navigateSection.dart';
import 'package:dirrocha_ecommerce/components/sectionTitleLogo.dart';
import 'package:go_router/go_router.dart';

class PageUser extends StatefulWidget {
  const PageUser({super.key});

  @override
  State<PageUser> createState() => _PageUserState();
}

class _PageUserState extends State<PageUser> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  late List<Map<String, dynamic>> items;
  int _currentIndex = 2;
  final ScrollController _scrollController = ScrollController();
  bool erroEmail = false;
  bool erroPassword = false;

  String messageErroEmail = '';
  String messageErroPassword = '';

  bool isLoading = true;
  double opacity = 0.0; // Inicializando a opacidade em 0

  @override
  void initState() {
    super.initState();
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
      body: false
          // ignore: dead_code
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
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: wscreen < 700 ? 30 : 0),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 500),
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
                                child: sectionTitleLogo(text: '')),

                            // ==============================================================
                            const SizedBox(height: 10),
                            const Center(
                                child: CircleAvatar(
                                    radius: 70,
                                    backgroundColor: Colors.green,
                                    child: Icon(Icons.person,
                                        color: Colors.white, size: 50))),

                            // ==============================================================
                            const SizedBox(height: 15),
                            // ==============================================================
                            const Center(
                                child: Text(
                              "Ola seja bem vindo usuario",
                              style: TextStyle(fontSize: 20),
                            )),
                            // ==============================================================
                            const SizedBox(height: 40),

                            // ==============================================================
                            buttonWithIconV2(wscreen,
                                icon: Icons.shopping_bag,
                                text: 'Ver minha compras', ontap: () async {
                              context.go('/user/minhas-compras');
                            }),
                            // ==============================================================
                            const SizedBox(height: 10),
                            // ==============================================================
                            buttonWithIconV2(wscreen,
                                icon: Icons.logout,
                                text: 'sair', ontap: () async {
                              showLoginAlertIslogoff(
                                  context, wscreen > 500 ? 500 : wscreen - 50);
                            }),
                            // ==============================================================
                            buttonWithIconV2Null(wscreen),
                            // ==============================================================
                            const SizedBox(height: 10),
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
