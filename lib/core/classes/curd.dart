import 'dart:convert';
import 'package:http/http.dart' as http;

class Curd {
  getrequest(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(jsonDecode(response.body));

        return jsonResponse;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  postrequest(String url, Map data) async {
    try {
      var response = await http.post(
        Uri.parse(
          url,
        ),
        body: data,
      );
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(json.encode(response.body));
        return jsonResponse;
      } else {
        print("${response.statusCode}");
      }
    } catch (e) {}
  }

  ///Upload Files
  // postRequestWithFile(String url, Map data, File file) async {
  //   var request = http.MultipartRequest("POST", Uri.parse(url));
  //   var length = await file.length();
  //   var stream = http.ByteStream(file.openRead());
  //   var multiFile = http.MultipartFile(
  //     'file',
  //     stream,
  //     length,

  //   );

  //upload the file on request which go to server
  //تحميل الملف علر الريكوست الى السيرفر
  //   request.files.add(multiFile);
  //   data.forEach((key, value) {
  //     request.fields[key] = value;
  //   });
  //   var myRequest = await request.send();
  //   var response = await http.Response.fromStream(myRequest);
  //   if (myRequest.statusCode == 200) {
  //     var jsonResponse = jsonDecode(response.body);
  //     return jsonResponse;
  //   } else {
  //     print("${myRequest.statusCode}");
  //   }
  // }
}
