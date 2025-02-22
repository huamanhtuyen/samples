class ThongTinXe {
  final int? id;
  final String email;
  final String? anh1;
  final String? anh2;
  final String? anh3;
  final String? anh4;
  final String? anh5;
  final String? anh6;
  final String? anh7;
  final String? anh8;
  final String? anh9;
  final String? matinh;
  final String? tentinh_tienganh;
  final String? tentinh_tiengviet;
  final String? tentinh_tiengthai;
  final String? temtinh_tiengtrung;
  final String? maquan;
  final String? tenquan_tienganh;
  final String? tenquan_tiengviet;
  final String? tenquan_tiengthai;
  final String? tenquan_tiengtrung;
  final String? diachichitiet;
  final String? bienso;
  final String? maloaixe;
  final String? tenloaixe_tienganh;
  final String? tenloaixe_tiengviet;
  final String? tenloaixe_tiengtrung;
  final String? tenloaixe_tiengthai;
  final double? taitrong_tan;
  final double? taitrong_m3;
  final String? kichthuoccont;

  ThongTinXe({
    this.id,
    required this.email,
    this.anh1,
    this.anh2,
    this.anh3,
    this.anh4,
    this.anh5,
    this.anh6,
    this.anh7,
    this.anh8,
    this.anh9,
    this.matinh,
    // ignore: non_constant_identifier_names
    this.tentinh_tienganh,
    // ignore: non_constant_identifier_names
    this.tentinh_tiengviet,
    // ignore: non_constant_identifier_names
    this.tentinh_tiengthai,
    // ignore: non_constant_identifier_names
    this.temtinh_tiengtrung,

    this.maquan,
    // ignore: non_constant_identifier_names
    this.tenquan_tienganh,
    // ignore: non_constant_identifier_names
    this.tenquan_tiengviet,
    // ignore: non_constant_identifier_names
    this.tenquan_tiengthai,
    // ignore: non_constant_identifier_names
    this.tenquan_tiengtrung,
    this.diachichitiet,
    this.bienso,
    this.maloaixe,
    // ignore: non_constant_identifier_names
    this.tenloaixe_tienganh,
    // ignore: non_constant_identifier_names
    this.tenloaixe_tiengviet,
    // ignore: non_constant_identifier_names
    this.tenloaixe_tiengtrung,
    // ignore: non_constant_identifier_names
    this.tenloaixe_tiengthai,
    // ignore: non_constant_identifier_names
    this.taitrong_tan,
    // ignore: non_constant_identifier_names
    this.taitrong_m3,
    this.kichthuoccont,
  });

  factory ThongTinXe.fromJson(Map<String, dynamic> json) {
    return ThongTinXe(
      id: json['id'],
      email: json['email'],
      anh1: json['anh1'],
      anh2: json['anh2'],
      anh3: json['anh3'],
      anh4: json['anh4'],
      anh5: json['anh5'],
      anh6: json['anh6'],
      anh7: json['anh7'],
      anh8: json['anh8'],
      anh9: json['anh9'],
      matinh: json['matinh'],
      tentinh_tienganh: json['tentinh_tienganh'],
      tentinh_tiengviet: json['tentinh_tiengviet'],
      tentinh_tiengthai: json['tentinh_tiengthai'],
      temtinh_tiengtrung: json['temtinh_tiengtrung'],
      maquan: json['maquan'],
      tenquan_tienganh: json['tenquan_tienganh'],
      tenquan_tiengviet: json['tenquan_tiengviet'],
      tenquan_tiengthai: json['tenquan_tiengthai'],
      tenquan_tiengtrung: json['tenquan_tiengtrung'],
      diachichitiet: json['diachichitiet'],
      bienso: json['bienso'],
      maloaixe: json['maloaixe'],
      tenloaixe_tienganh: json['tenloaixe_tienganh'],
      tenloaixe_tiengviet: json['tenloaixe_tiengviet'],
      tenloaixe_tiengtrung: json['tenloaixe_tiengtrung'],
      tenloaixe_tiengthai: json['tenloaixe_tiengthai'],
      taitrong_tan: json['taitrong_tan'],
      taitrong_m3: json['taitrong_m3'],
      kichthuoccont: json['kichthuoccont'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'email': email,
      'anh1': anh1,
      'anh2': anh2,
      'anh3': anh3,
      'anh4': anh4,
      'anh5': anh5,
      'anh6': anh6,
      'anh7': anh7,
      'anh8': anh8,
      'anh9': anh9,
      'matinh': matinh,
      'tentinh_tienganh': tentinh_tienganh,
      'tentinh_tiengviet': tentinh_tiengviet,
      'tentinh_tiengthai': tentinh_tiengthai,
      'temtinh_tiengtrung': temtinh_tiengtrung,
      'maquan': maquan,
      'tenquan_tienganh': tenquan_tienganh,
      'tenquan_tiengviet': tenquan_tiengviet,
      'tenquan_tiengthai': tenquan_tiengthai,
      'tenquan_tiengtrung': tenquan_tiengtrung,
      'diachichitiet': diachichitiet,
      'bienso': bienso,
      'maloaixe': maloaixe,
      'tenloaixe_tienganh': tenloaixe_tienganh,
      'tenloaixe_tiengviet': tenloaixe_tiengviet,
      'tenloaixe_tiengtrung': tenloaixe_tiengtrung,
      'tenloaixe_tiengthai': tenloaixe_tiengthai,
      'taitrong_tan': taitrong_tan,
      'taitrong_m3': taitrong_m3,
      'kichthuoccont': kichthuoccont,
    };
    if (id != null) {
      data['id'] = id;
    }
    return data;
  }
}
