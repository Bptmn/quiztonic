import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

int calculateScore(List<bool> listOfBoolean) {
  // calculate the nombre of true boolean in the list
  int count = 0;
  for (bool value in listOfBoolean) {
    if (value == true) {
      count++;
    }
  }
  return count;
}

String formatDuration(int durationInMilliseconds) {
  if (durationInMilliseconds <= 0) return "00:00";

  int totalSeconds =
      (durationInMilliseconds ~/ 1000); // Convert milliseconds to seconds
  int minutes = totalSeconds ~/ 60; // Get minutes
  int seconds = totalSeconds % 60; // Get remaining seconds

  // Format to always have 2 digits
  String formattedMinutes = minutes.toString().padLeft(2, '0');
  String formattedSeconds = seconds.toString().padLeft(2, '0');

  return "$formattedMinutes:$formattedSeconds";
}

TotalLearningTimeStruct totalLearningTimeFormat(
  int totalTimeSpentOnQuiz,
  int totalTimeSpentOnFlashcards,
) {
  final totalMs = totalTimeSpentOnQuiz + totalTimeSpentOnFlashcards;
  final totalMinutes = totalMs ~/ 60000;
  final days = totalMinutes ~/ (24 * 60);
  final hours = (totalMinutes % (24 * 60)) ~/ 60;
  final minutes = totalMinutes % 60;

  return TotalLearningTimeStruct(
    days: days,
    hours: hours,
    minutes: minutes,
  );
}
