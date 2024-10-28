import 'package:json_annotation/json_annotation.dart';

part 'person_model.g.dart';

@JsonSerializable()
class PersonModel {
  final String id;
  final String name;
  final String email;
  final String age;

  PersonModel({
    this.id = '0',
    this.name = '',
    this.email = '',
    this.age = '',
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) => _$PersonModelFromJson(json);
  Map<String, dynamic> toJson() => _$PersonModelToJson(this);

  static List<PersonModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => PersonModel.fromJson(json)).toList();
  }
}
