import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_application/_core/routes_names.dart';
import 'modules/app_module.dart';

void main() {
  return runApp(ModularApp(
    module: AppModule(),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Desktop App',
      routerConfig: Modular.routerConfig,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (context, child) {
        return App(child);
      },
    );
  }

  Scaffold App(Widget? child) {
    return Scaffold(
      body: Row(
        children: [
          // Barra lateral
          Container(
            width: 200.0,
            color: CupertinoColors.systemPurple,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0),
                InkWell(
                  onTap: () {
                    Modular.to.navigate(AppRoutes.home);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _iconLabel('Home', Icons.home),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Modular.to.navigate(AppRoutes.student);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _iconLabel('Estudantes', Icons.people),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Modular.to.navigate(AppRoutes.course);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _iconLabel('Cursos', Icons.book),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: child ?? Container(),
          ),
        ],
      ),
    );
  }

  Widget? _iconLabel(String label, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(width: 10.0),
        Text(label, style: const TextStyle(color: Colors.white),),
      ],
    );
  }
}
