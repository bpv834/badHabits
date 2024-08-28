import 'package:cloud_firestore/cloud_firestore.dart';

extension TimestampExtensions on Timestamp {
  String toFormattedString() {
    return this.toDate().toIso8601String();
  }
}

extension StringExtensions on String {
  DateTime toDateTime() {
    return DateTime.parse(this);
  }
}