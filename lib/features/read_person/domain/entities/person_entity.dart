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
}
