import 'dart:convert';

import 'package:flutter/material.dart';

class Student {
  final String name;
  final int score;

  Student({
    required this.name,
    required this.score,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      name: json["name"],
      score: json["score"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "score": score,
    };
  }
}