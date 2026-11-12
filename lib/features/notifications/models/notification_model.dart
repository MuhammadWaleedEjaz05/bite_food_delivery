import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class NotificationModel extends Equatable {
  final String id;
  final String userId;
  final String title;
  final String body;
  final String type;
  final String? orderId;
  final DateTime createdAt;
  final bool isRead;

  NotificationModel({
    String? id,
    required this.userId,
    required this.title,
    required this.body,
    required this.type,
    this.orderId,
    DateTime? createdAt,
    this.isRead = false,
  }) : id = id ?? _uuid.v4(),
       createdAt = createdAt ?? DateTime.now();

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: (json['id'] ?? _uuid.v4()) as String,
      userId: (json['userId'] ?? '') as String,
      title: (json['title'] ?? '') as String,
      body: (json['body'] ?? '') as String,
      type: (json['type'] ?? '') as String,
      orderId: json['orderId'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'] as String) ?? DateTime.now()
          : DateTime.now(),
      isRead: (json['isRead'] ?? false) as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'body': body,
      'type': type,
      'orderId': orderId,
      'createdAt': createdAt.toIso8601String(),
      'isRead': isRead,
    };
  }

  NotificationModel copyWith({
    String? id,
    String? userId,
    String? title,
    String? body,
    String? type,
    String? orderId,
    DateTime? createdAt,
    bool? isRead,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      body: body ?? this.body,
      type: type ?? this.type,
      orderId: orderId ?? this.orderId,
      createdAt: createdAt ?? this.createdAt,
      isRead: isRead ?? this.isRead,
    );
  }

  @override
  List<Object?> get props => [
    id,
    userId,
    title,
    body,
    type,
    orderId,
    createdAt,
    isRead,
  ];
}
