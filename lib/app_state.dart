import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _RefreshPage = false;
  bool get RefreshPage => _RefreshPage;
  set RefreshPage(bool value) {
    _RefreshPage = value;
  }

  int _loopIndex = 0;
  int get loopIndex => _loopIndex;
  set loopIndex(int value) {
    _loopIndex = value;
  }

  final _currentUserAppLevelManager = StreamRequestManager<UsersRecord>();
  Stream<UsersRecord> currentUserAppLevel({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<UsersRecord> Function() requestFn,
  }) =>
      _currentUserAppLevelManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCurrentUserAppLevelCache() => _currentUserAppLevelManager.clear();
  void clearCurrentUserAppLevelCacheKey(String? uniqueKey) =>
      _currentUserAppLevelManager.clearRequest(uniqueKey);
}
