import 'package:flutter/material.dart';
import 'package:kampus_indonesia/data.dart';

class DetailScreen extends StatelessWidget {
  final DaftarKampus kampus;

  const DetailScreen({super.key, required this.kampus});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Perguruan Tinggi"),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 800) {
            return DetailMobile(kampus: kampus);
          } else {
            return DetailWeb(kampus: kampus);
          }
        },
      ),
    );
  }
}

class DetailMobile extends StatelessWidget {
  final DaftarKampus kampus;

  const DetailMobile({super.key, required this.kampus});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Image.asset(kampus.imageAsset, width: 300, height: 300),
              const SizedBox(height: 16),
              Card(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        kampus.name,
                        style: const TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        kampus.description,
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailWeb extends StatelessWidget {
  final DaftarKampus kampus;

  const DetailWeb({super.key, required this.kampus});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                          child: Image.asset(kampus.imageAsset,
                              width: 500, height: 500),
                        ),
                      ],
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                      child: Card(
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                kampus.name,
                                style: const TextStyle(
                                  fontSize: 30.0,
                                ),
                              ),
                              Text(
                                'Lokasi: ${kampus.location}',
                              ),
                              const SizedBox(height: 8.0),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(
                                  kampus.description,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
