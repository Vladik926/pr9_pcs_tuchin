import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'auth_page.dart';
import 'notes_page.dart';


const supabaseUrl = 'https://iwqcyarssagcdxefxkqe.supabase.co';
const supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml3cWN5YXJzc2FnY2R4ZWZ4a3FlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM5NzUwNzUsImV4cCI6MjA3OTU1MTA3NX0.RZi_zcC2XFMtkB6q6RkaLUoCX41eF6QqtuT69CgO3xE';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supabase Notes',
      theme: ThemeData(useMaterial3: true),
      home: const AuthGate(),
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final session = snapshot.data?.session;
        if (session != null) {
          return NotesPage();
        } else {
          return AuthPage();
        }
      },
    );
  }
}