import 'package:flutter/material.dart';
import 'dart:math' as math;

class CenteredElasticOutCurve extends Curve {
  final double period;

  CenteredElasticOutCurve([this.period = 0.4]);

  @override
  double transform(double t) {
    return math.pow(2, -10 * t) * math.sin(t * 2 * math.pi / period) + 0.5;
  }
}

class CenteredElasticInCurve extends Curve {
  final double period;

  CenteredElasticInCurve([this.period = 0.4]);

  @override
  double transform(double t) {
    return -math.pow(2, 10 * (t - 1)) * math.sin((t - 1) * 2 * math.pi / period) + 0.5;
  }
}

class LinearPointCurve extends Curve {
  final double pIn;
  final double pOut;

  LinearPointCurve(this.pIn, this.pOut);

  @override
  double transform(double t) {
    final lowerScale = pOut / pIn;
    final upperScale = (1 - pOut) / (1 - pIn);
    final upperOffset = 1 - upperScale;

    return t < pIn ? t * lowerScale : t * upperScale + upperOffset;
  }
}