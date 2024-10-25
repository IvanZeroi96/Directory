enum ApiEndpoints {
  getPersons,
  setPerson,
}

extension ApiEndpointsString on ApiEndpoints {
  String get url {
    switch (this) {
      case ApiEndpoints.getPersons:
        return 'persons';
      case ApiEndpoints.setPerson:
        return 'person';
    }
  }
}
