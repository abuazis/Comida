import 'package:comida/shared/theme.dart';
import 'package:comida/states/bloc/page_bloc.dart';
import 'package:comida/states/bloc/user_bloc.dart';
import 'package:comida/states/provider/navigation_provider.dart';
import 'package:comida/states/provider/validation_provider.dart';
import 'package:comida/ui/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) => {
    runApp(MyApp()),
  });
}

/// Declaring root class of this project.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PageBloc()),
        BlocProvider(create: (_) => UserBloc()),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ValidationProvider()),
          ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ],
        child: GetMaterialApp(
          title: "Comida - Fast Food Market",
          theme: appTheme,
          debugShowCheckedModeBanner: false,
          home: Wrapper(),
        ),
      ),
    );
  }
}