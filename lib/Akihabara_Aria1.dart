// // Akihabara_Aria1.dart
//
// import 'package:flutter/material.dart';
//
// class IconDataModel {
//   final String Number;
//   final String CompanyName;
//   final String Address;
//   final String OpenTime;
//   final String OperatingCompany;
//   final String PlaceImage;
//   final String BicycleTypeImage;
//   final String ElectricBicycleTypeImage;
//   final String HalfHourMoney;
//   final String QuarterHourMoney;
//   final String HalfDayMoney;
//   final String QRNumber;
//
//   IconDataModel({
//     required this.Number,
//     required this.CompanyName,
//     required this.Address,
//     required this.OpenTime,
//     required this.OperatingCompany,
//     required this.PlaceImage,
//     required this.BicycleTypeImage,
//     required this.ElectricBicycleTypeImage,
//     required this.HalfHourMoney,
//     required this.QuarterHourMoney,
//     required this.HalfDayMoney,
//     required this.QRNumber,
//   });
// }
//
// void AkibaAria1_IconTap(BuildContext context, Function(bool, IconDataModel) callback) {
//   // アイコンに関連するデータを作成
//   IconDataModel iconData = IconDataModel(
//     Number: 'st No.1234567',
//     CompanyName: '株式会社システム創造開発',
//     Address: '東京都千代田区丸の内１丁目９－２',
//     OpenTime: '24h',
//     OperatingCompany: '株式会社システム創造開発',
//     PlaceImage: 'assets/images/system_company.png',
//     BicycleTypeImage: 'assets/images/tni12202021018481.png',
//     ElectricBicycleTypeImage: 'assets/images/o0400030014858478245.jpg',
//     HalfHourMoney: '130円',
//     QuarterHourMoney: '100円',
//     HalfDayMoney: '1,800円',
//     QRNumber: 'SCD1234',
//   );
//
//   // iconDataを更新
//   callback(true, iconData);
//
// }
