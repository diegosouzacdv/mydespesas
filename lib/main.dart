import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myexpenses/controller/offset_controller.dart';
import 'package:myexpenses/providers/card_provider.dart';
import 'package:myexpenses/services/auth_service.dart';
import 'package:myexpenses/widgets/auth_check.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.light, // top bar icons
      ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyExpenses());
 // final CartaoDao _dao = CartaoDao();
  //_dao.findAll().then((cartoes) => debugPrint(cartoes.toString()));
}

class MyExpenses extends StatelessWidget {
  const MyExpenses({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AuthService()),
          ChangeNotifierProvider(create: (context) => CardProvider()),
          ChangeNotifierProvider(create: (context) => OffsetController()),
          ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          brightness: Brightness.dark,
        ),
        home: const AuthCheck()
      ),
    );
  }
}
