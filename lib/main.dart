import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heimat/be/cache.dart';
import 'package:heimat/ui/screens/onboard/onboard.dart';
import 'package:heimat/ui/utils/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) => runApp(const App()),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // enable edge-To-Edge background
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    
    // caching images
    for (var image in cacheImagesList) {
      precacheImage(image, context);
    }

    return MaterialApp(
      title: "Heimat",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primary,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: primary,
          secondary: secondary,
        ),
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
      ),
      home: const OnBoardScreen(),
    );
  }
}
