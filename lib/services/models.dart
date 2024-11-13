import 'package:json/json.dart';

@JsonCodable()
class Museo {
  final String id;
  final String title;
  final String? description;
  final List<Percorso>? percorsi;

  Museo({
    required this.id,
    required this.title,
    this.description,
    this.percorsi,
  });
}

@JsonCodable()
class Percorso {
  final String id;
  final String titolo;
  final String? durata;
  final String? descrizione;
  final String? immagine;
  String? imgUrl;
  final List<Tappa>? tappe;
  final String? mappa;

  Percorso({
    required this.id,
    required this.titolo,
    this.durata,
    this.descrizione,
    this.immagine,
    this.imgUrl,
    this.tappe,
    this.mappa,
  });
}

@JsonCodable()
class Tappa {
  final String? id;
  final String? titolo;
  final Coordinate? coordinate;
  final Audio? audio;
  final Video? video;
  final Immagine? immagine;
  final Quiz? quiz;

  Tappa({
    this.id,
    this.titolo,
    this.coordinate,
    this.audio,
    this.video,
    this.immagine,
    this.quiz,
  });
}

@JsonCodable()
class Coordinate {
  final double? x;
  final double? y;

  Coordinate({
    this.x,
    this.y,
  });
}

@JsonCodable()
class Audio {
  final String? titolo;
  final String? testo;
  final String link;
  String? url;

  Audio({this.titolo, this.testo, required this.link, this.url});
}

@JsonCodable()
class Video {
  final String? titolo;
  final String link;
  String? url;

  Video({this.titolo, required this.link, this.url});
}

@JsonCodable()
class Immagine {
  final String? titolo;
  final String link;
  String? url;

  Immagine({
    this.titolo,
    required this.link,
    this.url,
  });
}

@JsonCodable()
class Quiz {
  final String titolo;
  final List<Domanda> domande;

  Quiz({
    required this.titolo,
    required this.domande,
  });
}

@JsonCodable()
class Domanda {
  final String testo;
  final List<Risposta> risposte;

  Domanda({
    required this.testo,
    required this.risposte,
  });
}

@JsonCodable()
class Risposta {
  final String testo;
  final bool corretta;

  Risposta({
    required this.testo,
    required this.corretta,
  });
}
