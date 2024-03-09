import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat App',
      theme: ThemeData(
        primaryColor: Colors.black,
        colorScheme: ColorScheme.dark(
          secondary: Colors.white,
        ),
      ),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.network(
              'https://www.logolynx.com/images/logolynx/s_0f/0f6967123d64df648d759f55de345d78.png',
              width: 100,
              height: 100,
            ),
            SizedBox(width: 8),
            Text('Chat App'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.login),
            onPressed: () {
              // Implement login functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.person_add),
            onPressed: () {
              // Implement signup functionality
            },
          ),
        ],
        flexibleSpace: ListView(
          children: [
            SizedBox(height: 56), // Height of the app bar
            _buildScrollDownSection(),
          ],
          scrollDirection: Axis.horizontal,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView.builder(
                itemCount: 10, // Replace with your actual message list size
                itemBuilder: (context, index) {
                  return ChatMessage('User $index', 'Hello, how are you?');
                },
              ),
            ),
          ),
          _buildMessageInputField(),
        ],
      ),
    );
  }

  Widget _buildScrollDownSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          TextButton(
            onPressed: () {
              // Implement scroll down functionality
            },
            child: Text(
              'Scroll Down',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInputField() {
    return Container(
      padding: EdgeInsets.all(8.0),
      color: Colors.black,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message...',
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.send,
              color: Colors.white,
            ),
            onPressed: () {
              // Implement sending message functionality
            },
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String sender;
  final String message;

  ChatMessage(this.sender, this.message);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.0),
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              message,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
