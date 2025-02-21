class HocSinh {
  final int? id;
  final String hoten;
  final int tuoi;

  HocSinh({this.id, required this.hoten, required this.tuoi});

  factory HocSinh.fromJson(Map<String, dynamic> json) {
    return HocSinh(id: json['id'], hoten: json['hoten'], tuoi: json['tuoi']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{'hoten': hoten, 'tuoi': tuoi};
    if (id != null) {
      data['id'] = id;
    }
    return data;
  }
}
