import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './src/theming/theme_manager.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
      ],
      child: Builder(builder: (BuildContext context) {
        return Consumer<ThemeNotifier>(
          builder: (key, theme, child) => GetMaterialApp(
            theme: theme.getTheme(),
            debugShowCheckedModeBanner: false,
            title: 'Flutter Provider',
            home: HomePage(),
          ),
        );
      }),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
        builder: (context, theme, child) => Scaffold(
              backgroundColor: Theme.of(context).focusColor,
              appBar: AppBar(
                title: Text('Hybrid Theme'),
              ),
              body: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child: TextButton(
                          onPressed: () => {
                            print('Set Light Theme'),
                            theme.setLightMode(),
                          },
                          child: Text('Set Light Theme'),
                        ),
                      ),
                      Container(
                        child: TextButton(
                          onPressed: () => {
                            print('Set Dark theme'),
                            theme.setDarkMode(),
                          },
                          child: Text('Set Dark theme'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'this is waleed nawaz',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  )
                ],
              ),
            ));
  }
}
