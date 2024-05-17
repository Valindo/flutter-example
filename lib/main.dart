import 'package:flutter/material.dart';
import 'package:techm_interview/screens/homepage.dart';
import 'package:techm_interview/services/quotes_service.dart';
import 'package:techm_interview/models/quote.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AppState(http.Client()),
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              // This is the theme of your application.
              //
              // TRY THIS: Try running your application with "flutter run". You'll see
              // the application has a purple toolbar. Then, without quitting the app,
              // try changing the seedColor in the colorScheme below to Colors.green
              // and then invoke "hot reload" (save your changes or press the "hot
              // reload" button in a Flutter-supported IDE, or press "r" if you used
              // the command line to start the app).
              //
              // Notice that the counter didn't reset back to zero; the application
              // state is not lost during the reload. To reset the state, use hot
              // restart instead.
              //
              // This works for code too, not just values: Most code changes can be
              // tested with just a hot reload.
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
              useMaterial3: true,
            ),
            // home: const MyHomePage(title: 'Flutter Demo Home Page'),
            home: HomePage()));
  }
}

class AppState extends ChangeNotifier {
  var currentQuote = Quote(
      id: "1", author: "Germany Kent", quote: "If you're reading this, I hope God opens incredible doors for your life this year. Greatness is upon you. You must believe it though.");
  var upVotedQuotes = <Quote>[];
  final http.Client client;
  AppState(this.client);
  void getNextQuote() async {
    currentQuote = await getRandomQuote(client);
    notifyListeners();
  }

  void rate(int rating) async {
    currentQuote.rateQuote(rating);
    upVotedQuotes.add(currentQuote);
    notifyListeners();
  }
}
