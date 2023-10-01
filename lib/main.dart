import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transform_event/bloc/free_game_bloc.dart';
import 'package:transform_event/model/enum_model.dart';
import 'package:transform_event/repo/repo.dart';
import 'ui/game_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => FreeGameBloc(apiRepository: ApiRepository())..add(GetFreeGame()),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
home: const GameNameScreen(),
      ),
    );
  }
}

