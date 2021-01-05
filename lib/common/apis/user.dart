import 'package:flutter/material.dart';
import 'package:fluttertemplate/common/models/models.dart';
import 'package:fluttertemplate/common/utils/utils.dart';

/// 用户
class UserAPI {
  /// 登录
  static Future<UserLoginResponseModel> login({
    @required BuildContext context,
    Map params,
  }) async {
    var response = await Request().post(
      '/auth/login/',
      context: context,
      params: params,
    );
    return UserLoginResponseModel.fromJson(response['data']);
  }

  /// 发送验证码
  static Future sendCode({
    @required BuildContext context,
    Map params,
  }) async {
    var response = await Request().post(
      '/auth/send_code/',
      context: context,
      params: params,
    );
    return response;
  }

  /// 通过验证码修改密码
  static Future changePwdByCode({
    @required BuildContext context,
    Map params,
  }) async {
    var response = await Request().post('/auth/reset_password/', context: context, params: params);
    return response;
  }

  /// 通过密码修改密码
  static Future changePwdBypwd({
    @required BuildContext context,
    Map params,
  }) async {
    var response = await Request().post(
      '/auth/change_password/',
      context: context,
      params: params,
    );
    return response;
  }
}
