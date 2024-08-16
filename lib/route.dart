import 'package:dirrocha_ecommerce/effects/fadeTransition.dart';
import 'package:dirrocha_ecommerce/pages/404.view.dart';
import 'package:dirrocha_ecommerce/pages/cart.view.dart';
import 'package:dirrocha_ecommerce/pages/explore.view.dart';
import 'package:dirrocha_ecommerce/pages/hasBuy.view.dart';
import 'package:dirrocha_ecommerce/pages/home.view.dart';
import 'package:dirrocha_ecommerce/pages/login.view.dart';
import 'package:dirrocha_ecommerce/pages/product.view.dart';
import 'package:dirrocha_ecommerce/pages/register.view.dart';
import 'package:dirrocha_ecommerce/pages/search.view.dart';
import 'package:dirrocha_ecommerce/pages/sucessBuyCart.view.dart';
import 'package:dirrocha_ecommerce/pages/user.view.dart';
import 'package:dirrocha_ecommerce/services/cokiees/deleteCokiees.dart';
import 'package:dirrocha_ecommerce/services/cokiees/getCokiees.dart';
import 'package:dirrocha_ecommerce/services/validToken/fetch.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'shop',
      path: '/',
      pageBuilder: (context, state) => fadeTransition(const PageHome()),
    ),
    GoRoute(
      name: 'explore',
      path: '/explore',
      pageBuilder: (context, state) => fadeTransition(const PageExplore()),
    ),
    GoRoute(
      name: 'search',
      path: '/search',
      pageBuilder: (context, state) {
        String product = '';
        try {
          product = state.uri.queryParameters['product']!;
        } catch (e) {
          context.go('/404');
        }
        return fadeTransition(PageSearch(product: product));
      },
    ),
    GoRoute(
      name: 'login',
      path: '/login',
      pageBuilder: (context, state) => fadeTransition(const PageLogin()),
      redirect: (context, state) async {
        final jwt = await getJwtToken();
        if (jwt == null) {
          return '/login';
        }
        return '/user';
      },
    ),
    GoRoute(
      name: 'register',
      path: '/register',
      pageBuilder: (context, state) => fadeTransition(const PageRegister()),
      redirect: (context, state) async {
        final jwt = await getJwtToken();
        if (jwt == null) {
          return '/register';
        }
        return '/user';
      },
    ),
    GoRoute(
      name: 'usuario',
      path: '/user',
      pageBuilder: (context, state) => fadeTransition(const PageUser()),
      redirect: (context, state) async {
        final jwt = await getJwtToken();
        if (jwt == null) {
          return '/login';
        }
        bool check = await fetchIsValidToken(jwt);
        if (!check) {
          await deleteJwtToken();
          return '/login';
        }
        return '/user';
      },
    ),
    GoRoute(
      name: 'minhas compras',
      path: '/user/minhas-compras',
      pageBuilder: (context, state) =>
          fadeTransition(const PageItensComprados()),
      redirect: (context, state) async {
        final jwt = await getJwtToken();
        if (jwt == null) {
          return '/login';
        }
        bool check = await fetchIsValidToken(jwt);
        if (!check) {
          await deleteJwtToken();
          return '/login';
        }
        return '/user/minhas-compras';
      },
    ),
    GoRoute(
      name: 'carrinho de comprar',
      path: '/cart',
      pageBuilder: (context, state) => fadeTransition(const PageCart()),
    ),
    GoRoute(
      name: 'Compra realizada com sucesso',
      path: '/cart/sucess',
      pageBuilder: (context, state) =>
          fadeTransition(const PageSucessBuyCart()),
      redirect: (context, state) async {
        final jwt = await getJwtToken();
        if (jwt == null) {
          return '/';
        }
        bool check = await fetchIsValidToken(jwt);
        if (!check) {
          await deleteJwtToken();
          return '/';
        }
        return '/cart/sucess';
      },
    ),
    GoRoute(
      name: 'produto',
      path: '/produto',
      pageBuilder: (context, state) {
        String productId = '';
        String productProvider = '';
        try {
          productId = state.uri.queryParameters['d']!;
          productProvider = state.uri.queryParameters['p']!;
        } catch (e) {
          context.go('/404');
        }
        return fadeTransition(
            PageProduct(id: productId, provider: productProvider));
      },
    ),
  ],
  errorPageBuilder: (context, state) => fadeTransition(const PageNotFound()),
);
