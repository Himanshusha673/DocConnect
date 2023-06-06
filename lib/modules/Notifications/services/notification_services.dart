import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:doc_connect/modules/Notifications/models/notification_model.dart';
import 'package:doc_connect/modules/Notifications/models/undoResponse.dart';
import 'package:doc_connect/utils/constants/api_konstants.dart';

class NotificationReporsitory {
  ///////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////
  // get all Notifications
  static Future<NotificationResponse?> fetchAllNotifications(
      int page, String userId, String authToken) async {
    var limit = 12;
    var url = ApiConstants.getAllNotifications;
    Uri uri = Uri.parse("$url$userId$page$limit");
    try {
      http.Response response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $authToken',
      });

      log(response.body);
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        NotificationResponse notificationResponse =
            NotificationResponse.fromJson(jsonDecode(response.body));
        // List<NotificationModelData> dataModel = notificationResponse.data!;
        return notificationResponse;
      } else {
        return null;
        // throw Exception('Failed to fetch notifications');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      throw Exception(e);
    }
  }

  ///////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////
  // undo all Notifications
  static Future<UndoResponseData?> undoAllNotifications(
      String userId, String authToken) async {
    log("calling in undo");
    var url = ApiConstants.undoAllNotifications;
    Uri uri = Uri.parse("$url$userId");
    NotificationModelData model = NotificationModelData(
        id: userId, userId: userId, title: " ", description: " ", read: false);
    Map<String, dynamic> dataModel = model.toJson();

    try {
      http.Response response = await http.patch(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $authToken',
        },
        body: jsonEncode([dataModel]),
      );

      log(response.body);
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        UndoResponseData notificationResponse =
            UndoResponseData.fromJson(jsonDecode(response.body));
        // List<NotificationModelData> dataModel = notificationResponse.data!;
        return notificationResponse;
      } else {
        return null;
        // throw Exception('Failed to fetch notifications');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      throw Exception(e);
    }
  }
}
