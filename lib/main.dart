import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_application/_core/routes_names.dart';
import 'modules/app_module.dart';

// TODO: Remover os Cursos da lista de cursos
// TODO: Implementar a parte de Estudantes

void main() {
  return runApp(ModularApp(module: AppModule(), child: MyApp(),));
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
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Início',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Modular.to.navigate(AppRoutes.student);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Estudantes',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Modular.to.navigate(AppRoutes.course);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Cursos',
                          style: TextStyle(color: Colors.white),
                        ),
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
      },
    );
  }
}