import 'dart:convert';

import 'package:pert12sall/model/student.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  static const String _key= "students";

  Future<List<Student>> getStudent() async {
    final prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString(_key);

    if (data == null) return[];

    final List decoded = jsonDecode(data);
    return decoded.map((item)=>Student.fromJson(item)).toList();
  }

  Future<void>saveStudent (List<Student>students)async{
    final prefs = await SharedPreferences.getInstance();
    final String encoded = jsonEncode(students.map((s)=>s.toJson()).toList());
    await prefs.setString(_key, encoded);

  }
}