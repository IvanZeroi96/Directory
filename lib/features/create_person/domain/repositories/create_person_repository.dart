abstract class CreatePersonRepository {
  Future<bool> sendPersonService(String name, String email, String age);
  Future<bool> savePersonDataBase(String name, String email, String age);
}
