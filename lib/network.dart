import 'dart:convert';
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';

class Network {
  // Androidシュミレーターを使う場合はlocalhostを10.0.2.2に変更する
  final String _url = 'http://localhost:8080/api';
  String token = '';

  // SharedPreferencesからトークンを取得
  _setToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? localToken = localStorage.getString('token');

    // なぜかlocalStorageから取得した値の前後に"が入るので仕方なくここで置換する
    if (localToken != null) {
      token = localToken.replaceAll('"', '');
    }
  }

  // ヘッダー情報をセット
  _getHeaders() => {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };

  Future<bool> checkToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? localToken = localStorage.getString('token');

    return localToken != null;
  }

  Future<bool> login(data) async {
    print(data);
    Uri fullUrl = Uri.parse('$_url/login');
    var res = await post(fullUrl, body: jsonEncode(data), headers: _getHeaders());
    if (res.statusCode == 200) {
      var body = json.decode(res.body);
      print(body);
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['user']['api_token']));
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('token');
  }

  // POST
  Future<Response> postData(String apiUrl, data) async {
    await _setToken();
    Uri fullUrl = Uri.parse(_url + apiUrl);
    return await post(fullUrl, body: jsonEncode(data), headers: _getHeaders());
  }

  // GET
  Future<Response> getData(String apiUrl) async {
    await _setToken();
    Uri fullUrl = Uri.parse(_url + apiUrl);
    Response res = await get(fullUrl, headers: _getHeaders());
    return res;
  }

  // Future<Response> uploadImage(String apiUrl, image) async {
  //   await _setToken();
  //   // ここで画像をFileからBase64（String）にエンコードする
  //   Uint8List imageBytes = image!.readAsBytesSync();
  //   String imageBytesBase64 = base64Encode(imageBytes);
  //
  //   Uri fullUrl = Uri.parse(_url + apiUrl);
  //   return await post(fullUrl, body: jsonEncode({image: imageBytesBase64}), headers: _getHeaders());
  // }

  Future<StreamedResponse> uploadImage(String apiUrl, image) async {
    Uri fullUrl = Uri.parse(_url + apiUrl);
    var request = MultipartRequest('POST', fullUrl)
      ..files.add(await MultipartFile.fromPath(
          'image', image.path,
          contentType: MediaType.parse('image/jpeg')));
    return await request.send();
  }

}
