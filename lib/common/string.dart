import 'package:intl/intl.dart';

class StringUtils {
  StringUtils._();

  ///安全的裁剪字符串（避免emoji等特殊符号被裁一半的问题）
  static String subStringSafe(String source,
      {int maxLength, String suffix = ""}) {
    if (source == null) {
      return null;
    }
    if (source.runes.length <= maxLength) {
      return source;
    }
    var take = source.runes.take(maxLength);
    return String.fromCharCodes(take) + suffix ?? "";
  }

  /// 判断字符串是否为空
  static bool isEmpty(String str) {
    return str == null || str.isEmpty;
  }

  static bool isNotEmpty(String str) {
    return !StringUtils.isEmpty(str);
  }

  ///判断流地址是否相等(用于切流场景)
  static bool isStreamEquals(String stream, String stream2) {
    if (stream == null || stream2 == null) return stream == stream2;
    Uri param1;
    Uri param2;
    try {
      param1 = Uri.parse(stream);
      param2 = Uri.parse(stream2);
    } catch (e) {
      print(e);
    }
    if (param1 == null || param2 == null) return stream == stream2;
    for (var o in param1.queryParameters.entries) {
      if (o.key != "timestamp" &&
          o.key != "md5sum" &&
          param2.queryParameters[o.key] != o.value) {
        return false;
      }
    }
    return true;
  }

  static String safeString(String str, {String holder = ''}) {
    return StringUtils.isNotEmpty(str) ? str : holder;
  }

  static String formatterNum(int num) {
    if (num <= 0 || num == null) {
      return '0';
    } else if (num < 10000) {
      return '${num}';
    } else if (num < 10000000) {
      double num_w = num / 10000.0;
      String numstr = num_w.toStringAsFixed(2);
      if (num_w > 100) {
        numstr = num_w.toStringAsFixed(0);
      }
      return '${numstr}w';
    } else if (num < 100000000.0) {
      double num_w = num / 10000000.0;
      String numstr = num_w.toStringAsFixed(1);
      return '${numstr}kw';
    } else {
      double num_w = num / 100000000.0;
      String numstr = num_w.toStringAsFixed(1);
      return '${numstr}亿';
    }
  }

  /// 时间戳按格式转时间（今天、昨天、星期、年月...）
  /// @params: timeStamp 毫秒时间戳
  static String formatTextWithTimeStamp(int timeStamp) {
    if (timeStamp == null || timeStamp == 0) return '';

    String text = '';
    DateFormat format = DateFormat('HH:mm', 'zh_CN');
    int now = DateTime.now().millisecondsSinceEpoch;

    timeStamp = timeStamp * 1000;
    final intervalTime = now - timeStamp;

    if (intervalTime < 0) return '';

    final int day = 1000 * 60 * 60 * 24;
    final int week = 7 * day;

    if (intervalTime < day) {
      // 一天内展示  14:32  精确到分
      text = format.format(DateTime.fromMillisecondsSinceEpoch(timeStamp));
    } else if (intervalTime < 2 * day) {
      // 昨天的统一展示  昨天
      text = '昨天';
    } else if (intervalTime < week) {
      // 一周内展示 星期x
      format = DateFormat('EEE', 'zh_CN');
      text = format.format(DateTime.fromMillisecondsSinceEpoch(timeStamp));
    } else {
      // 超过一周   展示 年月日
      format = DateFormat('MM-dd', 'zh_CN');
      text = format.format(DateTime.fromMillisecondsSinceEpoch(timeStamp));
    }

    return text;
  }

  //转换为 hh:mm:ss
  static String formatTime(int secs, {bool hour = true}) {
    int hours = secs ~/ 3600;
    String hourStr = '${hours}';
    if (hours < 10) {
      hourStr = '0${hours}';
    }
    int left = secs - hours * 3600;
    int mins = left ~/ 60;
    String minsStr = '${mins}';
    if (mins < 10) {
      minsStr = '0${mins}';
    }
    int seconds = secs - hours * 3600 - mins * 60;
    String secondsStr = '${seconds}';
    if (seconds < 10) {
      secondsStr = '0${seconds}';
    }
    if (!hour) {
      return '$minsStr:$secondsStr';
    } else {
      return '$hourStr:$minsStr:$secondsStr';
    }
  }
}
