import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
// import 'package:get/get_rx/get_rx.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:project_api/app/data/models/mahasiswa_model.dart';
import 'package:project_api/app/data/providers/mahasiswa_provider.dart';
import 'package:project_api/app/modules/home/datamahasiswa_model.dart';

import 'package:project_api/app/modules/home/providers/datamahasiswa_provider.dart';

class HomeController extends GetxController {
  // MahasiswaProvider mahasiswaProvider = Get.find<MahasiswaProvider>();
  TextEditingController nameController = TextEditingController();
  TextEditingController nimController = TextEditingController();
  TextEditingController prodiController = TextEditingController();
  TextEditingController ipkController = TextEditingController();
  TextEditingController angkatanController = TextEditingController();

  DatamahasiswaProvider datamahasiswaProvider  = Get.find<DatamahasiswaProvider>();

  RxList<Mahasiswa> data = <Mahasiswa>[].obs;
  RxBool loading = false.obs;

  initData() async {
    print('masuk sini');
    loading(true);
    try {
      await datamahasiswaProvider.getDatamahasiswa().then((value) async {
        print('cek data dari API');
        print(value!.body);
        // await value?.body.entries.map((element) {
          // print(element.value);
          // var temp = Mahasiswa.fromJson(element.value);
          // data.add(temp);

        // }).toList();

        // await value.body.entries.map((element) {
        //   // print(element.value);
        //   // var temp = Mahasiswa.fromJson(element)
        //   data.add(Mahasiswa(
        //     prodi: element.value['prodi'],
        //     nim: element.value['nim'],
        //     nama: element.value['nama'],
        //     ipk: element.value['ipk'],
        //     angkatan: element.value['angkatan'],
        //   ));
        // }).toList();

        loading(false);
      });
    }
    catch (e) {
      loading(false);
      print(e);
    }
  }

  // addData()async{
  //   try{
  //     await datamahasiswaProvider.postDatamahasiswa(Datamahasiswa(
  //       ipk: ipkController.text,
  //       nama: nameController.text,
  //       nim: nimController.text,
  //       prodi: prodiController.text,
  //       angkatan: angkatanController.text,
  //     )).then((value){
  //       print('cek post mahasiswa');
  //       print(value.body);
  //       initData();
  //       Get.back();
  //       nameController.clear();
  //       nimController.clear();
  //       ipkController.clear();
  //       prodiController.clear();
  //       angkatanController.clear();
  //     });
  //   }catch(e){
  //     print(e);
  //   }
  // }

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    angkatanController.dispose();
    prodiController.dispose();

    super.onClose();
  }

}
