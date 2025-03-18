import 'package:flutter/material.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final List<ChatMessage> _messages = [
    const ChatMessage(text: "Hello! How can I help?", isUser: false)
  ];
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _handleSubmitted(String text) {
    if (text.isEmpty) return;
    _textController.clear();
    setState(() => _messages.insert(0, ChatMessage(text: text, isUser: true)));
    _scrollToBottom();
    _getBotResponse(text);
  }

  void _getBotResponse(String userMessage) {
    final response = userMessage.contains('period')
        ? 'Periods last 3-7 days.'
        : 'Ask about periods!';
    setState(
        () => _messages.insert(0, ChatMessage(text: response, isUser: false)));
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(0,
          duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (_, i) => _messages[i],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textController,
                  onSubmitted: _handleSubmitted,
                  decoration: InputDecoration(
                    hintText: "Ask me anything",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text),
                padding: const EdgeInsets.all(12),
                style: IconButton.styleFrom(
                    backgroundColor: const Color(0xFF7E57C2),
                    foregroundColor: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  const ChatMessage({super.key, required this.text, required this.isUser});

  final String text;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isUser)
            const CircleAvatar(
                backgroundColor: Color(0xFF7E57C2),
                child: Icon(Icons.health_and_safety, color: Colors.white)),
          const SizedBox(width: 12),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isUser ? Colors.black : const Color(0xFF7E57C2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(text, style: const TextStyle(color: Colors.white)),
            ),
          ),
          const SizedBox(width: 12),
          if (isUser)
            const CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(Icons.person, color: Colors.white)),
        ],
      ),
    );
  }
}
