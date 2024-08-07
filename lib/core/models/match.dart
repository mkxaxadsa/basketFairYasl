import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class MatchModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name1;
  @HiveField(2)
  String name2;
  @HiveField(3)
  String score1;
  @HiveField(4)
  String score2;
  @HiveField(5)
  String eventTime;
  @HiveField(6)
  String eventName;
  @HiveField(7)
  String violations1;
  @HiveField(8)
  String violations2;
  @HiveField(9)
  String freeThrows1;
  @HiveField(10)
  String freeThrows2;
  @HiveField(11)
  String fromCenter1;
  @HiveField(12)
  String fromCenter2;
  @HiveField(13)
  String underBasket1;
  @HiveField(14)
  String underBasket2;
  @HiveField(15)
  String substitutions1;
  @HiveField(16)
  String substitutions2;
  @HiveField(17)
  String injuries1;
  @HiveField(18)
  String injuries2;

  MatchModel({
    required this.id,
    required this.name1,
    required this.name2,
    required this.score1,
    required this.score2,
    required this.eventTime,
    required this.eventName,
    required this.violations1,
    required this.violations2,
    required this.freeThrows1,
    required this.freeThrows2,
    required this.fromCenter1,
    required this.fromCenter2,
    required this.underBasket1,
    required this.underBasket2,
    required this.substitutions1,
    required this.substitutions2,
    required this.injuries1,
    required this.injuries2,
  });
}

class MatchModelAdapter extends TypeAdapter<MatchModel> {
  @override
  final typeId = 0;

  @override
  MatchModel read(BinaryReader reader) {
    return MatchModel(
      id: reader.read(),
      name1: reader.read(),
      name2: reader.read(),
      score1: reader.read(),
      score2: reader.read(),
      eventTime: reader.read(),
      eventName: reader.read(),
      violations1: reader.read(),
      violations2: reader.read(),
      freeThrows1: reader.read(),
      freeThrows2: reader.read(),
      fromCenter1: reader.read(),
      fromCenter2: reader.read(),
      underBasket1: reader.read(),
      underBasket2: reader.read(),
      substitutions1: reader.read(),
      substitutions2: reader.read(),
      injuries1: reader.read(),
      injuries2: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, MatchModel obj) {
    writer.write(obj.id);
    writer.write(obj.name1);
    writer.write(obj.name2);
    writer.write(obj.score1);
    writer.write(obj.score2);
    writer.write(obj.eventTime);
    writer.write(obj.eventName);
    writer.write(obj.violations1);
    writer.write(obj.violations2);
    writer.write(obj.freeThrows1);
    writer.write(obj.freeThrows1);
    writer.write(obj.fromCenter1);
    writer.write(obj.fromCenter2);
    writer.write(obj.underBasket1);
    writer.write(obj.underBasket2);
    writer.write(obj.substitutions1);
    writer.write(obj.substitutions2);
    writer.write(obj.injuries1);
    writer.write(obj.injuries2);
  }
}
