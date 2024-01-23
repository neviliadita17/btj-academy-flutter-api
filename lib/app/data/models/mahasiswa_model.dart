class Mahasiswa {
  String? angkatan;
  String? ipk;
  String? nama;
  String? nim;
  String? prodi;

  Mahasiswa({this.angkatan, this.ipk, this.nama, this.nim, this.prodi});

  Mahasiswa.fromJson(Map<String, dynamic> json) {
    angkatan = json['angkatan'];
    ipk = json['ipk'];
    nama = json['nama'];
    nim = json['nim'];
    prodi = json['prodi'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['angkatan'] = angkatan;
    data['ipk'] = ipk;
    data['nama'] = nama;
    data['nim'] = nim;
    data['prodi'] = prodi;
    return data;
  }
}
