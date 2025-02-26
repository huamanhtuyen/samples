class NhuCauVanChuyen {
  final int? id;
  final DateTime? createdAt;//được tạo tự động bởi database nên không được xử lý ở đây
  final String? userId;
  final String? anh1;
  final String? anh2;
  final String? anh3;
  final String? anh4;
  final String? anh5;
  final String? anh6;
  final String? anh7;
  final String? anh8;
  final String? anh9;
  final String? mota;
  final String? matinhxuatphat;
  final String? matinhdich;
  final String? kichthuoc;
  final String? trongluong;

  NhuCauVanChuyen({
    this.id,
    this.createdAt,
    this.userId,
    this.anh1,
    this.anh2,
    this.anh3,
    this.anh4,
    this.anh5,
    this.anh6,
    this.anh7,
    this.anh8,
    this.anh9,
    this.mota,
    this.matinhxuatphat,
    this.matinhdich,
    this.kichthuoc,
    this.trongluong,
  });

  factory NhuCauVanChuyen.fromJson(Map<String, dynamic> json) {
    return NhuCauVanChuyen(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      userId: json['user_id'],
      anh1: json['anh1'],
      anh2: json['anh2'],
      anh3: json['anh3'],
      anh4: json['anh4'],
      anh5: json['anh5'],
      anh6: json['anh6'],
      anh7: json['anh7'],
      anh8: json['anh8'],
      anh9: json['anh9'],
      mota: json['mota'],
      matinhxuatphat: json['matinhxuatphat'],
      matinhdich: json['matinhdich'],
      kichthuoc: json['kichthuoc'],
      trongluong: json['trongluong'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'created_at': createdAt?.toIso8601String(),
      'user_id': userId,
      'anh1': anh1,
      'anh2': anh2,
      'anh3': anh3,
      'anh4': anh4,
      'anh5': anh5,
      'anh6': anh6,
      'anh7': anh7,
      'anh8': anh8,
      'anh9': anh9,
      'mota': mota,
      'matinhxuatphat': matinhxuatphat,
      'matinhdich': matinhdich,
      'kichthuoc': kichthuoc,
      'trongluong': trongluong,
    };
    if (id != null) {
      data['id'] = id;
    }
    return data;
  }
}
