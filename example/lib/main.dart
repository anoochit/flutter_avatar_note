import 'package:flutter/material.dart';

import 'package:flutter_avatar_note/flutter_avatar_note.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const avatarUrl =
      'https://avatars.githubusercontent.com/u/1182518?v=4';
  static const audioUrl = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AvatarNote(
              radius: 96.0,
              imageUrl: avatarUrl,
              note: 'Sint enim ad occaecat nulla sint.',
              audioUrl: audioUrl,
            ),
            AvatarNoteInputField(
                radius: 96.0,
                imageUrl: avatarUrl,
                onNoteChanged: (String note) {
                  // do something
                },
                onNoteSubmited: (String note) {
                  // do something
                }),
          ],
        ),
      ),
    );
  }
}
