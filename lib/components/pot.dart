import 'package:flame/extensions.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';

class PotBody extends BodyComponent {
  final Vector2 position;

  PotBody({required this.position});

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      type: BodyType.static,
      position: position,
    );

    final potBody = world.createBody(bodyDef);

    // Bartan ki deewarein
    final floor = EdgeShape()..set(Vector2(-10, 0), Vector2(10, 0));
    final leftWall = EdgeShape()..set(Vector2(-10, 0), Vector2(-10, 20));
    final rightWall = EdgeShape()..set(Vector2(10, 0), Vector2(10, 20));

    potBody.createFixture(FixtureDef(floor));
    potBody.createFixture(FixtureDef(leftWall));
    potBody.createFixture(FixtureDef(rightWall));

    return potBody;
  }

  // Deewaron ko screen par draw karenge (sirf dekhne ke liye)
  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;

    for (final fixture in body.fixtures) {
      final shape = fixture.shape as EdgeShape;
      canvas.drawLine(
        shape.vertex1.toOffset(),
        shape.vertex2.toOffset(),
        paint,
      );
    }
  }
}
