import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insideflyingconcept/Authentication/authservices.dart';
import 'package:insideflyingconcept/Authentication/googlelogin.dart';
import 'package:insideflyingconcept/Bloc%20Providers/Connectivity_Plus/connectivity_bloc.dart';
import 'package:insideflyingconcept/Django_Server/Logic_Systems/drone_cubit.dart';
import 'package:insideflyingconcept/routes.dart';

import 'package:logger/logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

var log = Logger(
  printer: PrettyPrinter(
    colors: true, // Colorful log messages
    printEmojis: true, // Print an emoji for each log message
  ),
);
void main() async {
  Bloc.observer = SystemBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<InternetConnectivityBloc>(
            create: (context) => InternetConnectivityBloc(),
          ),
          BlocProvider(create: (context) => DroneCubit()),
        ],
        child: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: MaterialApp(
              title: 'InsideAeroTech',
              debugShowCheckedModeBanner: false,
              onGenerateRoute: Routes.systemRoutes,
              initialRoute: GoogleLogin.routeName,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              )),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class SystemBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    log.d("Generated: $bloc");
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log.d("onChanged: $change");
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log.e("Error: $stackTrace");
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    log.d("Generated: $bloc");
    super.onClose(bloc);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log.d("Generated: $transition");
    super.onTransition(bloc, transition);
  }
}
