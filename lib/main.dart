import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';

import 'app.dart';
import 'counter_observer.dart';

void main() {
  Bloc.observer = CounterObserver();
  runApp(
    const CounterApp(),
  );
}
