import 'package:get/get.dart';
import 'package:project_api/app/modules/home/providers/datamahasiswa_provider.dart';
import '../../../data/providers/mahasiswa_provider.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    // Get.lazyPut<MahasiswaProvider>(
    //       () => MahasiswaProvider(),
    // );

    Get.lazyPut<DatamahasiswaProvider>(
          () => DatamahasiswaProvider(),
    );
  }
}
