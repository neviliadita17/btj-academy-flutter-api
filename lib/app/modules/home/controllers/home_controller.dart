import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:project_api/app/data/models/mahasiswa_model.dart';
import 'package:project_api/app/data/providers/mahasiswa_provider.dart';

class HomeController extends GetxController {
  MahasiswaProvider mahasiswaProvider = Get.find<MahasiswaProvider>();
  TextEditingController nameController = TextEditingController();
  TextEditingController nimController = TextEditingController();
  TextEditingController prodiController = TextEditingController();
  TextEditingController ipkController = TextEditingController();
  TextEditingController angkatanController = TextEditingController();

  RxList<Mahasiswa> data = <Mahasiswa>[].obs;
  RxBool loading = false.obs;

  initData() async {
    print('masuk sini');
    loading(true);
    try {
      await mahasiswaProvider.getMahasiswa().then((value) async {
        print('cek data dari API');
        // print(value!.body);
        await value.body.entries.map((element) {
          data.add(Mahasiswa(
            angkatan: element.value['angkatan'],
            ipk: element.value['ipk'],
            nama: element.value['nama'],
            nim: element.value['nim'],
            prodi: element.value['prodi'],
          ));
        }).toList();
        print('cek data list');
        print(data[0].nama);
        loading(false);
      });
    }
    catch (e) {
      loading(false);
      print(e);
    }
  }

  addData() async {
    try {
      // Validasi form tidak boleh kosong
      if (nameController.text.isEmpty ||
          nimController.text.isEmpty ||
          prodiController.text.isEmpty ||
          ipkController.text.isEmpty ||
          angkatanController.text.isEmpty) {
        Get.snackbar('Error', 'Semua form harus diisi');
        return;
      }

      await mahasiswaProvider.postMahasiswa(Mahasiswa(
        ipk: ipkController.text,
        nama: nameController.text,
        nim: nimController.text,
        prodi: prodiController.text,
        angkatan: angkatanController.text,
      )).then((value) {
        print('cek post mahasiswa');
        print(value.body);
        initData();
        Get.back();
        nameController.clear();
        nimController.clear();
        ipkController.clear();
        prodiController.clear();
        angkatanController.clear();
      });
    } catch (e) {
      print(e);
    }
  }

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
  void resetData() {
    nameController.clear();
    nimController.clear();
    prodiController.clear();
    ipkController.clear();
    angkatanController.clear();
  }

  @override
  void onClose() {
    nameController.dispose();
    angkatanController.dispose();
    prodiController.dispose();

    super.onClose();
  }

}
