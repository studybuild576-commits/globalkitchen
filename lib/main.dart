import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:globalkitchen/components/pot.dart';

void main() {
  runApp(
    GameWidget(game: GlobalKitchenGame()),
  );
}

class GlobalKitchenGame extends Forge2DGame {
  late final Vector2 screenCenter;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    screenCenter = size / 2;

    // Camera ko set karenge taaki game aaram se dikhe
    camera.viewfinder.position = Vector2(0, 0);
    camera.viewfinder.zoom = 15.0;

    // PotBody component ko game mein add kiya
    add(PotBody(position: Vector2(0, -screenCenter.y / 4)));
  }
}
