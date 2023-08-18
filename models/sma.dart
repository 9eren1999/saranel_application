import 'package:equatable/equatable.dart';

class sma extends Equatable {
  final String? title1;
  final String? title2;
  final String? title3;
  final String? title4;
  final String? aciklama1;
  final String? aciklama2;
  final String? aciklama3;
  final String? image;

  sma({
    this.title1,
    this.title2,
    this.title3,
    this.title4,
    this.aciklama1,
    this.aciklama2,
    this.aciklama3,
    this.image,
  });

  @override
  List<Object?> get props =>
      [title1, title2, title3, title4, aciklama1, aciklama2, aciklama3, image];

  sma copyWith({
    String? title1,
    String? title2,
    String? title3,
    String? title4,
    String? aciklama1,
    String? aciklama2,
    String? aciklama3,
    String? image,
  }) {
    return sma(
      title1: title1 ?? this.title1,
      title2: title2 ?? this.title2,
      title3: title3 ?? this.title3,
      title4: title4 ?? this.title4,
      aciklama1: aciklama1 ?? this.aciklama1,
      aciklama2: aciklama2 ?? this.aciklama2,
      aciklama3: aciklama3 ?? this.aciklama3,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title1': title1,
      'title2': title2,
      'title3': title3,
      'title4': title4,
      'aciklama1': aciklama1,
      'aciklama2': aciklama2,
      'aciklama3': aciklama3,
      'image': image,
    };
  }

  factory sma.fromJson(Map<String, dynamic> json) {
    return sma(
      title1: json['title1'] as String?,
      title2: json['title2'] as String?,
      title3: json['title3'] as String?,
      title4: json['title4'] as String?,
      aciklama1: json['aciklama1'] as String?,
      aciklama2: json['aciklama2'] as String?,
      aciklama3: json['aciklama3'] as String?,
      image: json['image'] as String?,
    );
  }
}
