import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) =>
    List<CategoryModel>.from(
        json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  final int? id;
  final String? name;
  final int? parentId;
  final String? groupCateg;
  final String? description;

  CategoryModel({
    this.id,
    this.name,
    this.parentId,
    this.groupCateg,
    this.description,
  });

  CategoryModel.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      name = json['name'] as String?,
      parentId = json['parent_id'] as int?,
      groupCateg = json['group_categ'] as String?,
      description = json['description'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'parent_id' : parentId,
    'group_categ' : groupCateg,
    'description' : description
  };
}