import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Weather',
            style: TextStyle(color: Colors.black87),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
          iconTheme: const IconThemeData(color: Colors.black54),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
            )
          ],
        ),
        body: _buildBody(),
      ),
    );
  }
}

//Body widget built for "Material App"
Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: [
        _headerImage(),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _weatherDiscription(),
                const Divider(),
                _tempreture(),
                const Divider(),
                _tempretureForecast(),
                const Divider(),
                _footerRatings(),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

// Image Widget built for Widget "_buildBody"
Image _headerImage() {
  return const Image(
    image: NetworkImage(
        'https://img4.goodfon.ru/original/800x480/e/c5/priroda-oblaka-solnyshko-iasnaia-pogoda.jpg'),
    fit: BoxFit.cover,
  );
}

//Weather description text widget for "_buildBody"
Column _weatherDiscription() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: const [
      Text(
        'Tuesday - May 22',
        style: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      Divider(),
      Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque odio ligula, sagittis ut mi vel, tincidunt porttitor urna. Proin eu pretium diam. Curabitur gravida diam volutpat, fermentum nunc nec, accumsan odio.',
        style: TextStyle(color: Colors.black45),
      ),
    ],
  );
}

Row _tempreture() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Icon(
            Icons.wb_sunny,
            color: Colors.yellow,
          ),
        ],
      ),
      const SizedBox(
        width: 16,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text(
                '15 Degrees',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ],
          ),
          Row(
            children: const [
              Text(
                'Naples, FL',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

Wrap _tempretureForecast() {
  return Wrap(
    spacing: 10.0,
    children: List.generate(7, (int index) {
      return Chip(
        label: Text(
          '${index + 20} C',
          style: const TextStyle(fontSize: 15),
        ),
        avatar: const Icon(
          Icons.wb_cloudy,
          color: Colors.blue,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: const BorderSide(color: Colors.grey),
        ),
        backgroundColor: Colors.grey.shade100,
      );
    }),
  );
}

Row _footerRatings() {
  var stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: const [
      Icon(
        Icons.star,
        size: 15.0,
        color: Color.fromRGBO(253, 216, 53, 1),
      ),
      Icon(
        Icons.star,
        size: 15.0,
        color: Color.fromRGBO(253, 216, 53, 1),
      ),
      Icon(
        Icons.star,
        size: 15.0,
        color: Color.fromRGBO(253, 216, 53, 1),
      ),
      Icon(
        Icons.star,
        size: 15.0,
        color: Color.fromRGBO(22, 19, 5, 1),
      ),
      Icon(
        Icons.star,
        size: 15.0,
        color: Color.fromRGBO(19, 17, 7, 1),
      ),
    ],
  );
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      const Text(
        'Info from Weather Map',
        style: TextStyle(fontSize: 15.0),
      ),
      stars,
    ],
  );
}
