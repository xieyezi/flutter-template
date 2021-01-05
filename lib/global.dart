import 'dart:io';
import 'common/utils/utils.dart';
import 'common/values/values.dart';
import 'common/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

/// 全局配置
class Global {
  /// 用户配置
  static UserLoginResponseModel profile = UserLoginResponseModel(
    token: null,
  );

  /// 是否第一次打开
  static bool isFirstOpen = false;

  /// 是否离线登录
  static bool isOfflineLogin = false;

  /// 应用状态
  // static AppState appState = AppState();

  /// 是否 release
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  /// init
  static Future init() async {
    // 运行初始
    WidgetsFlutterBinding.ensureInitialized();

    // 工具初始
    await StorageUtil.init();
    Request();

    // 极光推送初始化
   //  await PushManager.setup();

    // 读取设备第一次打开
    isFirstOpen = !StorageUtil().getBool(STORAGE_DEVICE_ALREADY_OPEN_KEY);
    if (isFirstOpen) {
      StorageUtil().setBool(STORAGE_DEVICE_ALREADY_OPEN_KEY, true);
    }

    // 读取离线用户信息
    var _profileJSON = StorageUtil().getJSON(STORAGE_USER_PROFILE_KEY);
    if (_profileJSON != null) {
      profile = UserLoginResponseModel.fromJson(_profileJSON);
      isOfflineLogin = true;
    }

    // android 状态栏为透明的沉浸
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
    // 请求权限信息
    // await [
    //   Permission.location,
    //   Permission.notification,
    //   Permission.camera,
    //   Permission.storage,
    // ].request();
  }

  // 持久化 用户信息
  // static Future<bool> saveProfile(UserLoginResponseModel userResponse) {
  //   profile = userResponse;
  //   return StorageUtil().setJSON(STORAGE_USER_PROFILE_KEY, userResponse.toJson());
  // }
}
