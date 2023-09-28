import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  String? username;
  bool _isLoading = true;
  bool showAllComments = false;
  int shownCommentsLimit = 1;
  String currentUsername = "KullanicininAdi";

  String? selectedImagePath;

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _postController = TextEditingController();
  TextEditingController _commentController = TextEditingController();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final picker = ImagePicker();

  Future<void> _selectImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        selectedImagePath = pickedFile.path;
      });
    } else {
      print('Görsel seçilmedi.');
    }
  }

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username');
      _isLoading = false;
    });
    if (username == null) {
      _showUsernameDialog();
    }
  }

  Future<void> _saveUsername(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    setState(() {
      this.username = username;
    });
  }

  void _showImageFullScreen(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: GestureDetector(
          onTap: () => Navigator.of(context)
              .pop(), // Resme tekrar tıklandığında diyaloğu kapat
          child: Image.network(
            imageUrl,
            fit: BoxFit.contain,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }

  Future<String?> uploadImage(File imageFile, String storagePath) async {
    final storageReference = FirebaseStorage.instance.ref().child(storagePath);
    UploadTask uploadTask = storageReference.putFile(imageFile);
    TaskSnapshot snapshot = await uploadTask.whenComplete(() => {});
    String? downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl; // Bu kısım önemli. Görselin URL'sini döndürmeli.
  }

  Future<bool> isUsernameAvailable(String username) async {
    final result = await FirebaseFirestore.instance
        .collection('users')
        .where('username', isEqualTo: username)
        .limit(1)
        .get();

    return result.docs.isEmpty;
  }

  Future<void> saveUsername(String username) async {
    final docRef = FirebaseFirestore.instance
        .collection('users')
        .doc('gDseWoqVvlVEiKtqNKfE');
    final doc = await docRef.get();

    if (!doc.exists) {
      await docRef.set({'id1': username});
      return;
    }

    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    int currentID = data.keys.where((key) => key.startsWith("id")).length + 1;

    await docRef.set(
        {
          'id$currentID': username,
        },
        SetOptions(
            merge:
                true)); // Bu kısım mevcut belgeyle birleştirme yapmamızı sağlar.
  }

  Future<void> deleteComment(String postId, String commentId) async {
    try {
      await _firestore
          .collection('forum')
          .doc(postId)
          .collection('comments')
          .doc(commentId)
          .delete();
    } catch (error) {
      print("Error deleting comment: $error");
    }
  }

  void _showUsernameDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () async {
              // Kullanıcı adı belirlenmemişse anasayfaya yönlendir.
              if (username == null) {
                Navigator.pushReplacementNamed(context, "/");
                return false; // Geri tuşunun default davranışını engelle.
              }
              return true; // Geri tuşunun default davranışına izin ver.
            },
            child: AlertDialog(
              backgroundColor: Colors.blue.shade800,
              title: Text(
                "Kullanıcı Adı Belirleyin",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              content: SingleChildScrollView(
                // Eklediğimiz kısım
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "• Forum sayfasına erişebilmek için bir kullanıcı adı belirlemelisiniz. "
                      "\n• Belirlediğiniz kullanıcı adı, uygulama verilerini silmediğiniz sürece kullanılabilecektir. "
                      "\n• Bir daha kullanıcı adı değişikliği yapamayacağınızı hatırlatırız.",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _usernameController,
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white, // Yanıp sönen çizginin rengi
                      decoration: InputDecoration(
                        hintText: "Kullanıcı Adınızı Girin",
                        hintStyle: TextStyle(
                          color: Colors.white70,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        prefixIcon: IconButton(
                          icon: Icon(Icons.restart_alt_rounded,
                              color: Colors
                                  .white), // Örnek olarak shuffle iconu kullandım. İsterseniz farklı bir icon kullanabilirsiniz.
                          onPressed: () {
                            String randomUsername = "SaranelKullanıcısı" +
                                (100 + Random().nextInt(99900)).toString();
                            _usernameController.text =
                                randomUsername; // TextField'a random kullanıcı adını ata
                          },
                        ),
                        helperText:
                            "Kullanıcı adı bulamadıysanız 🔄 icona tıklayarak \nrastgele bir kullanıcı adı oluşturabilirsiniz.",
                        helperStyle:
                            TextStyle(color: Colors.white70, fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                    child: Text(
                      "Kaydet",
                      style: TextStyle(color: Colors.blue.shade800),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: () async {
                      if (await isUsernameAvailable(_usernameController.text)) {
                        await saveUsername(_usernameController.text);
                        _saveUsername(_usernameController.text);
                        Navigator.of(context).pop();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Bu kullanıcı adı zaten kullanılıyor."),
                          backgroundColor: Colors.red,
                        ));
                      }
                    })
              ],
            ));
      },
    );
  }

  Future<void> addComment(String postId, String commentText) async {
    setState(() {
      _isLoading = true; // Yüklenme başladı
    });

    try {
      // Firebase'e yorum ekleme işlemini gerçekleştir
      await _firestore
          .collection('forum')
          .doc(postId)
          .collection('comments')
          .add({
        'text': commentText,
        'timestamp': Timestamp.now(),
        'username': username,
        'postId': postId,
        'isEdited': false
      });

      _commentController.clear(); // Bu satırı ekleyin.
    } catch (error) {
      // Hata oluştuğunda burası çalışır
      print("Error adding comment: $error");
    } finally {
      setState(() {
        _isLoading = false; // Yüklenme bitti
      });
    }
  }

  void _showDeleteConfirmationDialog(DocumentSnapshot data) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Gönderiyi sil?'),
          content: Text('Bu gönderiyi silmek istediğinizden emin misiniz?'),
          actions: <Widget>[
            TextButton(
              child: Text('İptal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Sil'),
              onPressed: () async {
                await _firestore.collection('forum').doc(data.id).delete();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showDeleteCommentDialog(String postId, String commentId) async {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // Kullanıcının dialog dışına tıklamasıyla kapanmaması için
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Yorumu Sil'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Bu yorumu silmek istediğinize emin misiniz?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('İptal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Sil'),
              onPressed: () {
                deleteComment(
                    postId, commentId); // Yorum silme fonksiyonunu çağırıyoruz
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Color getRandomColor() {
    final random = Random();

    // Blue.shade600 üzerinde okunabilir renk tonları listesi
    List<Color> colors = [
      Colors.green.shade300,
      Colors.green.shade400,
      Colors.yellow.shade300,
      Colors.yellow.shade400,
      Colors.red.shade300,
      Colors.red.shade200,
      Colors.cyan.shade300,
      Colors.cyan.shade400,
      Colors.pink.shade200,
      Colors.orange.shade300,
      const Color.fromARGB(255, 231, 190, 238),
      Colors.lime.shade300,
      Colors.teal.shade200,
      Colors.amber.shade300,
      Colors.indigo.shade100,
      Colors.deepOrange.shade200,
    ];

    return colors[random.nextInt(colors.length)];
  }

  String timeAgo(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inMinutes < 1) {
      return '1 dakika önce';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} dakika önce';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} saat önce';
    } else if (difference.inDays < 30) {
      return '${difference.inDays} gün önce';
    } else if (difference.inDays < 365) {
      int months = difference.inDays ~/ 30;
      return '$months ay önce';
    } else {
      int years = difference.inDays ~/ 365;
      return '$years yıl önce';
    }
  }

  Future<int> getTotalComments(String postId) async {
    var query = await _firestore
        .collection('forum')
        .doc(postId)
        .collection('comments')
        .get();
    return query.docs.length;
  }

  Future<void> _addPostToFirebase() async {
    if (_postController.text.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });

      String? resimUrl;

      if (selectedImagePath != null) {
        // Görseli Firebase Storage'a yükle
        String storagePath = "forum_images/${DateTime.now().toIso8601String()}";
        resimUrl = await uploadImage(File(selectedImagePath!), storagePath);
      }

      try {
        await _firestore.collection('forum').add({
          'adsoyad': username,
          'aciklama': _postController.text,
          'eklenme_tarihi': DateTime.now().toIso8601String(),
          'resimUrl':
              resimUrl, // Eğer bir görsel seçilmediyse, bu alan null olacak.
        });

        _postController.clear();

        setState(() {
          selectedImagePath = null;
        });
      } catch (e) {
        print("Hata oluştu: $e");
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Widget _loadingIndicator() {
    if (!_isLoading) return SizedBox.shrink();
    return Container(
      color: Colors.black.withOpacity(0.4),
      child: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        // appBar: AppBar(
        //   title: Text(
        //     "Saranel Forum",
        //     style:
        //         GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w800),
        //   ),
        //   leading: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: Icon(
        //       Icons.arrow_back_ios_sharp,
        //       color: Colors.blue.shade800,
        //       size: 19,
        //     ),
        //   ),
        // ),
        body: Stack(fit: StackFit.expand, children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 50),
              Card(
                margin: EdgeInsets.all(10.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      if (selectedImagePath != null)
                        Image.file(
                          File(selectedImagePath!),
                          height: 140,
                          width: 90,
                          fit: BoxFit.cover,
                        ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _postController,
                              decoration: InputDecoration(
                                hintText: selectedImagePath == null
                                    ? 'Aklına takılan bir şey mi var? Hemen sor...'
                                    : 'Açıklama ekleyin...',
                                hintStyle: TextStyle(fontSize: 12),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.add_a_photo,
                                color: Colors.blue.shade800),
                            onPressed: _selectImage,
                          ),
                          IconButton(
                            icon: Icon(Icons.send, color: Colors.blue.shade800),
                            onPressed: _addPostToFirebase,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: StreamBuilder<QuerySnapshot>(
                        stream: _firestore.collection('forum').snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            );
                          }
                          return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              var data = snapshot.data!.docs[index];
                              var postId = snapshot.data!.docs[index].id;
                              bool hasImageUrl =
                                  (data.data() as Map<String, dynamic>)
                                      .containsKey('resimUrl');

                              return Column(children: [
                                Card(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 12),
                                    color: Colors.blue.shade600,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.all(20),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "${data['adsoyad']}",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    255),
                                                          ),
                                                        ),
                                                        Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                timeAgo(DateTime
                                                                    .parse(data[
                                                                        'eklenme_tarihi'])),
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 10,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          253,
                                                                          253,
                                                                          253),
                                                                ),
                                                              ),
                                                              if (data[
                                                                      'adsoyad'] ==
                                                                  username)
                                                                Container(
                                                                  height: 16.0,
                                                                  child:
                                                                      IconButton(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero, // IconButton için ekstra boşlukları kaldırın
                                                                    icon: Icon(
                                                                        Icons
                                                                            .delete,
                                                                        size:
                                                                            17,
                                                                        color: Colors
                                                                            .white),
                                                                    onPressed:
                                                                        () {
                                                                      _showDeleteConfirmationDialog(
                                                                          data);
                                                                    },
                                                                  ),
                                                                ),
                                                            ]),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10),
                                                      child: Column(
                                                        children: [
                                                          if (hasImageUrl &&
                                                              data['resimUrl'] !=
                                                                  null)
                                                            InkWell(
                                                              onTap: () {
                                                                _showImageFullScreen(
                                                                    context,
                                                                    data[
                                                                        'resimUrl']);
                                                              },
                                                              child: Padding(
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        1.0),
                                                                child: Image
                                                                    .network(
                                                                  data[
                                                                      'resimUrl'],
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  width: double
                                                                      .infinity,
                                                                ),
                                                              ),
                                                            ),
                                                          SizedBox(height: 2),
                                                          Text(
                                                            data['aciklama'],
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100,
                                                              fontSize: 12,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      255,
                                                                      255,
                                                                      255),
                                                            ),
                                                          ),
                                                          Divider(
                                                            thickness: 0.5,
                                                            color: Colors
                                                                .blue.shade100,
                                                          ),
                                                          TextField(
                                                            controller:
                                                                _commentController,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  'Yorum yap...',
                                                              hintStyle:
                                                                  TextStyle(
                                                                color: Colors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.6),
                                                                fontSize: 11,
                                                              ),
                                                              suffixIcon:
                                                                  IconButton(
                                                                icon: Icon(
                                                                    Icons.send,
                                                                    color: Colors
                                                                        .white),
                                                                onPressed: () {
                                                                  addComment(
                                                                      postId,
                                                                      _commentController
                                                                          .text);
                                                                },
                                                              ),
                                                              enabledBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          62,
                                                                          255,
                                                                          255,
                                                                          255),
                                                                ),
                                                              ),
                                                              focusedBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          FutureBuilder<int>(
                                                              future:
                                                                  getTotalComments(
                                                                      postId),
                                                              builder: (context,
                                                                  totalCommentsSnapshot) {
                                                                if (!totalCommentsSnapshot
                                                                    .hasData) {
                                                                  return SizedBox
                                                                      .shrink(); // Eğer henüz yorum sayısı yüklenmediyse boş bir widget döndür.
                                                                }

                                                                int totalComments =
                                                                    totalCommentsSnapshot
                                                                        .data!;

                                                                return StreamBuilder<
                                                                        QuerySnapshot>(
                                                                    stream: _firestore
                                                                        .collection('forum')
                                                                        .doc(postId)
                                                                        .collection('comments')
                                                                        .orderBy('timestamp', descending: true)
                                                                        .limit(showAllComments ? shownCommentsLimit : 1)
                                                                        // Eğer tüm yorumları göstermek istiyorsak 4 yorum getir, değilse sadece 1 yorum getir
                                                                        .snapshots(),
                                                                    builder: (context, commentSnapshot) {
                                                                      if (!commentSnapshot
                                                                          .hasData) {
                                                                        return SizedBox
                                                                            .shrink();
                                                                      }
                                                                      return Column(
                                                                          children: [
                                                                            // Yorumları gösteren bölüm:
                                                                            Container(
                                                                              height: (commentSnapshot.data!.docs.length <= 4) ? null : 250, // Eğer yorum sayısı 4'ten fazla ise 200 piksel yükseklik tanımlıyoruz, bu da 4 yorumun gösterilmesine yetiyor.
                                                                              child: ListView.builder(
                                                                                shrinkWrap: true,
                                                                                physics: (commentSnapshot.data!.docs.length <= 4) ? NeverScrollableScrollPhysics() : AlwaysScrollableScrollPhysics(), // Eğer yorum sayısı 4'ten fazla ise kaydırma işlevini aktifleştiriyoruz.
                                                                                itemCount: showAllComments ? commentSnapshot.data!.docs.length : min(commentSnapshot.data!.docs.length, 1),
                                                                                // Sadece ilk yorumu gösteriyoruz.
                                                                                itemBuilder: (context, commentIndex) {
                                                                                  var commentData = commentSnapshot.data!.docs[commentIndex];
                                                                                  return Column(
                                                                                    children: [
                                                                                      ListTile(
                                                                                        title: Row(
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Text(
                                                                                                commentData['username'],
                                                                                                style: TextStyle(
                                                                                                  fontSize: 10,
                                                                                                  color: getRandomColor(),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            if (commentData['username'] == username) // Yorumu ekleyen kullanıcı, şu anki kullanıcı mı kontrolü
                                                                                              IconButton(
                                                                                                icon: Icon(Icons.delete, color: Colors.white, size: 16),
                                                                                                onPressed: () {
                                                                                                  // Silme işlemini burada gerçekleştir
                                                                                                  _showDeleteCommentDialog(postId, commentData.id); // Yorumun id'sini gönderiyoruz
                                                                                                },
                                                                                              ),
                                                                                            Text(
                                                                                              "${timeAgo(commentData['timestamp'].toDate())}",
                                                                                              style: TextStyle(
                                                                                                fontSize: 10,
                                                                                                color: Colors.white,
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        subtitle: Text(
                                                                                          commentData['text'],
                                                                                          style: TextStyle(fontSize: 12, color: Colors.white),
                                                                                        ),
                                                                                      ),
                                                                                      Divider(
                                                                                        color: Colors.white24,
                                                                                        height: 1.0,
                                                                                        thickness: 0.5,
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                            // Tüm yorumları gösteren buton:
                                                                            if (totalComments >
                                                                                shownCommentsLimit)
                                                                              TextButton(
                                                                                child: Text(
                                                                                  showAllComments ? "Yorumları gizle" : "Daha fazla yorum görüntüle (${min(totalComments, shownCommentsLimit + 4)} yorum)",
                                                                                  style: TextStyle(color: Colors.white, fontSize: 10),
                                                                                ),
                                                                                onPressed: () {
                                                                                  setState(() {
                                                                                    if (showAllComments) {
                                                                                      shownCommentsLimit = 1;
                                                                                      showAllComments = false;
                                                                                    } else {
                                                                                      shownCommentsLimit += 4;

                                                                                      if (shownCommentsLimit >= totalComments) {
                                                                                        showAllComments = true;
                                                                                      }
                                                                                    }
                                                                                  });
                                                                                },
                                                                              )
                                                                          ]);
                                                                    });
                                                              })
                                                        ],
                                                      ),
                                                    )
                                                  ]))
                                        ]))
                              ]);
                            },
                          );
                        },
                      ),
                    ),
                    _loadingIndicator(), // Burada _loadingIndicator fonksiyonunu çağırıyoruz
                  ],
                ),
              )
            ],
          )
        ]));
  }
}
