import 'package:WanAndroid/http/Api.dart';
import 'package:http/http.dart' as http;

/// 网络请求工具类
class NetUtils {
  /// get请求
  static Future<String> get(String url, {Map<String, String> params}) async {
    if (params != null && params.isNotEmpty) {
      StringBuffer stringBuffer = new StringBuffer("?");
      params.forEach((key, value) {
        stringBuffer.write("$key" + "=" + "$value" + "&");
      });
      String paramStr = stringBuffer.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url += paramStr;
    }
    http.Response response = await http.get(Api.BASE_URL + url);

    return response.body;
  }

  ///post请求
  static Future<String> post(String url, {Map<String, String> params}) async {
    http.Response response = await http.post(Api.BASE_URL + url, body: params);
    return response.body;
  }
}
