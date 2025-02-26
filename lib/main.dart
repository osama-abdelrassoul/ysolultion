import 'package:flutter/material.dart';
import 'package:ysolultion/core/services/injection_container.dart';
import 'package:ysolultion/features/task/presentation/screens/post_details_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "YSolution",
      debugShowCheckedModeBanner: false,
      home: PostScreen(),
    );
  }
}
