import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mydespesas/database/dao/cartao_dao.dart';
import 'package:mydespesas/providers/cartao_provider.dart';
import 'package:mydespesas/services/auth_service.dart';
import 'package:mydespesas/widgets/auth_check.dart';
import 'package:provider/provider.dart';

const Color backgroundColor = Color(0xFF4A4A58);
Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
    statusBarColor: backgroundColor, // cor da barra superior
    statusBarIconBrightness: Brightness.light, // ícones da barra superior
    systemNavigationBarColor: backgroundColor, // cor da barra inferior
    systemNavigationBarIconBrightness: Brightness.light, // nes da barra inferior
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyDespesas());
  final CartaoDao _dao = CartaoDao();
  _dao.findAll().then((cartoes) => debugPrint(cartoes.toString()));
}

class MyDespesas extends StatelessWidget {
  const MyDespesas({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AuthService()),
          ChangeNotifierProvider(create: (context) => CartaoProvider()),
          ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const AuthCheck()
      ),
    );
  }
}
