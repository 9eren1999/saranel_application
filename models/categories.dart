import 'package:equatable/equatable.dart';

class sma extends Equatable {
  final String? c1;
  final String? c2;
  final String? c3;
  final String? c4;
  final String? c5;

  sma({
    this.c1,
    this.c2,
    this.c3,
    this.c4,
    this.c5,
  });

  @override
  List<Object?> get props => [c1, c2, c3, c4, c5];

  sma copyWith({
    String? c1,
    String? c2,
    String? c3,
    String? c4,
    String? c5,
  }) {
    return sma(
      c1: c1 ?? this.c1,
      c2: c2 ?? this.c2,
      c3: c3 ?? this.c3,
      c4: c4 ?? this.c4,
      c5: c5 ?? this.c5,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'c1': c1,
      'c2': c2,
      'c3': c3,
      'c4': c4,
      'c5': c5,
    };
  }

  factory sma.fromJson(Map<String, dynamic> json) {
    return sma(
      c1: json['c1'] as String?,
      c2: json['c2'] as String?,
      c3: json['c3'] as String?,
      c4: json['c4'] as String?,
      c5: json['c5'] as String?,
    );
    
  }
}
