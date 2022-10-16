import 'package:get/get.dart';
import 'pages_name.dart';
import '../ui/pages/dashboard_page.dart';
import '../ui/pages/switch_page.dart';

class AppPages {
  static final pages = [
    GetPage(name: PagesName.dashboardPage, page: () => DashboardPage()),
    GetPage(name: PagesName.switchPage, page: () => SwitchPage())
  ];
}
