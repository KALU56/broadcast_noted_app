import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/auth/presentation/bloc/auth_cubit.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'core/routes/app_router.dart';

class BroadcastApp extends StatelessWidget {
  final AuthRepositoryImpl authRepository;

  const BroadcastApp({super.key, required this.authRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(authRepository: authRepository),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Broadcast Notes',
        theme: ThemeData(
          colorSchemeSeed: Colors.deepPurple,
          useMaterial3: true,
        ),
        initialRoute: AppRouter.splash,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
