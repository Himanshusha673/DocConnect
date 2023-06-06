class NotificationResponse {
  String? message;
  bool? success;
  List<NotificationModelData>? data;
  String? error;

  NotificationResponse({this.message, this.success, this.data, this.error});

  NotificationResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    if (json['data'] != null) {
      data = <NotificationModelData>[];
      json['data'].forEach((v) {
        data!.add(NotificationModelData.fromJson(v));
      });
    }
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['error'] = error;
    return data;
  }
}

class NotificationModelData {
  String? id;
  String? description;
  String? title;
  String? userId;
  bool? read;

  NotificationModelData(
      {this.id, this.description, this.title, this.userId, this.read});

  NotificationModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    title = json['title'];
    userId = json['userId'];
    read = json['read'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['title'] = title;
    data['userId'] = userId;
    data['read'] = read;
    return data;
  }
}

final List<NotificationModelData> mockData = [
  NotificationModelData(
    id: '1',
    title: 'Lorem Ipsum 1',
    description: 'Dolor sit amet 1',
    userId: 'user1',
    read: true,
  ),
  NotificationModelData(
    id: '2',
    title: 'Lorem Ipsum 2',
    description: 'Dolor sit amet 2',
    userId: 'user2',
    read: false,
  ),
  NotificationModelData(
    id: '3',
    title: 'Lorem Ipsum 3',
    description: 'Dolor sit amet 3',
    userId: 'user1',
    read: true,
  ),
  NotificationModelData(
    id: '4',
    title: 'Lorem Ipsum 4',
    description: 'Dolor sit amet 4',
    userId: 'user3',
    read: false,
  ),
  NotificationModelData(
    id: '5',
    title: 'Lorem Ipsum 5',
    description: 'Dolor sit amet 5',
    userId: 'user2',
    read: false,
  ),
  NotificationModelData(
    id: '6',
    title: 'Lorem Ipsum 6',
    description: 'Dolor sit amet 6',
    userId: 'user1',
    read: true,
  ),
  NotificationModelData(
    id: '7',
    title: 'Lorem Ipsum 7',
    description: 'Dolor sit amet 7',
    userId: 'user2',
    read: false,
  ),
  NotificationModelData(
    id: '8',
    title: 'Lorem Ipsum 8',
    description: 'Dolor sit amet 8',
    userId: 'user3',
    read: true,
  ),
  NotificationModelData(
    id: '9',
    title: 'Lorem Ipsum 9',
    description: 'Dolor sit amet 9',
    userId: 'user1',
    read: false,
  ),
  NotificationModelData(
    id: '10',
    title: 'Lorem Ipsum 10',
    description: 'Dolor sit amet 10',
    userId: 'user2',
    read: true,
  ),
  NotificationModelData(
    id: '11',
    title: 'Lorem Ipsum 11',
    description: 'Dolor sit amet 11',
    userId: 'user3',
    read: false,
  ),
  NotificationModelData(
    id: '12',
    title: 'Lorem Ipsum 12',
    description: 'Dolor sit amet 12',
    userId: 'user1',
    read: true,
  ),
  NotificationModelData(
    id: '13',
    title: 'Lorem Ipsum 13',
    description: 'Dolor sit amet 13',
    userId: 'user2',
    read: true,
  ),
  NotificationModelData(
    id: '14',
    title: 'Lorem Ipsum 14',
    description: 'Dolor sit amet 14',
    userId: 'user3',
    read: false,
  ),
  NotificationModelData(
    id: '15',
    title: 'Lorem Ipsum 15',
    description: 'Dolor sit amet 15',
    userId: 'user1',
    read: false,
  ),
  NotificationModelData(
    id: '16',
    title: 'Lorem Ipsum 16',
    description: 'Dolor sit amet 16',
    userId: 'user2',
    read: true,
  ),
  NotificationModelData(
    id: '17',
    title: 'Lorem Ipsum 17',
    description: 'Dolor sit amet 17',
    userId: 'user3',
    read: true,
  ),
  NotificationModelData(
    id: '1',
    title: 'Lorem Ipsum 18',
    description: 'Dolor sit amet 1',
    userId: 'user1',
    read: true,
  ),
  NotificationModelData(
    id: '2',
    title: 'Lorem Ipsum 19',
    description: 'Dolor sit amet 2',
    userId: 'user2',
    read: false,
  ),
  NotificationModelData(
    id: '3',
    title: 'Lorem Ipsum 20',
    description: 'Dolor sit amet 3',
    userId: 'user1',
    read: true,
  ),
  NotificationModelData(
    id: '4',
    title: 'Lorem Ipsum 21',
    description: 'Dolor sit amet 4',
    userId: 'user3',
    read: false,
  ),
  NotificationModelData(
    id: '5',
    title: 'Lorem Ipsum 22',
    description: 'Dolor sit amet 5',
    userId: 'user2',
    read: false,
  ),
  NotificationModelData(
    id: '6',
    title: 'Lorem Ipsum 23',
    description: 'Dolor sit amet 6',
    userId: 'user1',
    read: true,
  ),
  NotificationModelData(
    id: '7',
    title: 'Lorem Ipsum 24',
    description: 'Dolor sit amet 7',
    userId: 'user2',
    read: false,
  ),
  NotificationModelData(
    id: '8',
    title: 'Lorem Ipsum 25',
    description: 'Dolor sit amet 8',
    userId: 'user3',
    read: true,
  ),
  NotificationModelData(
    id: '9',
    title: 'Lorem Ipsum 26',
    description: 'Dolor sit amet 9',
    userId: 'user1',
    read: false,
  ),
  NotificationModelData(
    id: '10',
    title: 'Lorem Ipsum 27',
    description: 'Dolor sit amet 10',
    userId: 'user2',
    read: true,
  ),
  NotificationModelData(
    id: '11',
    title: 'Lorem Ipsum 28',
    description: 'Dolor sit amet 11',
    userId: 'user3',
    read: false,
  ),
  NotificationModelData(
    id: '12',
    title: 'Lorem Ipsum 29',
    description: 'Dolor sit amet 12',
    userId: 'user1',
    read: true,
  ),
  NotificationModelData(
    id: '13',
    title: 'Lorem Ipsum 30',
    description: 'Dolor sit amet 13',
    userId: 'user2',
    read: true,
  ),
  NotificationModelData(
    id: '14',
    title: 'Lorem Ipsum 31',
    description: 'Dolor sit amet 14',
    userId: 'user3',
    read: false,
  ),
  NotificationModelData(
    id: '15',
    title: 'Lorem Ipsum 32',
    description: 'Dolor sit amet 15',
    userId: 'user1',
    read: false,
  ),
  NotificationModelData(
    id: '16',
    title: 'Lorem Ipsum 33',
    description: 'Dolor sit amet 16',
    userId: 'user2',
    read: true,
  ),
  NotificationModelData(
    id: '17',
    title: 'Lorem Ipsum 34',
    description: 'Dolor sit amet 17',
    userId: 'user3',
    read: true,
  ),
];
