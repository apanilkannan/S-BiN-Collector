import 'package:get/get.dart';
import 'package:s_bin_collector/src/modules/marker_detail/controllers/marker_detail_controller.dart';

class MarkerDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MarkerDetailController>(() => MarkerDetailController());
  }
}
