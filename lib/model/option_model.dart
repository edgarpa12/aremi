import 'package:flutter/material.dart';

class Option {
  Icon icon;
  String title;
  String subtitle;

  Option({this.icon, this.title, this.subtitle});
}

final options = [
  Option(
    icon: Icon(Icons.settings, size: 40.0),
    title: "Cambiar contraseña",
    subtitle: "Lorem ipsum dolor sit amet, consect.",
  ),
  Option(
    icon: Icon(Icons.notifications, size: 40.0),
    title: "Notificaciones",
    subtitle: "Lorem ipsum dolor sit amet, consect.",
  ),
  Option(
    icon: Icon(Icons.phone, size: 40.0),
    title: "Contacto Aremi",
    subtitle: "Lorem ipsum dolor sit amet, consect.",
  ),
  Option(
    icon: Icon(Icons.book, size: 40.0),
    title: "Manual de usuario",
    subtitle: 'Lorem ipsum dolor sit amet, consect.',
  ),
];