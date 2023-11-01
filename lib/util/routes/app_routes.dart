import 'package:bright_app/screens/login_register/components/widget_tree.dart';
import 'package:bright_app/util/routes/routes.dart';
import 'package:get/get.dart';

import '../../screens/dashboaerd_screen.dart';


class AppRoutes {
  static final appRoutes = [
    GetPage(name: Routes.dashboard, page: () => const DashboardScreen()),
    GetPage(name: Routes.login, page: () => WidgetTree()),
    // GetPage(name: Routes.home, page: () => const HomeScreen()),
    // GetPage(name: Routes.market, page: () => const InvestScreen()),
    // GetPage(name: Routes.plan, page: () => const PlanScreen()),
    // GetPage(name: Routes.profile, page: () => const ProfileScreen()),
  ];
}
