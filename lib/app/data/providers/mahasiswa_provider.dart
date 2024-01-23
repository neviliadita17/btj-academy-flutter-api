import 'package:get/get.dart';

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

  Future<Response> deleteMahasiswa(int id) async =>
      await delete('mahasiswa/$id');


  Future<Response<dynamic>> getDetails(String? nama) async {
    try {
      final encodedNama = Uri.encodeComponent(nama ?? '');
      return await get('https://btj-academy-default-rtdb.asia-southeast1.firebasedatabase.app/mahasiswa.json/$encodedNama.json');
    } catch (e) {
      throw 'Error: $e';
    }
  }
}


