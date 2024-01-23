class Datamahasiswa {
  NoooyEMsEgh9zzoyviv? noooyEMsEgh9zzoyviv;

  Datamahasiswa({this.noooyEMsEgh9zzoyviv});

  Datamahasiswa.fromJson(Map<String, dynamic> json) {
    noooyEMsEgh9zzoyviv = json['-NoooyEMsEgh9zzoyviv'] != null
        ? NoooyEMsEgh9zzoyviv?.fromJson(json['-NoooyEMsEgh9zzoyviv'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (noooyEMsEgh9zzoyviv != null) {
      data['-NoooyEMsEgh9zzoyviv'] = noooyEMsEgh9zzoyviv?.toJson();
    }
    return data;
  }
}

class NoooyEMsEgh9zzoyviv {
  String? angkatan;
  String? ipk;
  String? nama;
  String? nim;
  String? prodi;

  NoooyEMsEgh9zzoyviv(
      {this.angkatan, this.ipk, this.nama, this.nim, this.prodi});

  NoooyEMsEgh9zzoyviv.fromJson(Map<String, dynamic> json) {
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
