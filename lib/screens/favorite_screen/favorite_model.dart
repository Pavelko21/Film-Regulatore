import 'dart:convert';

class FavoriteModel {
  final String id;
  final String title;
  final String poster;
  final double rating;
  final String type;
  final String date;
  FavoriteModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.rating,
    required this.type,
    required this.date,
  });

  FavoriteModel copyWith({
    String? id,
    String? title,
    String? poster,
    double? rating,
    String? type,
    String? date,
  }) {
    return FavoriteModel(
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

  factory FavoriteModel.fromMap(Map<dynamic, dynamic> map) {
    return FavoriteModel(
      id: map['id'] as String,
      title: map['title'] as String,
      poster: map['poster'] as String,
      rating: map['rating'] as double,
      type: map['type'] as String,
      date: map['date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FavoriteModel.fromJson(String source) =>
      FavoriteModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FavoriteModel(id: $id, title: $title, poster: $poster, rating: $rating, type: $type, date: $date)';
  }

  @override
  bool operator ==(covariant FavoriteModel other) {
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
