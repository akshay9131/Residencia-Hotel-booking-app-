class HotelModel {
  int? id;
  String? name;
  String? about;
  String? images;
  String? city;
  String? rating;
  String? location;
  String? price;

  HotelModel(
      {this.id,
      this.name,
      this.about,
      this.images,
      this.city,
      this.rating,
      this.location,
      this.price});

  HotelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    about = json['about'];
    images = json['images'];
    city = json['city'];
    rating = json['rating'];
    location = json['location'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['about'] = this.about;
    data['images'] = this.images;
    data['city'] = this.city;
    data['rating'] = this.rating;
    data['location'] = this.location;
    data['price'] = this.price;
    return data;
  }
}




// import 'dart:ffi';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';

// class HotelModel {
//   String? title;
//   String? geoId;
//   String? documentId;
//   String? trackingItems;
//   String? secondaryText;
//   Image? image;

//   HotelModel(
//       {this.title,
//       this.geoId,
//       this.documentId,
//       this.trackingItems,
//       this.secondaryText,
//       this.image});

//   HotelModel.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     geoId = json['geoId'];
//     documentId = json['documentId'];
//     trackingItems = json['trackingItems'];
//     secondaryText = json['secondaryText'];
//     image = json['image'] != null ? new Image.fromJson(json['image']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['title'] = this.title;
//     data['geoId'] = this.geoId;
//     data['documentId'] = this.documentId;
//     data['trackingItems'] = this.trackingItems;
//     data['secondaryText'] = this.secondaryText;
//     if (this.image != null) {
//       data['image'] = this.image!.toJson();
//     }
//     return data;
//   }

  
// }

// class Image {
//   String? sTypename;
//   int? maxHeight;
//   int? maxWidth;
//   String? urlTemplate;

//   Image({this.sTypename, this.maxHeight, this.maxWidth, this.urlTemplate});

//   Image.fromJson(Map<String, dynamic> json) {
//     sTypename = json['__typename'];
//     maxHeight = json['maxHeight'];
//     maxWidth = json['maxWidth'];
//     urlTemplate = json['urlTemplate'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['__typename'] = this.sTypename;
//     data['maxHeight'] = this.maxHeight;
//     data['maxWidth'] = this.maxWidth;
//     data['urlTemplate'] = this.urlTemplate;
//     return data;
//   }
// }
