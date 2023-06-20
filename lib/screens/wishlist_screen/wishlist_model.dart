// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WishlistModel {
  final String id;
  final String title;
  final String poster;
  final double rating;
  final String type;
  final String date;
  WishlistModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.rating,
    required this.type,
    required this.date,
  });

  WishlistModel copyWith({
    String? id,
    String? title,
    String? poster,
    double? rating,
    String? type,
    String? date,
  }) {
    return WishlistModel(
      id: id ?? this.id,
      title: title ?? this.title,
      poster: poster ?? this.poster,
      rating: rating ?? this.rating,
      type: type ?? this.type,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'poster': poster,
      'rating': rating,
      'type': type,
      'date': date,
    };
  }

  factory WishlistModel.fromMap(Map<dynamic, dynamic> map) {
    return WishlistModel(
      id: map['id'] as String,
      title: map['title'] as String,
      poster: map['poster'] as String,
      rating: map['rating'] as double,
      type: map['type'] as String,
      date: map['date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WishlistModel.fromJson(String source) =>
      WishlistModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WishlistModel(id: $id, title: $title, poster: $poster, rating: $rating, type: $type, date: $date)';
  }

  @override
  bool operator ==(covariant WishlistModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.poster == poster &&
        other.rating == rating &&
        other.type == type &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        poster.hashCode ^
        rating.hashCode ^
        type.hashCode ^
        date.hashCode;
  }
}
