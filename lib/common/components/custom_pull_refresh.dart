import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

Widget customPullRefresh({
  @required Widget child,
  @required bool enableLoad,
  @required bool enableRefresh,
  @required EasyRefreshController controller,
  Function onLoadEvent,
  Function onRefreshEvent,
}) {
  return EasyRefresh(
    controller: controller,
    enableControlFinishLoad: true,
    enableControlFinishRefresh: true,
    header: enableRefresh
        ? ClassicalHeader(
            refreshText: '下拉刷新',
            refreshReadyText: '松开刷新',
            refreshingText: '刷新中',
            refreshedText: '刷新成功',
            noMoreText: '没有更多数据哦～',
            showInfo: false,
            bgColor: Colors.transparent,
            textColor: Colors.black54,
          )
        : null,
    footer: enableLoad
        ? ClassicalFooter(
            loadText: '上拉加载更多',
            loadReadyText: '松开加载',
            loadingText: '加载中',
            loadedText: '加载完成',
            noMoreText: '没有更多内容了～',
            showInfo: false,
            bgColor: Colors.transparent,
            textColor: Colors.black54,
          )
        : null,
    onRefresh: enableRefresh
        ? () async {
            await onRefreshEvent();
          }
        : null,
    onLoad: enableLoad
        ? () async {
            await onLoadEvent();
          }
        : null,
    child: child,
  );
}
