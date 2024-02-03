import 'package:dayjob/domain/process_jobs/process_jobs_bloc.dart';
import 'package:dayjob/presentation/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'domain/screen_navigation/screen_navigation_bloc.dart';
import 'domain/navigation_bar_visibility/navigation_bar_visibility_bloc.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await Hive.initFlutter();
  await Hive.openBox("Jobs");

  runApp(const MyApp());
}

final messengerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // MultiBlocProvider provider allows for an instance of your blocs to persist across the application
    return MultiBlocProvider(
      providers: [
        BlocProvider<ScreenNavigationBloc>(create: (context) => ScreenNavigationBloc()),
        BlocProvider<NavigationBarVisibilityBloc>(create: (context) => NavigationBarVisibilityBloc()),
        BlocProvider<ProcessJobsBloc>(create: (context) => ProcessJobsBloc()),
      ],
      child: MaterialApp(
        title: 'Day Job',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white
          ),
          useMaterial3: true,
        ),
        home: LandingScreen(),
      ),
    );
  }
}