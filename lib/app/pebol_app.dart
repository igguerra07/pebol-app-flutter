import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pebol_app/app/features/matches/ui/pages/matches/matches_page.dart';
import 'package:pebol_app/app/theme/light/light_theme.dart';

class PebolApp extends StatefulWidget {
  const PebolApp({Key? key}) : super(key: key);

  @override
  State<PebolApp> createState() => _PebolAppState();
}

class _PebolAppState extends State<PebolApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MatchesPage(),
      theme: ThemeLight().theme,
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', ''),
        Locale('en', ''),
      ],
    );
  }
}
