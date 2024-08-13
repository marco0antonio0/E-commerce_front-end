import 'package:dirrocha_ecommerce/pages/404.view.dart';
import 'package:dirrocha_ecommerce/pages/home.view.dart';
import 'package:dirrocha_ecommerce/pages/login.view.dart';
import 'package:dirrocha_ecommerce/pages/product.view.dart';
import 'package:dirrocha_ecommerce/pages/register.view.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'shop',
      path: '/',
      builder: (context, state) => const PageHome(),
    ),
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) => const PageLogin(),
    ),
    GoRoute(
      name: 'register',
      path: '/register',
      builder: (context, state) => const PageRegister(),
    ),
    GoRoute(
        name: 'produto',
        path: '/produto',
        builder: (context, state) {
          String productId = '';
          String productProvider = '';
          try {
            productId = state.uri.queryParameters['d']!;
            productProvider = state.uri.queryParameters['p']!;
          } catch (e) {
            print('Erro ao obter o productId: $e');
            context.go('/404');
          }
          // print(productId);
          // print(productProvider);
          return PageProduct(
            id: productId,
            provider: productProvider,
          );
        }),
  ],
  errorBuilder: (context, state) => PageNotFound(),
);
