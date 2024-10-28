import 'package:directory/data/domains/models/person_model.dart';

class PersonEntity {
  int id;
  String name;
  String email;
  String age;

  PersonEntity({
    this.id = 0,
    this.name = '',
    this.email = '',
    this.age = '',
  });

  PersonEntity.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        name = res['name'],
        email = res['email'],
        age = res['age'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'age': age,
    };
  }

  Map<String, Object?> toMapInsert() {
    return {
      'name': name,
      'email': email,
      'age': age,
    };
  }

  static List<PersonEntity> fromModelList(List<PersonModel> models) {
    return models.map((model) => fromModel(model)).toList();
  }

  static PersonEntity fromModel(PersonModel model) {
    return PersonEntity(
      id: int.tryParse(model.id) ?? 0,
      name: model.name,
      email: model.email,
      age: model.age.toString(),
    );
  }
}
