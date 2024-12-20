import 'package:fashionista/app/modules/home/views/add_product.dart';

import '../modules/home/views/home_view.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.home;

  static final routes = {
    AppRoutes.home: (context) => HomeView(),
    AppRoutes.add: (context) => AddProductView(),
  };
}
