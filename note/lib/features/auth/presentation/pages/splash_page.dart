import 'package:broadcast/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:broadcast/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    print("🌀 SplashPage started...");
    Future.delayed(const Duration(seconds: 2), () {
      print("🔍 Checking current user...");
      context.read<AuthCubit>().getCurrentUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          print("📡 Auth state changed to: $state");
          if (state is AuthAuthenticated) {
            print("✅ User logged in → Navigating to Home");
            Navigator.pushReplacementNamed(context, '/home');
          } else if (state is AuthUnauthenticated) {
            print("🚪 No user → Navigating to Login");
            Navigator.pushReplacementNamed(context, '/login');
          }
        },
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.podcasts, size: 100, color: Colors.deepPurple),
              SizedBox(height: 20),
              Text(
                "Broadcast Notes",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
