import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muna_notes_app/const/general_colors.dart';
import 'package:muna_notes_app/screens/homepage/load_page_screens.dart';
import 'package:muna_notes_app/service/auth/bloc/auth_bloc.dart';
import 'package:muna_notes_app/service/auth/fire_service_auth_provider.dart';
import 'package:muna_notes_app/service/cloud/bloc/noteservice_bloc.dart';
import 'package:muna_notes_app/service/cloud/cloud_action_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Note App',
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: AppColors.blackcolor),
          colorScheme: const ColorScheme.dark(
              brightness: Brightness.dark,
              background: Color.fromARGB(255, 37, 37, 37),
              primary: Colors.white),
          useMaterial3: true,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(
              create: (context) => AuthBloc(FirebaseAuthProvider())
                ..add(const AuthEventInitialize()),
            ),
            BlocProvider(
              create: (context) => NoteserviceBloc(FirebaseCloudService()),
            ),
          ],
          child: const LoadPageScreens(),
        ),
      ),
    );
  }
}
