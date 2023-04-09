import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'to_do_model.dart';



class TaskData extends ChangeNotifier {
  List<Task> taskList = [];

  List<Task> get tasks => taskList;

  Future<void> loadTasksFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final taskJsonList = prefs.getStringList('tasks') ?? [];

    taskList = taskJsonList.map((jsonString) {
      final taskJson = jsonDecode(jsonString);
      return Task.fromJson(taskJson);
    }).toList();

    notifyListeners();
  }

  Future<void> saveTasksToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final taskJsonList = taskList.map((task) => jsonEncode(task.toJson())).toList();

    prefs.setStringList('tasks', taskJsonList);
  }

  void addTask(String name) {
    final task = Task(name: name);
    taskList.add(task);
    saveTasksToPrefs();
    notifyListeners();
  }

  void editTask(int index, String newName) {
    final task = taskList[index];
    task.name = newName;
    saveTasksToPrefs();
    notifyListeners();
  }

  void completeTask(int index) {
    final task = taskList[index];
    task.isCompleted = true;
    saveTasksToPrefs();
    notifyListeners();
  }

  void deleteTask(int index) {
    taskList.removeAt(index);
    saveTasksToPrefs();
    notifyListeners();
  }
}
