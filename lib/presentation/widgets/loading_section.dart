
import 'package:flutter/material.dart';

class LoadingSection extends StatelessWidget {
  const LoadingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
