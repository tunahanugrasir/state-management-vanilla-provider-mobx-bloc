import 'package:flutter/material.dart';

class ProjectInputs extends InputDecoration {
  const ProjectInputs(String hint, String label)
      : super(
          border: const OutlineInputBorder(),
          hintText: hint,
          labelText: label,
        );
}
