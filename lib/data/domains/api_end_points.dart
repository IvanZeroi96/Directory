enum ApiEndpoints {
  getPersons,
  setPerson,
  updatePersons,
}

extension ApiEndpointsString on ApiEndpoints {
  String get url {
    switch (this) {
      case ApiEndpoints.getPersons:
        return 'contacts';
      case ApiEndpoints.setPerson:
        return 'contacts';
      case ApiEndpoints.updatePersons:
        return 'contacts';
    }
  }
}
