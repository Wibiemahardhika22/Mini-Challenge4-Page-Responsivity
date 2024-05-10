// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:kampus_indonesia/data.dart';
import 'package:kampus_indonesia/pages/detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Perguruan Tinggi di Indonesia'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            return const HomeKampusMobile();
          } else if (constraints.maxWidth < 1200) {
            return const HomeKampusWeb(gridCount: 2);
          } else {
            return const HomeKampusWeb(gridCount: 4);
          }
        },
      ),
    );
  }
}

class HomeKampusMobile extends StatelessWidget {
  const HomeKampusMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final DaftarKampus kampus = daftarKampusList[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(kampus: kampus);
            }));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    kampus.imageAsset,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            kampus.name,
                            style: const TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(kampus.location)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      itemCount: daftarKampusList.length,
    );
  }
}

class HomeKampusWeb extends StatelessWidget {
  final int gridCount;
  const HomeKampusWeb({super.key, required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: GridView.count(
        crossAxisCount: gridCount,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: daftarKampusList
            .map((kampus) => InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailScreen(kampus: kampus);
                    }));
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Image.asset(
                          kampus.imageAsset,
                          fit: BoxFit.cover,
                        )),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            kampus.name,
                            style: const TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 8.0, bottom: 8.0),
                          child: Text(kampus.location),
                        )
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    ));
  }
}
