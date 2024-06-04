import 'dart:io';
import 'package:flutter/material.dart';

class GroupChatScreen extends StatefulWidget {
  final String groupName;
  final List<String> members;

  const GroupChatScreen({super.key, required this.groupName, required this.members});

  @override
  _GroupChatScreenState createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  late FocusNode _messageFocusNode; // For managing keyboard focus
  File? _groupProfileImage; // Store the selected group profile image

  // Simulate chat messages (replace with actual data fetching/storage)
  List<ChatMessage> _messages = [
    ChatMessage(sender: 'Risper Ndirangu', text: 'Hi everyone! ', timestamp: DateTime.now()),
    ChatMessage(sender: 'Jackline Wangui', text: 'Hey Risper, how\'s it going?', timestamp: DateTime.now().add(Duration(minutes: 5))),
  ];

  String _groupBio = ''; // Store group biography

  @override
  void initState() {
    super.initState();
    _messageFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _messageFocusNode.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final message = _messageController.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        _messages.add(ChatMessage(sender: 'You', text: message, timestamp: DateTime.now()));
        _messageController.text = ''; // Clear the message field
      });
      // Handle sending message to backend (replace with your implementation)
    }
  }

  void _initiateVideoMeeting() {
    // Placeholder for initiating video meeting functionality (consider using a plugin or third-party service)
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Video meeting functionality is not yet implemented.')),
    );
  }

  void _initiateCall() {
    // Placeholder for initiating call functionality (consider using a plugin or third-party service)
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Call functionality is not yet implemented.')),
    );
  }

  void _updateGroupBio(String bio) {
    setState(() {
      _groupBio = bio;
    });
  }

  void _selectProfileImage() async {
    // Implement image selection functionality
    // For example, using image picker plugin
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.groupName),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GroupInfoScreen(onUpdateBio: _updateGroupBio)),
              );
            },
            tooltip: 'Group Info',
          ),
          // Add emoji picker icon (consider using a custom icon or material icon)
          IconButton(
            icon: const Icon(Icons.phone),
            onPressed: _initiateCall,
            tooltip: 'Call',
          ),
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: _initiateVideoMeeting,
            tooltip: 'Video Meeting',
          ),
          IconButton(
            icon: Icon(Icons.photo), // Placeholder icon
            onPressed: _selectProfileImage,
            tooltip: 'Change Group Profile Picture',
          ),
        ],
        leading: _groupProfileImage != null
            ? CircleAvatar(
                backgroundImage: FileImage(_groupProfileImage!),
              )
            : null,
      ),
      body: Column(
        children: [
          // Info section (replace with actual content retrieval)
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: Row(
              children: [
                const Text('Members: '),
                Text(widget.members.join(', ')),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              reverse: true, // Display newest messages at the top
              padding: const EdgeInsets.all(16.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return _buildMessageBubble(message);
              },
            ),
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    focusNode: _messageFocusNode,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Group Info',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Biography: $_groupBio'), // Display group biography
            ),
            ListTile(
              title: Text('Members'),
              onTap: () {
                // Update this to navigate to the members screen
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    return Align(
      alignment: message.sender == 'You' ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        decoration: BoxDecoration(
          color: message.sender == 'You' ? Colors.blue[100] : Colors.grey[200],
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.sender,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: message.sender == 'You' ? Colors.blue : Colors.black,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              message.text,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 4.0),
            Text(
              message.timestamp.toString(), // Display timestamp
              style: TextStyle(
                fontSize: 10.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage {
  final String sender;
  final String text;
  final DateTime timestamp; // Timestamp for the message

  const ChatMessage({required this.sender, required this.text, required this.timestamp});
}

class GroupInfoScreen extends StatefulWidget {
  final void Function(String) onUpdateBio;

  const GroupInfoScreen({super.key, required this.onUpdateBio});

  @override
  _GroupInfoScreenState createState() => _GroupInfoScreenState();
}

class _GroupInfoScreenState extends State<GroupInfoScreen> {
  final TextEditingController _bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade600,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade600,
        title: Text('Group Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Group Biography:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color:Colors.white,
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _bioController,
              maxLines: 6,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter group biography...',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final bio = _bioController.text;
                widget.onUpdateBio(bio); // Pass bio back to GroupChatScreen
                Navigator.pop(context); // Close the screen
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bioController.dispose();
    super.dispose();
  }
}
