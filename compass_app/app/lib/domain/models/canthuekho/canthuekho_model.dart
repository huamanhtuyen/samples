class CanThueKho {
  final int? id;
  final DateTime? createdAt;
  final String? userId;
  final String? mota;
  final String? tencty;
  final String? sdt1;
  final String? sdt2;
  final String? sdt3;
  final String? matinh;
  final String? tentinhTiengviet;
  final String? tentinhTienganh;
  final String? tentinhTiengtrung;
  final String? tentinhTiengthai;
  final String? maquan;
  final String? tenquanTiengviet;
  final String? tenquanTienganh;
  final String? tenquanTiengtrung;
  final String? tenquanTiengthai;
  final String? anh1;
  final String? anh2;
  final String? anh3;
  final String? anh4;
  final String? anh5;
  final String? anh6;
  final String? anh7;
  final String? anh8;
  final String? anh9;

  CanThueKho({
    this.id,
    this.createdAt,
    this.userId,
    this.mota,
    this.tencty,
    this.sdt1,
    this.sdt2,
    this.sdt3,
    this.matinh,
    this.tentinhTiengviet,
    this.tentinhTienganh,
    this.tentinhTiengtrung,
    this.tentinhTiengthai,
    this.maquan,
    this.tenquanTiengviet,
    this.tenquanTienganh,
    this.tenquanTiengtrung,
    this.tenquanTiengthai,
    this.anh1,
    this.anh2,
    this.anh3,
    this.anh4,
    this.anh5,
    this.anh6,
    this.anh7,
    this.anh8,
    this.anh9,
  });

  factory CanThueKho.fromJson(Map<String, dynamic> json) {
    return CanThueKho(
      id: json['id'],
      createdAt:
          json['created_at'] != null
              ? DateTime.parse(json['created_at'])
              : null,
      userId: json['user_id'],
      mota: json['mota'],
      tencty: json['tencty'],
      sdt1: json['sdt1'],
      sdt2: json['sdt2'],
      sdt3: json['sdt3'],
      matinh: json['matinh'],
      tentinhTiengviet: json['tentinh_tiengviet'],
      tentinhTienganh: json['tentinh_tienganh'],
      tentinhTiengtrung: json['tentinh_tiengtrung'],
      tentinhTiengthai: json['tentinh_tiengthai'],
      maquan: json['maquan'],
      tenquanTiengviet: json['tenquan_tiengviet'],
      tenquanTienganh: json['tenquan_tienganh'],
      tenquanTiengtrung: json['tenquan_tiengtrung'],
      tenquanTiengthai: json['tenquan_tiengthai'],
      anh1: json['anh1'],
      anh2: json['anh2'],
      anh3: json['anh3'],
      anh4: json['anh4'],
      anh5: json['anh5'],
      anh6: json['anh6'],
      anh7: json['anh7'],
      anh8: json['anh8'],
      anh9: json['anh9'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'created_at': createdAt?.toIso8601String(),
      'user_id': userId,
      'mota': mota,
      'tencty': tencty,
      'sdt1': sdt1,
      'sdt2': sdt2,
      'sdt3': sdt3,
      'matinh': matinh,
      'tentinh_tiengviet': tentinhTiengviet,
      'tentinh_tienganh': tentinhTienganh,
      'tentinh_tiengtrung': tentinhTiengtrung,
      'tentinh_tiengthai': tentinhTiengthai,
      'maquan': maquan,
      'tenquan_tiengviet': tenquanTiengviet,
      'tenquan_tienganh': tenquanTienganh,
      'tenquan_tiengtrung': tenquanTiengtrung,
      'tenquan_tiengthai': tenquanTiengthai,
      'anh1': anh1,
      'anh2': anh2,
      'anh3': anh3,
      'anh4': anh4,
      'anh5': anh5,
      'anh6': anh6,
      'anh7': anh7,
      'anh8': anh8,
      'anh9': anh9,
    };
    if (id != null) {
      data['id'] = id;
    }
    return data;
  }
}
