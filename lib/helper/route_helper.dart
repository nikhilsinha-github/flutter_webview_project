import 'package:get/get.dart';
import 'package:nepalbestdeal/view/homescreen.dart';

class RouteHelper {
  static const String initial = "/";

  static String getInitialRoute() => initial;

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => const HomeScreen(),
    ),
  ];
}
