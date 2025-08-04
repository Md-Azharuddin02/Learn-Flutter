class Chat {
  final String id;
  final String name;
  final String? avatar;
  final List<String> participantIds;
  final Message? lastMessage;
  final int unreadCount;
  final bool isGroup;
  final bool isBotChat;
  final DateTime? lastActivity;
  final DateTime createdAt;
  final DateTime updatedAt;

  Chat({
    required this.id,
    required this.name,
    this.avatar,
    required this.participantIds,
    this.lastMessage,
    this.unreadCount = 0,
    this.isGroup = false,
    this.isBotChat = false,
    this.lastActivity,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory Chat.fromJson(Map<String, dynamic> json) {
    try {
      return Chat(
        id: json['id']?.toString() ?? '',
        name: json['name']?.toString() ?? '',
        avatar: json['avatar']?.toString(),
        participantIds: _parseParticipantIds(json['participantIds']),
        lastMessage: json['lastMessage'] != null
            ? Message.fromJson(json['lastMessage'])
            : null,
        unreadCount: _parseInt(json['unreadCount']) ?? 0,
        isGroup: json['isGroup'] == true,
        isBotChat: json['isBotChat'] == true,
        lastActivity: _parseDateTime(json['lastActivity']),
        createdAt: _parseDateTime(json['createdAt']) ?? DateTime.now(),
        updatedAt: _parseDateTime(json['updatedAt']) ?? DateTime.now(),
      );
    } catch (e) {
      throw FormatException('Failed to parse Chat from JSON: $e');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatar': avatar,
      'participantIds': participantIds,
      'lastMessage': lastMessage?.toJson(),
      'unreadCount': unreadCount,
      'isGroup': isGroup,
      'isBotChat': isBotChat,
      'lastActivity': lastActivity?.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  // Helper methods for safer parsing
  static List<String> _parseParticipantIds(dynamic value) {
    if (value == null) return [];
    if (value is List) {
      return value
          .map((e) => e?.toString() ?? '')
          .where((e) => e.isNotEmpty)
          .toList();
    }
    return [];
  }

  static int? _parseInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    if (value is double) return value.toInt();
    return null;
  }

  static DateTime? _parseDateTime(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    if (value is String) {
      try {
        return DateTime.parse(value);
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  // Utility methods
  Chat copyWith({
    String? id,
    String? name,
    String? avatar,
    List<String>? participantIds,
    Message? lastMessage,
    int? unreadCount,
    bool? isGroup,
    bool? isBotChat,
    DateTime? lastActivity,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Chat(
      id: id ?? this.id,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      participantIds: participantIds ?? this.participantIds,
      lastMessage: lastMessage ?? this.lastMessage,
      unreadCount: unreadCount ?? this.unreadCount,
      isGroup: isGroup ?? this.isGroup,
      isBotChat: isBotChat ?? this.isBotChat,
      lastActivity: lastActivity ?? this.lastActivity,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Chat markAsRead() {
    return copyWith(unreadCount: 0, updatedAt: DateTime.now());
  }

  Chat updateLastMessage(Message message) {
    return copyWith(
      lastMessage: message,
      lastActivity: message.timestamp,
      updatedAt: DateTime.now(),
    );
  }

  Chat incrementUnreadCount() {
    return copyWith(unreadCount: unreadCount + 1, updatedAt: DateTime.now());
  }

  // Getters for convenience
  bool get hasUnreadMessages => unreadCount > 0;

  bool get isActive =>
      lastActivity != null &&
      DateTime.now().difference(lastActivity!).inDays < 30;

  String get displayName => name.isEmpty ? 'Unnamed Chat' : name;

  String get lastActivityFormatted {
    if (lastActivity == null) return '';
    final now = DateTime.now();
    final difference = now.difference(lastActivity!);

    if (difference.inMinutes < 1) return 'Just now';
    if (difference.inHours < 1) return '${difference.inMinutes}m ago';
    if (difference.inDays < 1) return '${difference.inHours}h ago';
    if (difference.inDays < 7) return '${difference.inDays}d ago';

    return '${lastActivity!.day}/${lastActivity!.month}/${lastActivity!.year}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Chat && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Chat(id: $id, name: $name, isGroup: $isGroup, unreadCount: $unreadCount)';
  }
}
