import 'package:flutter/material.dart';
import 'package:tyba_flutter_challenge/models/university.dart';
import 'package:tyba_flutter_challenge/services/university.dart';

class UniversityProvider extends ChangeNotifier {
  List<University> universities = [];
  late String error = "";
  bool isLoading = false;

  Future fetchUniversities() async {
    isLoading = true;
    notifyListeners();
    try {
      universities = await getUniversities();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
    notifyListeners();
  }

  void addImage({required University university, required String imagePath}) {
    _findByName(university.name!).imageUrl = imagePath;
    notifyListeners();
  }

  University _findByName(String name) {
    return universities.singleWhere((element) => element.name == name);
  }

  void addNumberOfStudets(
      {required University university, required int numbers}) {
    _findByName(university.name!).numbersOfStudents = numbers;
  }
}
