import 'package:flutter/material.dart';

const Color backgroundColor = Color(0xFF4A4A58);

 List colorListCartoes = [
  Colors.deepPurpleAccent,
  Colors.deepPurpleAccent[700],
  Colors.deepPurpleAccent[400],
  Colors.deepPurpleAccent[200],
];

int colorsAscendant(int indexColors, List colors) {
  if(indexColors == 0) {
    indexColors = 1;
  } else if (indexColors > 0 && indexColors < (colors.length - 1)) {
    indexColors = indexColors + 1;
  } else if(indexColors == (colors.length - 1)){
    indexColors = 0;
  }
  return indexColors;
}