import 'dart:convert';

List<BarangModel> barangModelFromJson(String str) => List<BarangModel>.from(
    json.decode(str).map((x) => BarangModel.fromJson(x)));

String barangModelToJson(List<BarangModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BarangModel {
  final int? id;
  final String? alias;
  final int? categId;
  final String? barcode;
  final String? status;
  final String? weight;
  final int? stock;
  final String? buyingDt;
  final String? buyingFrom;
  final int? buyingPrice;
  final int? sellingPrice;
  final double? marketPrice;
  final String? photo;
  final String? notes;
  final String? createdAt;
  final String? updatedAt;
  final dynamic picture;

  BarangModel({
    this.id,
    this.alias,
    this.categId,
    this.barcode,
    this.status,
    this.weight,
    this.stock,
    this.buyingDt,
    this.buyingFrom,
    this.buyingPrice,
    this.sellingPrice,
    this.marketPrice,
    this.photo,
    this.notes,
    this.createdAt,
    this.updatedAt,
    this.picture,
  });

  BarangModel.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      alias = json['alias'] as String?,
      categId = json['categ_id'] as int?,
      barcode = json['barcode'] as String?,
      status = json['status'] as String?,
      weight = json['weight'] as String?,
      stock = json['stock'] as int?,
      buyingDt = json['buying_dt'] as String?,
      buyingFrom = json['buying_from'] as String?,
      buyingPrice = json['buying_price'] as int?,
      sellingPrice = json['selling_price'] as int?,
      // marketPrice = json['market_price'] as double?,
      marketPrice = double.tryParse(json['market_price'].toString()),
      photo = json['photo'] as String?,
      notes = json['notes'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?,
      picture = json['picture'];

  Map<String, dynamic> toJson() => {
    'id' : id,
    'alias' : alias,
    'categ_id' : categId,
    'barcode' : barcode,
    'status' : status,
    'weight' : weight,
    'stock' : stock,
    'buying_dt' : buyingDt,
    'buying_from' : buyingFrom,
    'buying_price' : buyingPrice,
    'selling_price' : sellingPrice,
    'market_price' : marketPrice,
    'photo' : photo,
    'notes' : notes,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'picture' : picture
  };
}