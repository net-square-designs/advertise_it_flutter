import 'package:advertise_it/models/profile.interface.dart';

class IUser {
  final String id;
  final String uniqueId;
  final String email;
  final String phone;
  final String accountType;
  final String secretKey;
  final IProfile profile;

  IUser({
    this.id,
    this.uniqueId,
    this.email,
    this.phone,
    this.accountType,
    this.secretKey,
    this.profile
  });

  factory IUser.fromMap(Map data) {
    return IUser(
      id: (data['id']).toString() ?? '',
      uniqueId: data["uniqueId"] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'] ?? '',
      accountType: data['accountType'] ?? '',
      secretKey: data['secretKey'] ?? '',
      profile: IProfile.fromMap(data['Profile']),
    );
  }
}

final d = {
  'id': 40,
  'uniqueId': 'QjJQ5VixPJ',
  'Profile': {
    'firstName': 'Philip',
    'lastName': 'Hirthe',
    'middleName': null,
    'image': 'https://s3.amazonaws.com/uifaces/faces/twitter/GavicoInd/128.jpg',
    'bio': 'Nulla illum quia est magnam pariatur.',
    'storeName': null,
    'gender': null,
    'dateOfBirth': null,
    'nationality': null,
    'stateOfOrigin': null,
    'stateOfResidence': null
  },
  'email': 'Philip5@gmail.com',
  'phone': '(362) 686-2217',
  'accountType': 'Customer',
  'secretKey': 'tvrx9J-Dt2-Philip5@gmail.com',
  'iat': '1572892484',
  'exp': '1573756484'
};
