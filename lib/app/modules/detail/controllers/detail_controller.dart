import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_api/app/data/models/mahasiswa_model.dart';
import 'package:project_api/app/data/providers/mahasiswa_provider.dart';

// class DetailController extends GetxController {
//   MahasiswaProvider mahasiswaProvider = Get.find<MahasiswaProvider>();
//
//   Rx<Mahasiswa?> selectedMahasiswa = Rx<Mahasiswa?>(null);
//   RxBool loading = false.obs;
//
//   fetchDetails(String? nama) async {
//     loading(true);
//     try {
//       await mahasiswaProvider.getDetails(nama).then((value) {
//         // Assuming getDetails returns Mahasiswa details based on the name
//         selectedMahasiswa.value = Mahasiswa(
//           angkatan: value['angkatan'],
//           ipk: value['ipk'],
//           nama: value['nama'],
//           nim: value['nim'],
//           prodi: value['prodi'],
//         );
//         loading(false);
//       });
//     } catch (e) {
//       loading(false);
//       print(e);
//     }
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//   }
//
//   @override
//   void onReady() {
//     super.onReady();
//   }
//
//   @override
//   void onClose() {
//     super.onClose();
//   }
// }

class DetailController extends GetxController {
  final MahasiswaProvider mahasiswaProvider = Get.find();
  RxBool loading = false.obs;
  Rx<Mahasiswa?> selectedMahasiswa = Rx<Mahasiswa?>(null);

  void fetchDetails(String? nama) async {
    loading(true);
    try {
      final Response response = await mahasiswaProvider.getDetails(nama);
      print(response.body);  // Tambahkan baris ini untuk mencetak respons API
      if (response.statusCode == 200) {
        // Menyesuaikan akses ke data sesuai dengan struktur respons dari API
        selectedMahasiswa.value = Mahasiswa.fromJson(response.body ?? {});
      } else {
        throw 'Failed to fetch details';
      }
    } catch (e) {
      print(e);  // Tambahkan baris ini untuk mencetak kesalahan
      throw 'Error: $e';
    } finally {
      loading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}