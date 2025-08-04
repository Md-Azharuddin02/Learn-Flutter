import 'package:flutter/material.dart';
import '../user/friend_list.dart';

// Define Message model outside the widget
class Message {
  final String id;
  final String senderId;
  final String text;
  final String time;

  Message({
    required this.id,
    required this.senderId,
    required this.text,
    required this.time,
  });
}

const String me = "me"; // Your user id (for all screens)R

final Map<String, List<Message>> conversations = {
  "1": [
    Message(
      id: "1-1",
      senderId: "1",
      text: "Hi, are we still on for today?",
      time: "11:19 AM",
    ),
    Message(
      id: "1-2",
      senderId: me,
      text: "Yes, looking forward to it!",
      time: "11:20 AM",
    ),
    Message(
      id: "1-3",
      senderId: "1",
      text: "Awesome, see you at lunch.",
      time: "11:21 AM",
    ),
    Message(id: "1-4", senderId: me, text: "See you soon!", time: "11:22 AM"),
    Message(id: "1-5", senderId: "1", text: "Great!", time: "11:23 AM"),
  ],
  "2": [
    Message(
      id: "2-1",
      senderId: "2",
      text: "I'll call you in 5 mins.",
      time: "2:45 PM",
    ),
    Message(id: "2-2", senderId: me, text: "Okay, waiting!", time: "2:46 PM"),
    Message(id: "2-3", senderId: "2", text: "Dialing now.", time: "2:47 PM"),
    Message(id: "2-4", senderId: me, text: "Got it.", time: "2:48 PM"),
    Message(id: "2-5", senderId: "2", text: "Hello!", time: "2:49 PM"),
  ],
  "3": [
    Message(
      id: "3-1",
      senderId: "3",
      text: "Got the files, thanks!",
      time: "9:15 AM",
    ),
    Message(id: "3-2", senderId: me, text: "You're welcome!", time: "9:16 AM"),
    Message(
      id: "3-3",
      senderId: "3",
      text: "Will review them today.",
      time: "9:17 AM",
    ),
    Message(
      id: "3-4",
      senderId: me,
      text: "Let me know if you need anything.",
      time: "9:18 AM",
    ),
    Message(id: "3-5", senderId: "3", text: "Sure, thanks!", time: "9:19 AM"),
  ],
  "4": [
    Message(
      id: "4-1",
      senderId: "4",
      text: "Let me know when you're free.",
      time: "8:50 PM",
    ),
    Message(
      id: "4-2",
      senderId: me,
      text: "I'm free after 9.",
      time: "8:51 PM",
    ),
    Message(
      id: "4-3",
      senderId: "4",
      text: "Perfect, will call you then.",
      time: "8:52 PM",
    ),
    Message(id: "4-4", senderId: me, text: "Sounds good!", time: "8:53 PM"),
    Message(id: "4-5", senderId: "4", text: "Talk soon.", time: "8:54 PM"),
  ],
  "5": [
    Message(
      id: "5-1",
      senderId: "5",
      text: "Meeting is at 4.",
      time: "3:10 PM",
    ),
    Message(
      id: "5-2",
      senderId: me,
      text: "Noted. I'll be there.",
      time: "3:11 PM",
    ),
    Message(id: "5-3", senderId: "5", text: "See you then!", time: "3:12 PM"),
    Message(id: "5-4", senderId: me, text: "See you!", time: "3:13 PM"),
    Message(id: "5-5", senderId: "5", text: "Thanks!", time: "3:14 PM"),
  ],
  "6": [
    Message(
      id: "6-1",
      senderId: "6",
      text: "Done with the task.",
      time: "6:00 PM",
    ),
    Message(
      id: "6-2",
      senderId: me,
      text: "Awesome, thank you!",
      time: "6:01 PM",
    ),
    Message(
      id: "6-3",
      senderId: "6",
      text: "Let me know if you need changes.",
      time: "6:02 PM",
    ),
    Message(
      id: "6-4",
      senderId: me,
      text: "Will review and update.",
      time: "6:03 PM",
    ),
    Message(id: "6-5", senderId: "6", text: "Alright.", time: "6:04 PM"),
  ],
  "7": [
    Message(
      id: "7-1",
      senderId: "7",
      text: "Lunch tomorrow?",
      time: "12:30 PM",
    ),
    Message(
      id: "7-2",
      senderId: me,
      text: "Yes, let's do it.",
      time: "12:31 PM",
    ),
    Message(
      id: "7-3",
      senderId: "7",
      text: "Where do you want to go?",
      time: "12:32 PM",
    ),
    Message(
      id: "7-4",
      senderId: me,
      text: "How about Cafe Rio?",
      time: "12:33 PM",
    ),
    Message(id: "7-5", senderId: "7", text: "Sounds great!", time: "12:34 PM"),
  ],
  "8": [
    Message(
      id: "8-1",
      senderId: "8",
      text: "Looks good to me.",
      time: "10:05 AM",
    ),
    Message(
      id: "8-2",
      senderId: me,
      text: "Glad you liked it.",
      time: "10:06 AM",
    ),
    Message(
      id: "8-3",
      senderId: "8",
      text: "Thanks for your effort.",
      time: "10:07 AM",
    ),
    Message(id: "8-4", senderId: me, text: "Anytime!", time: "10:08 AM"),
    Message(
      id: "8-5",
      senderId: "8",
      text: "Have a nice day.",
      time: "10:09 AM",
    ),
  ],
  "9": [
    Message(id: "9-1", senderId: "9", text: "Sent the email.", time: "1:20 PM"),
    Message(
      id: "9-2",
      senderId: me,
      text: "Received, thanks!",
      time: "1:21 PM",
    ),
    Message(
      id: "9-3",
      senderId: "9",
      text: "Let me know your feedback.",
      time: "1:22 PM",
    ),
    Message(id: "9-4", senderId: me, text: "Will do.", time: "1:23 PM"),
    Message(id: "9-5", senderId: "9", text: "Waiting!", time: "1:24 PM"),
  ],
  "10": [
    Message(
      id: "10-1",
      senderId: "10",
      text: "What's the update?",
      time: "5:30 PM",
    ),
    Message(
      id: "10-2",
      senderId: me,
      text: "Almost done, will share soon.",
      time: "5:31 PM",
    ),
    Message(id: "10-3", senderId: "10", text: "Thanks!", time: "5:32 PM"),
    Message(id: "10-4", senderId: me, text: "You're welcome!", time: "5:33 PM"),
    Message(id: "10-5", senderId: "10", text: "Let me know.", time: "5:34 PM"),
  ],
  "11": [
    Message(id: "11-1", senderId: "11", text: "Okay cool!", time: "7:45 PM"),
    Message(
      id: "11-2",
      senderId: me,
      text: "Let me know if you need anything.",
      time: "7:46 PM",
    ),
    Message(id: "11-3", senderId: "11", text: "Sure!", time: "7:47 PM"),
    Message(id: "11-4", senderId: me, text: "Great!", time: "7:48 PM"),
    Message(id: "11-5", senderId: "11", text: "Talk soon.", time: "7:49 PM"),
  ],
  "12": [
    Message(id: "12-1", senderId: "12", text: "On the way.", time: "4:55 PM"),
    Message(id: "12-2", senderId: me, text: "Drive safe.", time: "4:56 PM"),
    Message(id: "12-3", senderId: "12", text: "Thanks!", time: "4:57 PM"),
    Message(id: "12-4", senderId: me, text: "See you soon.", time: "4:58 PM"),
    Message(id: "12-5", senderId: "12", text: "Almost there.", time: "4:59 PM"),
  ],
  "13": [
    Message(
      id: "13-1",
      senderId: "13",
      text: "See you then!",
      time: "11:00 AM",
    ),
    Message(
      id: "13-2",
      senderId: me,
      text: "Looking forward to it.",
      time: "11:01 AM",
    ),
    Message(id: "13-3", senderId: "13", text: "Same here.", time: "11:02 AM"),
    Message(
      id: "13-4",
      senderId: me,
      text: "Let me know if plans change.",
      time: "11:03 AM",
    ),
    Message(id: "13-5", senderId: "13", text: "Sure!", time: "11:04 AM"),
  ],
  "14": [
    Message(
      id: "14-1",
      senderId: "14",
      text: "Please review this.",
      time: "2:15 PM",
    ),
    Message(
      id: "14-2",
      senderId: me,
      text: "Checking it now.",
      time: "2:16 PM",
    ),
    Message(id: "14-3", senderId: "14", text: "Thank you!", time: "2:17 PM"),
    Message(id: "14-4", senderId: me, text: "You're welcome.", time: "2:18 PM"),
    Message(
      id: "14-5",
      senderId: "14",
      text: "Waiting for your feedback.",
      time: "2:19 PM",
    ),
  ],
  "15": [
    Message(
      id: "15-1",
      senderId: "15",
      text: "Happy birthday!",
      time: "9:50 AM",
    ),
    Message(
      id: "15-2",
      senderId: me,
      text: "Thank you so much!",
      time: "9:51 AM",
    ),
    Message(
      id: "15-3",
      senderId: "15",
      text: "Have a great day!",
      time: "9:52 AM",
    ),
    Message(id: "15-4", senderId: me, text: "You too!", time: "9:53 AM"),
    Message(
      id: "15-5",
      senderId: "15",
      text: "Celebrate well!",
      time: "9:54 AM",
    ),
  ],
  "16": [
    Message(
      id: "16-1",
      senderId: "16",
      text: "Joining in 2 mins.",
      time: "6:25 PM",
    ),
    Message(id: "16-2", senderId: me, text: "I'll wait.", time: "6:26 PM"),
    Message(id: "16-3", senderId: "16", text: "Thanks.", time: "6:27 PM"),
    Message(id: "16-4", senderId: me, text: "No problem.", time: "6:28 PM"),
    Message(id: "16-5", senderId: "16", text: "Ready now.", time: "6:29 PM"),
  ],
  "17": [
    Message(
      id: "17-1",
      senderId: "17",
      text: "Call me when free.",
      time: "10:40 AM",
    ),
    Message(id: "17-2", senderId: me, text: "Will do!", time: "10:41 AM"),
    Message(id: "17-3", senderId: "17", text: "Thanks!", time: "10:42 AM"),
    Message(
      id: "17-4",
      senderId: me,
      text: "You're welcome.",
      time: "10:43 AM",
    ),
    Message(id: "17-5", senderId: "17", text: "Talk soon.", time: "10:44 AM"),
  ],
  "18": [
    Message(
      id: "18-1",
      senderId: "18",
      text: "Yep, confirmed.",
      time: "1:05 PM",
    ),
    Message(id: "18-2", senderId: me, text: "Great, thanks!", time: "1:06 PM"),
    Message(id: "18-3", senderId: "18", text: "No problem.", time: "1:07 PM"),
    Message(
      id: "18-4",
      senderId: me,
      text: "Let me know if you need anything.",
      time: "1:08 PM",
    ),
    Message(id: "18-5", senderId: "18", text: "Sure!", time: "1:09 PM"),
  ],
  "19": [
    Message(
      id: "19-1",
      senderId: "19",
      text: "Will update you soon.",
      time: "8:30 AM",
    ),
    Message(id: "19-2", senderId: me, text: "Thanks!", time: "8:31 AM"),
    Message(
      id: "19-3",
      senderId: "19",
      text: "You're welcome.",
      time: "8:32 AM",
    ),
    Message(
      id: "19-4",
      senderId: me,
      text: "Looking forward to it.",
      time: "8:33 AM",
    ),
    Message(
      id: "19-5",
      senderId: "19",
      text: "Have a good day.",
      time: "8:34 AM",
    ),
  ],
  "20": [
    Message(
      id: "20-1",
      senderId: "20",
      text: "Let's catch up!",
      time: "3:45 PM",
    ),
    Message(
      id: "20-2",
      senderId: me,
      text: "Sure, when are you free?",
      time: "3:46 PM",
    ),
    Message(
      id: "20-3",
      senderId: "20",
      text: "Tomorrow evening works?",
      time: "3:47 PM",
    ),
    Message(id: "20-4", senderId: me, text: "Perfect!", time: "3:48 PM"),
    Message(id: "20-5", senderId: "20", text: "See you then.", time: "3:49 PM"),
  ],
};

