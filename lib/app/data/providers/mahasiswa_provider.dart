import 'package:get/get.dart';
// import 'package:dio/dio.dart';

import '../models/mahasiswa_model.dart';

class MahasiswaProvider extends GetConnect {

  Future<Response> getMahasiswa() async {
    final response = await get(
        'https://btj-academy-default-rtdb.asia-southeast1.firebasedatabase.app/mahasiswa.json');
    return response;
  }

  Future<Response> postMahasiswa(Mahasiswa mahasiswa) async =>
      await post(
          'https://btj-academy-default-rtdb.asia-southeast1.firebasedatabase.app/mahasiswa.json',
      mahasiswa.toJson());
}


