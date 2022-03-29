import 'package:flutter/material.dart';

abstract class MainPageState<T extends StatefulWidget> extends State<T> {
  @override
  void initState() {
    super.initState();
    this.refreshData();
  }

  refreshData();
}
