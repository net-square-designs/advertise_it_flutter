class IProfile {
  final String firstName;
  final String lastName;
  final String middleName;
  final String image;
  final String bio;
  final String storeName;
  final String gender;
  final String dateOfBirth;
  final String nationality;
  final String stateOfOrigin;
  final String stateOfResidence;

  IProfile({
    this.firstName,
    this.lastName,
    this.middleName,
    this.image,
    this.bio,
    this.storeName,
    this.gender,
    this.dateOfBirth,
    this.nationality,
    this.stateOfOrigin,
    this.stateOfResidence,
  });

  factory IProfile.fromMap(Map data) {
    return IProfile(
      firstName: data['firstName'] ?? '',
      lastName: data["lastName"] ?? '',
      middleName: data['middleName'] ?? '',
      image: data['image'] ?? null,
      bio: data['bio'] ?? '',
      storeName: data['storeName'] ?? '',
      gender: data['gender'] ?? '',
      dateOfBirth: data['dateOfBirth'] ?? '',
      nationality: data['nationality'] ?? '',
      stateOfOrigin: data['stateOfOrigin'] ?? '',
      stateOfResidence: data['stateOfResidence'] ?? '',
    );
  }
}
