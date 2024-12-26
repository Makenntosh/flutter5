class User {
  final String name;
  final String email;
  final String phoneNumber;
  final String imageUrl;

  User(this.name, this.email, this.phoneNumber, this.imageUrl);

  String getFieldByIndex(int index) {
    switch (index) {
      case 0:
        return email;
      case 1:
        return phoneNumber;
      default:
        throw ArgumentError('Invalid index: $index');
    }
  }
}