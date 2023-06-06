import 'dart:io';

import 'package:flutter/material.dart';

class VaccineCertificateImage extends StatelessWidget {
  final File image;
  final String? imageUrl;
  const VaccineCertificateImage({
    super.key,
    required this.image,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: const BoxDecoration(),
              child: imageUrl == null
                  ? Image.file(
                      image,
                      fit: BoxFit.cover,
                    )
                  : Image.network(imageUrl ?? ''),
            ),
            Container(
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: Colors.grey.shade200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(image.path.split('/').last),
                  const Icon(Icons.delete),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
