import 'dart:convert';

List<BarangModel> barangModelFromJson(String str) => List<BarangModel>.from(
    json.decode(str).map((x) => BarangModel.fromJson(x)));

String barangModelToJson(List<BarangModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BarangModel {
  String? id;
  String? alias;
  String? categId;
  String? barcode;
  String? status;
  String? weight;
  DateTime? buyingDt;
  String? buyingFrom;
  String? buyingPrice;
  dynamic sellingPrice;
  String? marketPrice;
  String? photo;
  String? notes;
  DateTime? createdAt;
  DateTime? updatedAt;

  BarangModel({
    this.id,
    this.alias,
    this.categId,
    this.barcode,
    this.status,
    this.weight,
    this.buyingDt,
    this.buyingFrom,
    this.buyingPrice,
    this.sellingPrice,
    this.marketPrice,
    this.photo,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });

  factory BarangModel.fromJson(Map<String, dynamic> json) => BarangModel(
      id: json["id"],
      alias: json["alias"] ?? '-',
      categId: json["categ_id"] ?? '0',
      barcode: json["barcode"] ?? '0',
      status: json["status"] ?? '0',
      weight: json["weight"] ?? '0',
      buyingDt:
          json["buying_dt"] == null ? null : DateTime.parse(json["buying_dt"]),
      buyingFrom: json["buying_from"] ?? '-',
      buyingPrice: json["buying_price"] ?? '0',
      sellingPrice: json["selling_price"] ?? '0',
      marketPrice: json["market_price"] ?? '0',
      photo: json["photo"] ?? '-',
      notes: json["notes"] ?? '-',
      createdAt: json["created_at"] == null
          ? null
          : DateTime.parse(json["created_at"]),
      updatedAt: json["updated_at"] == null
          ? null
          : DateTime.parse(json["updated_at"]));

  Map<String, dynamic> toJson() => {
        "id": id,
        "alias": alias,
        "categ_id": categId,
        "barcode": barcode,
        "status": status,
        "weight": weight,
        "buying_dt": buyingDt?.toIso8601String(),
        "buying_from": buyingFrom,
        "buying_price": buyingPrice,
        "selling_price": sellingPrice,
        "market_price": marketPrice,
        "photo": photo,
        "notes": notes,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
