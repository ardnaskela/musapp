import 'package:flutter/material.dart';
import 'package:musapp/services/firestore.dart';
import 'package:musapp/services/models.dart';
import 'package:musapp/shared/bottom_bar.dart';
import 'package:musapp/shared/loading.dart';
import 'package:provider/provider.dart';

class RoutesScreen extends StatelessWidget {
  const RoutesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FirestoreService>(context);
    var museo = provider.museo;
    var routes = museo?.percorsi ?? [];

    if (routes.isEmpty) {
      return const LoadingScreen();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Topics"),
      ),
      //drawer: PercorsoDrawer(topics: topics),
      body: Center(
        child: GridView.extent(
          primary: false,
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          crossAxisSpacing: 10.0,
          maxCrossAxisExtent: 500.0,
          children: routes
              .map((percorso) => PercorsoItem(percorso: percorso))
              .toList(),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class PercorsoScreen extends StatelessWidget {
  final Percorso percorso;
  const PercorsoScreen({super.key, required this.percorso});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: ListView(children: [
        Hero(
            tag: percorso.immagine ?? '',
            child: Image.network(percorso.imgUrl!,
                width: MediaQuery.of(context).size.width)),
        Text(percorso.titolo!,
            style: const TextStyle(
                height: 2, fontSize: 20, fontWeight: FontWeight.bold)),
      ]),
    );
  }
}

class PercorsoItem extends StatelessWidget {
  final Percorso percorso;
  const PercorsoItem({super.key, required this.percorso});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: percorso.immagine ?? '',
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    PercorsoScreen(percorso: percorso),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 3,
                child: SizedBox(
                  child: Image.network(percorso.imgUrl ?? ''),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(percorso.titolo ?? '',
                      style: const TextStyle(
                          height: 1.5, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.fade,
                      softWrap: false),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
