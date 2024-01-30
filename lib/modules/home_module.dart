import 'package:flutter_modular/flutter_modular.dart';

import '../_core/routes_names.dart';
import '../home/home_screen.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(AppRoutes.home, child: (contextx) => const HomeScreen());
    super.routes(r);
  }
}
