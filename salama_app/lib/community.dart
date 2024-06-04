import 'package:flutter/material.dart';
import 'chat.dart';

class CommunityPeerGroupsScreen extends StatefulWidget {
  const CommunityPeerGroupsScreen({Key? key});

  @override
  State<CommunityPeerGroupsScreen> createState() => _CommunityPeerGroupsScreenState();
}

class Group {
  final String name;
  final String creator;
  final String description;
  final List<Member> members;
  final List<Message> messages;

  Group(this.name, this.creator, this.description, this.members, this.messages);
}

class Member {
  final String username;
  final bool isModerator;

  Member(this.username, this.isModerator);
}

class Message {
  final String content;
  final String sender;
  final DateTime timestamp;
  final List<String> reactions; // List of emoji reactions

  Message(this.content, this.sender, this.timestamp, this.reactions);
}

class _CommunityPeerGroupsScreenState extends State<CommunityPeerGroupsScreen> {
  List<Group> _groups = []; // List of all groups
  final TextEditingController _groupNameController = TextEditingController();
  final TextEditingController _groupDescController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  bool _searching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Peer Groups', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepOrange,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() {
                _searching = true;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _createGroupDialog(context),
          )
        ],
      ),
      body: _searching ? _searchResults() : _groupList(),
    );
  }

  Widget _groupList() {
    return Container(
      color: Colors.white, // Your fancy background color
      child: Column(
        children: [
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _createGroupDialog(context),
            child: Text('Create Group', style:TextStyle(color: Colors.black)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _groups.length,
              itemBuilder: (context, index) {
                final group = _groups[index];
                return ListTile(
                  title: Text(group.name, style:TextStyle(color: Colors.black)),
                  subtitle: Text(group.description, style:TextStyle(color: Colors.black)),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Colors.red,
                    onPressed: () {
                      _deleteGroup(index);
                  },
                ),
                  onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => GroupChatScreen(groupName: group.name, members: [],),
                    ),
                    );
                  }
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchResults() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Search Groups',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              // Implement search functionality
            },
          ),
        ),
        Expanded(child: _groupList()),
      ],
    );
  }

  Future<void> _createGroupDialog(BuildContext context) async {
    _groupNameController.clear(); // Clear the text field for the next group
    _groupDescController.clear(); // Clear the text field for the next group

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Create Group', style:TextStyle(color: Colors.black)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _groupNameController,
                decoration: InputDecoration(
                  labelText: 'Group Name',
                ),
              ),
              TextField(
                controller: _groupDescController,
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel',  style:TextStyle(color: Colors.black)),
            ),
            ElevatedButton(
              onPressed: () {
                _createGroup(_groupNameController.text, _groupDescController.text);
                Navigator.pop(context);
              },
              child: Text('Create',  style:TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  void _createGroup(String groupName, String description) {
    setState(() {
      _groups.add(
        Group(groupName, "currentUser.username", description, [], []),
      );
    });
  }
   void _deleteGroup(int index) {
    setState(() {
      _groups.removeAt(index);
    });
  }
}

