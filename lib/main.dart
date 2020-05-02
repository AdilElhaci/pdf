import 'package:flutter/material.dart';
import 'package:librarywithm/services/locator.dart';
import 'package:librarywithm/ui/landing_page.dart';
import 'package:provider/provider.dart';
import 'viewmodels/user_model.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder :  (context)=>UserModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: LandingPage()
      ),
    );
  }
}
