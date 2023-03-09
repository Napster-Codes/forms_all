import 'package:image_picker/image_picker.dart';

class PetDetails {
  PetDetails({
    this.id,
    required this.name,
    this.userId,
    required this.breed,
    this.age,
    this.weight,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.dataId,
    this.lastVaccinationDate,
    this.image,
    this.imageUrl,
    this.imageFile,
    this.deletedImage,
    // this.petId,
  });

  String? id;
  String name;
  String? userId;
  String breed;
  DateTime? age;
  double? weight;
  bool? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? dataId;
  XFile? imageFile;
  String? image;
  String? imageUrl;
  DateTime? lastVaccinationDate;
  String? deletedImage;
  // String? petId;

  factory PetDetails.fromJson(Map<String, dynamic> json) => PetDetails(
        id: json["_id"],
        name: json["name"],
        userId: json["userId"],
        breed: json["breed"],
        age: DateTime.parse(json["age"]),
        weight: json["weight"] * 1.0,
        isDeleted: json["isDeleted"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        dataId: json["id"],
        image: json["image"] ?? null,
        imageUrl: json["imageUrl"] ?? null,
        deletedImage: json["deletedImage"] ?? null,
        imageFile: json["imageFile"] ?? null,
        lastVaccinationDate: json["lastVaccinationDate"] == null
            ? null
            : DateTime.parse(json["lastVaccinationDate"]),
        // petId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "userId": userId,
        "breed": breed,
        "weight": weight,
        "isDeleted": isDeleted,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "age": age.toString(),
        "id": dataId,
        "image": image,
        "imageUrl": imageUrl,
        "imageFile": imageFile,
        "deletedImage": deletedImage,
        "lastVaccinationDate": lastVaccinationDate?.toIso8601String(),
        // "petId": petId,
      };
}
