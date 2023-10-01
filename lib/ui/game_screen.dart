import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transform_event/bloc/free_game_bloc.dart';
import 'package:transform_event/model/enum_model.dart';

class GameNameScreen extends StatelessWidget {
  const GameNameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('free game url'),centerTitle: true,),
      body: const GameNameWidget(),
    );
  }
}

class GameNameWidget extends StatelessWidget {
  const GameNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<FreeGameBloc>().state;
    switch (state.status) {
      case Status.initial:
      // TODO: Handle this case.
      case Status.loading:
        return const Center(
          child: Text('loding.....'),
        );
      case Status.success:
        return SizedBox(
          child: ListView(
            children: [
              ...List.generate(state.gameModel.length, (index) {
                final data = state.gameModel[index];
                debugPrint('=======${data.freetogameProfileUrl}');
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.teal, width: 2),
                      ),
                      child: CachedNetworkImage(
                        height: height / 3,
                        width: width / 1,
                        imageUrl: data.thumbnail,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('game name: ${data.title}'),
                        Text('game id: ${data.id.toString()}'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('game genre: ${data.genre}'),
                        Text(data.platform),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text('game publisher: ${data.publisher}'),
                    const SizedBox(height: 5),
                    Text('game developer: ${data.developer}'),
                    const SizedBox(height: 5),
                    Text(
                        'release data: ${data.releaseDate.toString().substring(0, 10)}'),
                    const SizedBox(height: 5),
                    TextButton(
                        onPressed: () {
                          launchInBrowser(Uri.parse(data.gameUrl ?? ''));
                        },
                        child: Text(
                          'game url: ${data.gameUrl}',
                          maxLines: 1,
                        )),
                    const SizedBox(height: 5),
                    TextButton(
                        onPressed: () {
                          launchInBrowser(
                              Uri.parse(data.freetogameProfileUrl ?? ''));
                        },
                        child: Text(
                          'game profile url: ${data.freetogameProfileUrl}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )),
                  ],
                );
              })
            ],
          ),
        );
      case Status.error:
        return Center(
          child: Text(state.errorText),
        );
    }
  }
}
