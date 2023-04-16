import 'package:flutter/material.dart';

class Photo {
  String title;
  String description;
  String imageUrl;
  int likes;

  Photo(
      {required this.title,
      required this.description,
      required this.imageUrl,
      this.likes = 0});
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Photo> photos = [
    Photo(
        title: 'Foto 1',
        description: 'Esta é a primeira foto',
        imageUrl: 'assets/foto1.jpg'),
    Photo(
        title: 'Foto 2',
        description: 'Esta é a segunda foto',
        imageUrl:
            'https://images.unsplash.com/photo-1613277242560-4251aa5c5e5a'),
    Photo(
        title: 'Foto 3',
        description: 'Esta é a terceira foto',
        imageUrl:
            'https://images.unsplash.com/photo-1613277649548-c35b902064c1'),
    Photo(
        title: 'Foto 4',
        description: 'Esta é a quarta foto',
        imageUrl:
            'https://images.unsplash.com/photo-1613277400185-f63b5f03e5e5'),
    Photo(
        title: 'Foto 5',
        description: 'Esta é a quinta foto',
        imageUrl:
            'https://images.unsplash.com/photo-1613361391988-8ce5d1d05a5b'),
  ];

  void _likePhoto(int index) {
    setState(() {
      photos[index].likes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galeria de Fotos'),
      ),
      body: ListView.builder(
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Image.network(photos[index].imageUrl),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        photos[index].title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(height: 8),
                      Text(
                        photos[index].description,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.thumb_up),
                            onPressed: () {
                              _likePhoto(index);
                            },
                          ),
                          Text(photos[index].likes.toString())
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galeria de Fotos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

void main() {
  runApp(MyApp());
}