class ChatScreen extends StatefulWidget {
  final ChatItem chat;
  const ChatScreen({super.key, required this.chat});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // This can be used if you want a different user id for "you"
  final String currentUserId = me; // Or whatever you use

  @override
  Widget build(BuildContext context) {
    // Get this user's conversation, or empty if none
    final messages = conversations[widget.chat.id] ?? [];

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        titleSpacing: 0,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 18,
              child: Icon(Icons.person, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 12),
            Text(
              widget.chat.name,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.black87),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(
            icon: const Icon(Icons.videocam_outlined),
            onPressed: () {},
          ),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isMe = message.senderId == currentUserId;
                return Align(
                  alignment: isMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: Column(
                      crossAxisAlignment: isMe
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        // Show username (optional)
                        Text(
                          isMe ? "You" : widget.chat.name,
                          style: TextStyle(
                            color: isMe ? Colors.blue[900] : Colors.red[900],
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                        // Bubble
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.70,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: isMe ? Colors.blue : Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(14),
                              topRight: const Radius.circular(14),
                              bottomLeft: Radius.circular(isMe ? 14 : 2),
                              bottomRight: Radius.circular(isMe ? 2 : 14),
                            ),
                            boxShadow: [
                              if (!isMe)
                                const BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  offset: Offset(0, 2),
                                ),
                            ],
                          ),
                          child: Text(
                            message.text,
                            style: TextStyle(
                              color: isMe ? Colors.white : Colors.black87,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        // Timestamp
                        Padding(
                          padding: const EdgeInsets.only(top: 2, right: 2),
                          child: Text(
                            message.time,
                            style: TextStyle(
                              color: isMe ? Colors.white70 : Colors.grey[600],
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Chat input
          SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              color: Colors.white,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.insert_emoticon_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Type a message",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey[500]),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.attach_file, color: Colors.grey),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
