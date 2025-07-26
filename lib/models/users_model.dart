class UsersModel {
  final String status;
  final String message;
  final String language;
  final UsersData data;

  UsersModel({
    required this.status,
    required this.message,
    required this.language,
    required this.data,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
    status: json['status'] ?? '',
    message: json['message'] ?? '',
    language: json['language'] ?? '',
    data: UsersData.fromJson(json['data']),
  );
}

class UsersData {
  final int limit;
  final int offset;
  final int total;
  final List<User> users;

  UsersData({
    required this.limit,
    required this.offset,
    required this.total,
    required this.users,
  });

  factory UsersData.fromJson(Map<String, dynamic> json) => UsersData(
    limit: json['limit'] ?? 0,
    offset: json['offset'] ?? 0,
    total: json['total'] ?? 0,
    users: List<User>.from(
      (json['users'] ?? []).map((x) => User.fromJson(x)),
    ),
  );
}

class User {
  final UserDetails userDetails;
  final UserModel usersData;

  User({
    required this.userDetails,
    required this.usersData,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    userDetails: UserDetails.fromJson(json['user_details']),
    usersData: UserModel.fromJson(json['users_data']),
  );
}

class UserDetails {
  final String? address;
  final String? addressMoreDetails;
  final String? area;
  final String? churchName;
  final String? churchPriest;
  final String? facebook;
  final String? familyPriestChurch;
  final String? fatherPhoneNumber;
  final dynamic flour;
  final dynamic flourCount;
  final int? isDeacon;
  final int? isHaveBroOrSis;
  final int? isMale;
  final int? isSecoundaryTime;
  final String? motherPhoneNumber;
  final String? rankSelected;
  final String? spiritualFather;
  final String? spiritualFatherChurch;

  UserDetails({
    this.address,
    this.addressMoreDetails,
    this.area,
    this.churchName,
    this.churchPriest,
    this.facebook,
    this.familyPriestChurch,
    this.fatherPhoneNumber,
    this.flour,
    this.flourCount,
    this.isDeacon,
    this.isHaveBroOrSis,
    this.isMale,
    this.isSecoundaryTime,
    this.motherPhoneNumber,
    this.rankSelected,
    this.spiritualFather,
    this.spiritualFatherChurch,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
    address: json['address'],
    addressMoreDetails: json['addressMoreDetails'],
    area: json['area'],
    churchName: json['churchName'],
    churchPriest: json['churchPriest'],
    facebook: json['facebook'],
    familyPriestChurch: json['familyPriestChurch'],
    fatherPhoneNumber: json['fatherPhoneNumber']?.toString(),
    flour: json['flour'],
    flourCount: json['flourCount'],
    isDeacon: json['isDeacon'],
    isHaveBroOrSis: json['isHaveBroOrSis'],
    isMale: json['isMale'],
    isSecoundaryTime: json['isSecoundaryTime'],
    motherPhoneNumber: json['motherPhoneNumber']?.toString(),
    rankSelected: json['rankSelected'],
    spiritualFather: json['spiritualFather'],
    spiritualFatherChurch: json['spiritualFatherChurch'],
  );
}

class UserModel {
  final String? academicYear;
  final String? birthDay;
  final String? createdAt;
  final String? email;
  final int? id;
  final String? image;
  final int? isCheckedIn;
  final int? isFatherWhatsapp;
  final int? isHaveWhatsapp;
  final int? isMotherWhatsapp;
  final String? name;
  final String? password;
  final String? permission;
  final String? phoneNumber;
  final String? updatedAt;
  final String? userId;

  UserModel({
    this.academicYear,
    this.birthDay,
    this.createdAt,
    this.email,
    this.id,
    this.image,
    this.isCheckedIn,
    this.isFatherWhatsapp,
    this.isHaveWhatsapp,
    this.isMotherWhatsapp,
    this.name,
    this.password,
    this.permission,
    this.phoneNumber,
    this.updatedAt,
    this.userId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    academicYear: json['academicYear'],
    birthDay: json['birthDay'],
    createdAt: json['created_at'],
    email: json['email'],
    id: json['id'],
    image: json['image'],
    isCheckedIn: json['isCheckedIn'],
    isFatherWhatsapp: json['isFatherWhatsapp'],
    isHaveWhatsapp: json['isHaveWhatsapp'],
    isMotherWhatsapp: json['isMotherWhatsapp'],
    name: json['name'],
    password: json['password'],
    permission: json['permission'],
    phoneNumber: json['phoneNumber'],
    updatedAt: json['updated_at'],
    userId: json['user_id']?.toString(),
  );
}
