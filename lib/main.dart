import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_dashbord/core/uitels/backend%20Impoint.dart';
import 'core/helpes_function/on_Gnerate_Route.dart';
import 'core/services/CustomBlocObserver.dart';
import 'core/services/SupabaseStorgeService.dart';
import 'core/services/git_it_Service.dart';
import 'features/dashord/views/dashbrd view.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseStorgeService.initSupebase();
  await SupabaseStorgeService.CreatBucket(BackEndImpoint.fruits_imageBucket);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setupGitit();
  Bloc.observer = MyBlocObserver();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates:  const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale:  const Locale('ar'),
      debugShowCheckedModeBanner: false,
      initialRoute:DashBordView.routName,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
