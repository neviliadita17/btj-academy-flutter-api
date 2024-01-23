import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.find<DetailController>();


    // Fetch details based on the 'nama' parameter
    controller.fetchDetails('nama');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Mahasiswa'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          final selectedMahasiswa = controller.selectedMahasiswa.value;

          // Check if details are available
          if (selectedMahasiswa != null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${selectedMahasiswa.nama ?? "-"}'),
                SizedBox(height: 8),
                Text('Nim: ${selectedMahasiswa.nim ?? "-"}'),
                SizedBox(height: 8),
                Text('Prodi: ${selectedMahasiswa.prodi ?? "-"}'),
                SizedBox(height: 8),
                Text('Angkatan: ${selectedMahasiswa.angkatan ?? "-"}'),
                SizedBox(height: 8),
                Text('IPK: ${selectedMahasiswa.ipk ?? "-"}'),
              ],
            );
          } else {
            // Show a loading indicator or error message if details are not available
            return CircularProgressIndicator();
          }
        }),
      ),
    );
  }
}
