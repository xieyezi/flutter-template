import 'package:flutter/material.dart';
import 'package:fluttertemplate/common/styles/styles.dart';

class Empty extends StatelessWidget {
  /// 图片
  final String img;

  /// 提示文字
  final String tipText;

  /// 按钮文字
  final String buttonText;

  /// 按钮事件
  final Function buttonTap;
  const Empty({Key key, this.img, this.tipText, this.buttonText, this.buttonTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 250,
        child: Column(
          children: <Widget>[
            Image.asset(
              img ?? 'assets/images/common/empty.png',
              width: 150,
              height: 150,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              tipText,
              style: TextStyle(
                color: Color(0xFF4A4A4A),
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 18,
            ),
            buttonText != null
                ? Container(
                    width: 120,
                    height: 40.5,
                    child: OutlineButton(
                      onPressed: buttonTap,
                      borderSide: BorderSide(color: AppColors.inputBorderColor),
                      highlightedBorderColor: Colors.red,
                      highlightColor: Colors.grey[100],
                      child: Center(
                        child: Text(
                          buttonText,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
