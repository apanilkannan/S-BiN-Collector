import 'package:get/get.dart';
import 'package:s_bin_collector/src/modules/login/bindings/login_binding.dart';
import 'package:s_bin_collector/src/modules/login/views/login_screen.dart';
import 'package:s_bin_collector/src/modules/map/bindings/map_binding.dart';
import 'package:s_bin_collector/src/modules/map/views/map_screen.dart';
import 'package:s_bin_collector/src/modules/marker_detail/bindings/marker_detail_binding.dart';
import 'package:s_bin_collector/src/modules/marker_detail/views/marker_detail_screen.dart';
import 'package:s_bin_collector/src/routes/app_routes.dart';

class AppPages {
  static const initialRoute = AppRoutes.login;

  static final routes = [
    GetPage(
        name: AppRoutes.login,
        page: () => const LoginScreen(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.googleMap,
        page: () => const MapScreen(),
        binding: MapBinding()),
    GetPage(
        name: AppRoutes.markerDetail,
        page: () => MarkerDetailScreen(),
        binding: MarkerDetailBinding())
  ];
}
