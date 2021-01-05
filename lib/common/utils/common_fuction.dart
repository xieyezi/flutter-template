import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertemplate/common/utils/utils.dart';
import 'package:oktoast/oktoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';


/// 保存图片到相册
saveImageToGallery(File file) async {
  if (Platform.isAndroid) {
    if (await Permission.storage.request().isDenied) {
      showOpenAppSettingDialog(text: "需要打开相册权限");
      return;
    }
  } else if (Platform.isIOS) {
    if (await Permission.photos.request().isDenied) {
      showOpenAppSettingDialog(text: "需要打开相册权限");
      return;
    }
  }
  if (file == null) showToast("图片为空，保存失败~");
  ImageGallerySaver.saveFile(file.path).then((value) {
    if (value != null) {
      if (value['isSuccess'] == true) {
        showToast("图片保存成功～");
        MyNavigator.pop();
      } else {
        showToast("保存失败~");
      }
    }
  }).catchError((onError) {
    print("保存失败~");
  });
}

/// 权限设置
showOpenAppSettingDialog({String text = "需要打开相关权限"}) {
  showDialog(
      context: MyNavigator.ctx,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(text),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("取消"),
            ),
            FlatButton(
              onPressed: () {
                openAppSettings();
                Navigator.of(context).pop();
              },
              child: Text("确认"),
            ),
          ],
        );
      });
}

/// 拨打电话
void contact(String phone) async {
  final url = 'tel:' + phone;
  if (await canLaunch(url)) {
    await launch(url);
  }
}
