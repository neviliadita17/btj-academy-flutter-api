import 'package:get/get.dart';

import '../datamahasiswa_model.dart';

class DatamahasiswaProvider extends GetConnect {
  // @override
  // void onInit() {
  //   httpClient.defaultDecoder = (map) {
  //     if (map is Map<String, dynamic>) return Datamahasiswa.fromJson(map);
  //     if (map is List)
  //       return map.map((item) => Datamahasiswa.fromJson(item)).toList();
  //   };
  //   httpClient.baseUrl = 'YOUR-API-URL';
  // }

  // Future<Response> getDatamahasiswa() async {
  //   final response = await get(
  //       'https://btj-academy-default-rtdb.asia-southeast1.firebasedatabase.app/mahasiswa.json');
  //   print('ini status code');
  //   print(response.statusCode);
  //   return response;
  // }

  Future<Response?> getDatamahasiswa() async {
    try {
      final response = await get(
          'https://btj-academy-default-rtdb.asia-southeast1.firebasedatabase.app/mahasiswa.json');

      if (response.statusCode == 200) {
        // Request was successful
        return response;
      } else {
        // Request failed with a non-200 status code
        print('Request failed with status: ${response.statusText}');
        return null; // or handle the error accordingly
      }
    } catch (error) {
      // Handle other errors that might occur during the request
      print('Error: $error');
      return null; // or handle the error accordingly
    }
  }


    Future<Response> postDatamahasiswa(
          Datamahasiswa datamahasiswa) async =>
      await post('https://btj-academy-default-rtdb.asia-southeast1.firebasedatabase.app/mahasiswa.json'
      , datamahasiswa);

  Future<Response> deleteDatamahasiswa(int id) async =>
      await delete('datamahasiswa/$id');
}
