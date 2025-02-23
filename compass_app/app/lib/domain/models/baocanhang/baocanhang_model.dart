class BaoCanHang {
  final int? id;
  final String? email;
  final String? biensoxe;
  // ignore: non_constant_identifier_names
  final String? chieuvetu_matinh;
  // ignore: non_constant_identifier_names
  final String? chieuvetu_tentinh_tienganh;
  // ignore: non_constant_identifier_names
  final String? chieuvetu_tentinh_tiengviet;
  // ignore: non_constant_identifier_names
  final String? chieuvetu_tentinh_tiengthai;
  // ignore: non_constant_identifier_names
  final String? chieuvetu_temtinh_tiengtrung;
  // ignore: non_constant_identifier_names
  final String? veden_matinh;
  // ignore: non_constant_identifier_names
  final String? veden_tentinh_tienganh;
  // ignore: non_constant_identifier_names
  final String? veden_tentinh_tiengviet;
  // ignore: non_constant_identifier_names
  final String? veden_tentinh_tiengthai;
  // ignore: non_constant_identifier_names
  final String? veden_temtinh_tiengtrung;
  final double? gianhan;
  final double? gianhandvt;
  final DateTime? ngaydoitoida;

  BaoCanHang({
    this.id,
    this.email,
    this.biensoxe,
    // ignore: non_constant_identifier_names
    this.chieuvetu_matinh,
    // ignore: non_constant_identifier_names
    this.chieuvetu_tentinh_tienganh,
    // ignore: non_constant_identifier_names
    this.chieuvetu_tentinh_tiengviet,
    // ignore: non_constant_identifier_names
    this.chieuvetu_tentinh_tiengthai,
    // ignore: non_constant_identifier_names
    this.chieuvetu_temtinh_tiengtrung,
    // ignore: non_constant_identifier_names
    this.veden_matinh,
    // ignore: non_constant_identifier_names
    this.veden_tentinh_tienganh,
    // ignore: non_constant_identifier_names
    this.veden_tentinh_tiengviet,
    // ignore: non_constant_identifier_names
    this.veden_tentinh_tiengthai,
    // ignore: non_constant_identifier_names
    this.veden_temtinh_tiengtrung,
    this.gianhan,
    this.gianhandvt,
    this.ngaydoitoida,
  });

  factory BaoCanHang.fromJson(Map<String, dynamic> json) {
    return BaoCanHang(
      id: json['id'],
      email: json['email'],
      biensoxe: json['biensoxe'],
      chieuvetu_matinh: json['chieuvetu_matinh'],
      chieuvetu_tentinh_tienganh: json['chieuvetu_tentinh_tienganh'],
      chieuvetu_tentinh_tiengviet: json['chieuvetu_tentinh_tiengviet'],
      chieuvetu_tentinh_tiengthai: json['chieuvetu_tentinh_tiengthai'],
      chieuvetu_temtinh_tiengtrung: json['chieuvetu_temtinh_tiengtrung'],
      veden_matinh: json['veden_matinh'],
      veden_tentinh_tienganh: json['veden_tentinh_tienganh'],
      veden_tentinh_tiengviet: json['veden_tentinh_tiengviet'],
      veden_tentinh_tiengthai: json['veden_tentinh_tiengthai'],
      veden_temtinh_tiengtrung: json['veden_temtinh_tiengtrung'],
      gianhan: json['gianhan'],
      gianhandvt: json['gianhandvt'],
      ngaydoitoida: DateTime.parse(json['ngaydoitoida']),
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
       //không được phép truyền cột email khi insert dữ liệu vì cột này được kiểm soát hoàn toàn bằng DB      
      'biensoxe': biensoxe,
      'chieuvetu_matinh': chieuvetu_matinh,
      'chieuvetu_tentinh_tienganh': chieuvetu_tentinh_tienganh,
      'chieuvetu_tentinh_tiengviet': chieuvetu_tentinh_tiengviet,
      'chieuvetu_tentinh_tiengthai': chieuvetu_tentinh_tiengthai,
      'chieuvetu_temtinh_tiengtrung': chieuvetu_temtinh_tiengtrung,
      'veden_matinh': veden_matinh,
      'veden_tentinh_tienganh': veden_tentinh_tienganh,
      'veden_tentinh_tiengviet': veden_tentinh_tiengviet,
      'veden_tentinh_tiengthai': veden_tentinh_tiengthai,
      'veden_temtinh_tiengtrung': veden_temtinh_tiengtrung,
      'gianhan': gianhan,
      'gianhandvt': gianhandvt,
      'ngaydoitoida': ngaydoitoida?.toIso8601String(),
    };
    if (id != null) {
      data['id'] = id;
    }
    return data;
  }
}
