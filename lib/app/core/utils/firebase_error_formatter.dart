class FirebaseErrorFormatter {
  static format(dynamic error) {
    List errors = error.toString().split(']');
    String errorTitle =
        errors[0].toString().split('/')[1].replaceAll('-', ' ').toUpperCase();
    String errorMessage = errors[1].toString().trimLeft();
    return {'errorTitle': errorTitle, 'errorMessage': errorMessage};
  }
}
