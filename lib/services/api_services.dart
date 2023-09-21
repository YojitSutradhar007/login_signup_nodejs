import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:login_signup_nodejs/services/api_constants.dart';
import 'package:login_signup_nodejs/services/status_code.dart';

class ApiServices {
  Future signUpUser(Map<String, String> userData) async {
    try {
      http.Response response = await http.post(
        Uri.parse("${APIConstants.baseUrl}signUp"),
        body: userData,
      );
      log(response.statusCode.toString());
      if (response.statusCode == ServerStatusCodes.addSuccess) {
        var jsonData = jsonDecode(response.body);
        return jsonData;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future loginUser(Map<String, String> userData) async {
    try {
      http.Response response = await http.post(
        Uri.parse("http://10.200.147.216:7878/adduser/login"),
        body: userData,
      );
      log(response.statusCode.toString());
      if (response.statusCode == ServerStatusCodes.success) {
        var jsonData = jsonDecode(response.body);
        log(jsonData.toString());
        return jsonData;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future checkAuthToken(Map<String, String> token) async {
    try {
      http.Response response = await http.post(
        Uri.parse("http://10.200.147.216:7878/adduser/checkToken"),
        body: token,
      );
      log(response.statusCode.toString());
      if (response.statusCode == ServerStatusCodes.accepted) {
        var jsonData = jsonDecode(response.body);
        log(jsonData.toString());
        return jsonData;
      }
      if (response.statusCode == ServerStatusCodes.unAuthorised) {
        var jsonData = jsonDecode(response.body);
        log(jsonData.toString());
        return jsonData;
      }
    } catch (e) {
      log(e.toString());
    }
  }

// //POST APi , Function to Send new Blog Data to the Database
//   Future<void> addBlogData(Map<String, dynamic> blog) async {
//     final response = await http.post(
//       Uri.parse(APIConstants.baseUrl),
//       headers: {
//         'Content-Type': 'application/json',
//       },
//       body: json.encode({"data": blog}),
//     );
//
//     if (response.statusCode == ServerStatusCodes.addSuccess) {
//       log('blog Added.');
//     } else {
//       log('Failed to add Blog. Status code: ${response.statusCode}');
//       log('Response body: ${response.body}');
//     }
//   }
//
// //DELETE Api , Function to delete Blog With Specific ID
//   Future<void> deleteBlog(int blogId) async {
//     final response = await http.delete(
//       Uri.parse("${APIConstants.baseUrl}/$blogId"),
//     );
//     if (response.statusCode == ServerStatusCodes.success) {
//       log('Blog with ID $blogId has been deleted.');
//     } else {
//       log('Failed to delete Blog. Status code: ${response.statusCode}');
//       log('Response body: ${response.body}');
//     }
//   }
//
// //PUT Api , Function to Update the existing Blog With Specific ID
//   Future<void> editBlogData(Map<String, dynamic> blog, int blogId) async {
//     final response = await http.put(
//       Uri.parse("${APIConstants.baseUrl}/$blogId"),
//       headers: {
//         'Content-Type': 'application/json',
//       },
//       body: json.encode({"data": blog}),
//     );
//
//     if (response.statusCode == ServerStatusCodes.success) {
//       log('Blog  with ID has been edited.');
//     } else {
//       log('Failed to edit Blog: Status code: ${response.statusCode}');
//       log('Response body: ${response.body}');
//     }
//   }
}
