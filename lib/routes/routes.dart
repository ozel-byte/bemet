import 'package:bemet/pages/AddInsumo.dart';
import 'package:bemet/pages/AddMedical.dart';
import 'package:bemet/pages/Login.dart';
import 'package:bemet/pages/Menu.dart';
import 'package:bemet/pages/MenuAdmin.dart';
import 'package:bemet/pages/PageExitAccount.dart';
import 'package:bemet/pages/item.dart';
import 'package:bemet/pages/search.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static String initRoute = "login";

  static Map<String, Widget Function(BuildContext)> routes = {
    "menu": (_) => const Menu(),
    "menu-admin": (_) => const MenuAdmin(),
    "login": (_) => const Login(),
    "item": (_) => const ViewItem(),
    "search": (_) => const ViewSearch(),
    "add-medical": (_) => const AddMedical(),
    "add-insumo": (_) => const AddInsumo(),
    "exit-session": (_) => const ExitAccount()
  };
}
