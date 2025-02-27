class ThiTruongXNK {
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
  final String? brochurePictureVi;
  final String? brochurePictureEn;
  final String? brochurePictureZh;
  final String? brochurePictureTh;
  final String? brochurePictureOther1;
  final String? brochurePictureOther2;
  final String? brochurePictureOther3;
  final String? brochurePictureOther4;
  final String? brochurePictureOther5;
  final String? diachichitiet;

  ThiTruongXNK({
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
    this.brochurePictureVi,
    this.brochurePictureEn,
    this.brochurePictureZh,
    this.brochurePictureTh,
    this.brochurePictureOther1,
    this.brochurePictureOther2,
    this.brochurePictureOther3,
    this.brochurePictureOther4,
    this.brochurePictureOther5,
    this.diachichitiet,
  });

  factory ThiTruongXNK.fromJson(Map<String, dynamic> json) {
    return ThiTruongXNK(
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
      brochurePictureVi: json['brochure_picture_vi'],
      brochurePictureEn: json['brochure_picture_en'],
      brochurePictureZh: json['brochure_picture_zh'],
      brochurePictureTh: json['brochure_picture_th'],
      brochurePictureOther1: json['brochure_picture_other1'],
      brochurePictureOther2: json['brochure_picture_other2'],
      brochurePictureOther3: json['brochure_picture_other3'],
      brochurePictureOther4: json['brochure_picture_other4'],
      brochurePictureOther5: json['brochure_picture_other5'],
      diachichitiet: json['diachichitiet'],
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
      'brochure_picture_vi': brochurePictureVi,
      'brochure_picture_en': brochurePictureEn,
      'brochure_picture_zh': brochurePictureZh,
      'brochure_picture_th': brochurePictureTh,
      'brochure_picture_other1': brochurePictureOther1,
      'brochure_picture_other2': brochurePictureOther2,
      'brochure_picture_other3': brochurePictureOther3,
      'brochure_picture_other4': brochurePictureOther4,
      'brochure_picture_other5': brochurePictureOther5,
      'diachichitiet': diachichitiet,
    };
    if (id != null) {
      data['id'] = id;
    }
    return data;
  }
}
