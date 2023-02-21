import 'package:flutter/material.dart';

textfield({required hintText, required controllar}) {
  return TextField(
    decoration: InputDecoration(
        hintText: 'Enter Name',
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        fillColor: Colors.transparent,
        filled: true),
    style: const TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
    ),
    controller: controllar,
  );
}
