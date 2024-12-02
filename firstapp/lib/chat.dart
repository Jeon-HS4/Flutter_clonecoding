import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // 예제 데이터: 채팅 목록
  final List<Map<String, String>> chatList = [
    {"name": "홍길동", "message": "안녕하세요! 구매 가능한가요?", "time": "오후 3:20"},
    {"name": "김영희", "message": "내일 거래 가능한가요?", "time": "오전 11:15"},
    {"name": "이철수", "message": "네 가능합니다!", "time": "어제"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("채팅"),
      ),
      body: ListView.separated(
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          final chat = chatList[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(
                "https://via.placeholder.com/150", // 사용자 프로필 이미지
              ),
            ),
            title: Text(
              chat["name"] ?? "",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(chat["message"] ?? ""),
            trailing: Text(
              chat["time"] ?? "",
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            onTap: () {
              // 채팅방 페이지로 이동
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatRoomPage(
                    name: chat["name"] ?? "",
                  ),
                ),
              );
            },
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}

// 채팅방 화면
class ChatRoomPage extends StatefulWidget {
  final String name; // 채팅 상대방 이름

  const ChatRoomPage({super.key, required this.name});

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  final TextEditingController _messageController = TextEditingController(); // 메시지 입력 컨트롤러
  final List<String> _messages = []; // 채팅 메시지 리스트

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Column(
        children: [
          // 채팅 메시지 리스트
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_messages[index]),
                  subtitle: const Text(
                    "보낸 시간",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          // 메시지 입력 창
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: "메시지를 입력하세요...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // 메시지 전송
                    if (_messageController.text.isNotEmpty) {
                      setState(() {
                        _messages.add(_messageController.text);
                        _messageController.clear();
                      });
                    }
                  },
                  child: const Text("전송"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
