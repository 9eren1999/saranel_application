import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AkisPage extends StatefulWidget {
  @override
  _AkisPageState createState() => _AkisPageState();
}

class _AkisPageState extends State<AkisPage> {
  final CollectionReference posts =
      FirebaseFirestore.instance.collection('postlar');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Akış')),
      body: StreamBuilder(
        stream: posts.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final data = snapshot.requireData;

          return ListView.builder(
            itemCount: data.docs.length,
            itemBuilder: (context, index) {
              final post = data.docs[index].data() as Map<String, dynamic>;
              final isVideo = post['isVideo'] ?? false;

              return Card(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(post['avatarUrl'] ?? ''),
                      ),
                      title: Text(post['isim'] ?? ''),
                      subtitle: Text(post['soyisim'] ?? ''),
                    ),
                    isVideo
                        ? Container(
                            width: double.infinity,
                            height: 100,
                            color: Colors.black,
                            child: Center(
                                child: Icon(Icons.play_arrow,
                                    color: Colors.white, size: 50)))
                        : Image.network(post['imageUrl'] ?? ''),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(post['yorum'] ?? ''),
                    ),
                    _buildCommentsSection(post),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildCommentsSection(Map<String, dynamic> post) {
    List<dynamic> comments = post['yorumlar'] ?? [];

    return ExpansionTile(
      title: Text('Yorumlar (${comments.length})'),
      children: comments.map((comment) {
        if (comment is Map<String, dynamic>) {
          return ListTile(
            title: Text(comment['isim'] ?? ''),
            subtitle: Text(comment['yorum'] ?? ''),
          );
        } else {
          return SizedBox.shrink();
        }
      }).toList(),
    );
  }
}
