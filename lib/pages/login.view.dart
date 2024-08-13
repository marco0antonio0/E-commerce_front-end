import 'package:dirrocha_ecommerce/components/banner.dart';
import 'package:dirrocha_ecommerce/components/buttonWithIcon.dart';
import 'package:dirrocha_ecommerce/services/validateFieldUser/validateLogin.service.dart';
import 'package:flutter/material.dart';
import 'package:dirrocha_ecommerce/components/fieldWidget.dart';
import 'package:dirrocha_ecommerce/components/logo.dart';
import 'package:dirrocha_ecommerce/components/navigateSection.dart';
import 'package:dirrocha_ecommerce/components/sectionTitleAndOptions.dart';
import 'package:dirrocha_ecommerce/components/sectionTitleLogo.dart';
import 'package:dirrocha_ecommerce/services/getItem/getAllProducts.service.dart';
import 'package:go_router/go_router.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({super.key});

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
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
    // _loadData();
  }

  Future<void> _loadData() async {
    var data = await fetchItems();
    setState(() {
      items = data; // Armazena os itens carregados
      isLoading = false; // Dados carregados
      opacity = 1.0; // Ajustando a opacidade para 1 após carregar
    });
  }

  void _onTabTapped(int index) {
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
                                child: sectionTitleLogo(text: 'Login')),

                            // ==============================================================
                            const SizedBox(height: 10),
                            // ==============================================================
                            banner(wscreen),
                            // ==============================================================
                            const SizedBox(height: 40),
                            // ==============================================================
                            sectionTitleAndSection(wscreen,
                                fontSize: wscreen > 700 ? 24 : 18,
                                text: "Email"),
                            // ==============================================================
                            const SizedBox(height: 10),
                            // ==============================================================
                            Align(
                                alignment: Alignment.center,
                                child: fieldWidget(wscreen,
                                    hasError: erroEmail,
                                    controller: controllerEmail,
                                    icon: Icons.person,
                                    errorMessage: messageErroEmail,
                                    hintText: 'Digite seu email')),
                            // ==============================================================
                            const SizedBox(height: 10),
                            // ==============================================================
                            sectionTitleAndSection(
                              fontSize: wscreen > 700 ? 24 : 18,
                              wscreen,
                              text: "Password",
                            ),
                            // ==============================================================
                            const SizedBox(height: 10),
                            // ==============================================================
                            Align(
                                alignment: Alignment.center,
                                child: fieldWidget(wscreen,
                                    hasError: erroPassword,
                                    isPassword: true,
                                    controller: controllerPassword,
                                    errorMessage: messageErroPassword,
                                    icon: Icons.password,
                                    hintText: 'Digite sua senha')),
                            // ==============================================================
                            const SizedBox(height: 30),
                            // ==============================================================
                            buttonWithIcon(wscreen,
                                icon: Icons.arrow_forward,
                                text: 'Login', ontap: () async {
                              var response = await valideFieldUserLogin(
                                  context: context,
                                  email: controllerEmail.text,
                                  password: controllerPassword.text);
                              if (!response[0] &&
                                  (response[1] && response[2])) {
                                // campo preenchido porem senha ou email incorretos
                                setState(() {
                                  erroEmail = !response[0];
                                  erroPassword = !response[0];

                                  messageErroEmail = !response[0]
                                      ? 'Email e/ou senha incorretos'
                                      : '';

                                  messageErroPassword = !response[0]
                                      ? 'Email e/ou senha incorretos'
                                      : '';
                                });
                              }
                              if (!response[0] &&
                                  (!response[1] || !response[2])) {
                                // campo não preenchido e senha e/ou email incorretos
                                setState(() {
                                  erroEmail = !response[1];
                                  erroPassword = !response[2];

                                  messageErroEmail =
                                      !response[1] ? 'Campo Email vazio' : '';

                                  messageErroPassword =
                                      !response[2] ? 'Campo senha vazio' : '';
                                });
                              }
                              if (response[0] && response[1] && response[2]) {
                                // ============================================
                                //            Logado com sucesso
                                // ============================================
                              }
                            }),
                            // ==============================================================
                            const SizedBox(height: 8),
                            // ==============================================================
                            buttonWithIcon(wscreen,
                                color: Colors.blue,
                                icon: Icons.account_circle,
                                text: 'Criar nova conta', ontap: () {
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
