import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

const baseUrl = "http://api.sefaz.al.gov.br/sfz_nfce_api/api/public/consultarPrecosPorDescricao";

class API {
  static Future getProducts(String desc) {

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'AppToken':'ff0fa2af15bc02e0549a334799c9d611eed1ac5b'
    };

    var requestBody = json.encode({
      "descricao": desc,
      "dias": 3,
      "latitude": -9.573170,
      "longitude": -35.738591,
      "raio": 2
    });

    return http.post(baseUrl, headers: requestHeaders, body:  requestBody);
  }
}
