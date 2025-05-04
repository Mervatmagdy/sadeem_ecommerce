/// createdAt : "2025-04-30T09:41:02.053Z"
/// updatedAt : "2025-04-30T09:41:02.053Z"
/// barcode : "5784719087687"
/// qrCode : "https://cdn.dummyjson.com/public/qr-code.png"

class Meta {
  Meta({
    this.createdAt,
    this.updatedAt,
    this.barcode,
    this.qrCode,});

  Meta.fromJson(dynamic json) {
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    barcode = json['barcode'];
    qrCode = json['qrCode'];
  }
  String? createdAt;
  String? updatedAt;
  String? barcode;
  String? qrCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['barcode'] = barcode;
    map['qrCode'] = qrCode;
    return map;
  }

}