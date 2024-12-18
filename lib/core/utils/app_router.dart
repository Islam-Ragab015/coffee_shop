import 'package:go_router/go_router.dart';

import '../../features/cart/presentation/views/cart_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/shop/presentation/views/shop_view.dart';
import '../../features/shop/presentation/views/widgets/drink_order_specifications.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kSplashView = '/';
  static const kHomeView = '/homeView';
  static const kShopView = '/shopView';
  static const kCartView = '/cartView';
  static const kDrinkOrderSpecifications = '/drinkOrderSpecifications';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kShopView,
        builder: (context, state) => const ShopView(),
      ),
      GoRoute(
        path: kCartView,
        builder: (context, state) => const CartView(),
      ),
      GoRoute(
        path: kDrinkOrderSpecifications,
        builder: (context, state) => const DrinkOrderSpecifications(),
      ),
    ],
  );
}
