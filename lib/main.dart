import 'package:cry/common/application_context.dart';
import 'package:cry/constants/cry_constant.dart';
import 'package:cry/generated/l10n.dart' as cryS;
import 'package:cry/routes/cry_route_Information_parser.dart';
import 'package:flutter/material.dart';
import 'package:cry/cry.dart';
import 'package:flutter_admin/common/cry_dio_interceptors.dart';
import 'package:flutter_admin/pages/layout/layout.dart';
import 'package:flutter_admin/pages/layout/layout_controller.dart';
import 'package:flutter_admin/pages/login.dart';
import 'package:flutter_admin/pages/register.dart';
import 'package:flutter_admin/utils/utils.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'generated/l10n.dart';
import 'router/main_router_delegate.dart';

void main() async {
  await GetStorage.init();
  await ApplicationContext.instance.init();
  loadBean();
  Get.put(LayoutController());

  runApp(MyApp());
}

loadBean() {
  ApplicationContext.instance.addBean(CryConstant.KEY_DIO_INTERCEPTORS, [CryDioInterceptors()]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, Widget> pageMap = {
      '/': Layout(),
      '/login': Login(),
      '/register': Register(),
    };
    return GetMaterialApp.router(
      key: UniqueKey(),
      builder: Cry.init,
      debugShowCheckedModeBanner: false,
      title: 'FLUTTER_ADMIN',
      enableLog: false,
      theme: Utils.getThemeData(),
      darkTheme: Utils.getThemeData(isDark: true),
      localizationsDelegates: [
        S.delegate,
        cryS.S.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      routerDelegate: MainRouterDelegate(pageMap: pageMap),
      routeInformationParser: CryRouteInformationParser(),
    );
  }
}
