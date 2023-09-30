import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saranel_application/settings_screens/platformkurallari.dart';
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
  Map<String, TextEditingController> _commentControllers = {};
  String? expandedPostId; // Hangi postun yorumları genişletildiğini takip eder

  int shownCommentsLimit = 1;
  String currentUsername =
      "KullanicininAdi"; // Bu değeri nereden aldığınıza göre güncelleyin.

  String? selectedImagePath;

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _postController = TextEditingController();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final picker = ImagePicker();
 

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

  Future<QuerySnapshot> getForumData() async {
  QuerySnapshot snapshot = await _firestore.collection('forum')
      .orderBy('eklenme_tarihi', descending: true)
      .get(GetOptions(source: Source.cache));
  
  if (snapshot.docs.isEmpty) {
    snapshot = await _firestore.collection('forum')
        .orderBy('eklenme_tarihi', descending: true)
        .get(GetOptions(source: Source.server));
  }
  
  return snapshot;
}


Widget _buildCommentWidget(String postId, dynamic comment) {
  return Column(
    children: [
      ListTile(
        title: Row(
          children: [
            Expanded(
              child: Text(
                comment['username'],
                style: TextStyle(
                  fontSize: 10,
                  color: getRandomColor(),
                ),
              ),
            ),
            if (comment['username'] == username)
              IconButton(
                icon: Icon(Icons.delete, color: Colors.black87, size: 16),
                onPressed: () {
                  _showDeleteCommentDialog(postId, comment as Map<String, dynamic>);
                },
              ),
            Text(
              "${timeAgo(comment['timestamp'].toDate())}",
              style: TextStyle(
                fontSize: 10,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        subtitle: Text(
          comment['text'],
          style: TextStyle(fontSize: 12, color: Colors.black87),
        ),
      ),
      Divider(
        color: Colors.black26,
        height: 1.0,
        thickness: 0.3,
      ),
    ],
  );
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
void _showPostedDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.blue.shade800,
        title: Text(
          "Gönderin Paylaşıldı", textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Paylaşılan gönderilerin tamamı editörlerimiz tarafından düzenli olarak kontrol edilmektedir. Eğer platform kurallarımıza uymadığını düşündüğümüz bir içerik paylaştıysan, sana haber vermeden gönderini kaldırırız.",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlatformKurallari()),); // platformkurallari sayfasına yönlendirsin
              },
              child: Text(  textAlign: TextAlign.start,
                "Platform kurallarını okumak için tıklayınız.",
                style: TextStyle(
                    color: Colors.amber,
                    fontSize: 12,
                    decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Tamam", style: TextStyle(color: Colors.white)),
          )
        ],
      );
    },
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

  void toggleComments(String postId) {
  if (expandedPostId == postId) {
    // Eğer bu postun yorumları zaten genişletilmişse, genişletmeyi kapat
    setState(() {
      expandedPostId = null;
    });
  } else {
    // Eğer bu postun yorumları genişletilmemişse, genişlet
    setState(() {
      expandedPostId = postId;
    });
  }
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
  TextEditingController getCommentController(String postId) {
  if (!_commentControllers.containsKey(postId)) {
    _commentControllers[postId] = TextEditingController();
  }
  return _commentControllers[postId]!;
}

 Future<void> deleteComment(String postId, Map<String, dynamic> comment) async {
    try {
      await _firestore.collection('forum').doc(postId).update({
        'comments': FieldValue.arrayRemove([comment]),
        'commentCount': FieldValue.increment(-1) // Yorum sayısını azalt
      });
    } catch (error) {
      print("Error deleting comment: $error");
    }
}



void _showPostInput(BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;

  showModalBottomSheet(
  context: context,
  isScrollControlled: true,
  builder: (context) {
   return StatefulBuilder(
  builder: (BuildContext context, StateSetter setModalState) {
    Future<void> _selectImage() async {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setModalState(() {
          selectedImagePath = pickedFile.path;
        });
      } else {
        print('Görsel seçilmedi.');
      }
    }
        return Container(
          height: (screenHeight * 9) / 10,
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween, // elemanları en başta ve sonda tutar
  children: [
    IconButton(
      icon: Icon(Icons.add_a_photo, color: Colors.blue.shade800),
      onPressed: _selectImage,
      splashColor: Colors.blue,
    ),
    Text(
      "Yeni Gönderi Oluştur",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.blue.shade800,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    if (_postController.text.length > 0) // Kontrol
      IconButton(
        icon: Icon(Icons.send, color: Colors.blue.shade800),
        onPressed: () {
          _addPostToFirebase();
          Navigator.pop(context);
          _showPostedDialog(context);
        },
      )
    else
      SizedBox(width: 48,) // Bu, IconButton'ın boşluğunu yer tutucu olarak kullanır, böylece metin ortalanır.
  ],
),
              SizedBox(height: 10),
              TextField(
                controller: _postController,
                onChanged: (value) {
                  setModalState(() {}); // Yeniden inşa eder
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Aklına takılan bir şey mi var? Hemen sor...',
                  hintStyle: TextStyle(fontSize: 12),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue.shade800), // Odaklandığında rengi
                  ),
                ),
                maxLines: null, 
          ), if (selectedImagePath != null)
  Padding(

    padding: const EdgeInsets.only(top: 10.0),
    child: Image.file(
      File(selectedImagePath!),
      height: 100, // İstediğiniz yüksekliği ayarlayabilirsiniz
      width: 80,
      fit: BoxFit.cover,
      
    ),
  ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
              Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlatformKurallari()), ); // platformkurallari sayfasına yönlendirsin
              },
              child: Text(  textAlign: TextAlign.center,
                "Platform paylaşım kurallarını okumak için tıklayınız.",
                style: TextStyle(
                    color: Colors.blue.shade800,
                    fontSize: 12,
                    decoration: TextDecoration.underline),
              ),
            ),], 
),
 // İnput ve iconlar arasında biraz boşluk bırakıyoruz.
          
        );
    });
    },
  
);
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
                      ))    
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
                       String inputUsername = _usernameController.text;

  // Kullanıcı adı uzunluğunu kontrol edin
  if (inputUsername.length < 3 || inputUsername.length > 24) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Kullanıcı adı en az 3, en fazla 24 karakter olabilir."),
      backgroundColor: Colors.red,
    ));
    return;
  }

  if (!RegExp(r'^[a-zA-Z0-9ıİğĞüÜşŞöÖçÇ]+$').hasMatch(inputUsername)) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Kullanıcı adı sadece harf ve rakam içerebilir."),
      backgroundColor: Colors.red,
    ));
    return;
}


  // Diğer kontroller
  if (await isUsernameAvailable(inputUsername)) {
    await saveUsername(inputUsername);
    _saveUsername(inputUsername);
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

   if (commentText.trim().isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Yorum boş olamaz!"),
      backgroundColor: Colors.blue.shade800,
    ));
    setState(() {
        _isLoading = false; // Yüklenme durduruldu
    });
    return;
}



    Map<String, dynamic> newComment = {
      'text': commentText,
      'timestamp': Timestamp.now(),
      'username': username,
      'postId': postId,
      'isEdited': false
    };

    try {
      // Firebase'e yorum ekleme işlemini gerçekleştir
      await _firestore.collection('forum').doc(postId).update({
        'comments': FieldValue.arrayUnion([newComment]),
        'commentCount': FieldValue.increment(1) // Yorum sayısını artır
      });

      

      getCommentController(postId).clear(); // Bu satırı ekleyin.
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

Future<void> _showDeleteCommentDialog(String postId, Map<String, dynamic> commentData) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
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
                deleteComment(postId, commentData); // Yorum silme fonksiyonunu çağırıyoruz
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
      Colors.green.shade500,
      Colors.yellow.shade900,
      Colors.yellow.shade800,
      Colors.red.shade900,
      Colors.red.shade300,
      Colors.cyan.shade900,
      Colors.cyan.shade400,
      Colors.pink.shade600,
      Colors.orange.shade700,
      Color.fromARGB(255, 165, 71, 182),
      Colors.lime.shade900,
      Colors.amber.shade700,
      Colors.blue.shade500,
      Colors.blueGrey,
      Colors.blue.shade900,
      Colors.indigo.shade500,
      Colors.deepOrange.shade900,
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
  var document = await _firestore.collection('forum').doc(postId).get();
  List comments = document.data()?['comments'] ?? [];
  return comments.length;
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
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue.shade800))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Color.fromRGBO(245, 245, 250, 0.959), 
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
      body: Column(
  children: [
    Container(
      height: 90,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      color: Colors.blue.shade800,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Geri butonu
          Padding(
            padding: const EdgeInsets.only(top: 25, right: 16),
            child: IconButton( 
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.white,
                size: 19,
              ),
            ),
          ), 
          // Logo ve Kullanıcı adı için bir Row oluşturduk.
          Row( 
            children: [ 
              // Logo
              Padding( 
                padding: const EdgeInsets.only(top: 25),
                child: Image.asset(
                  'assets/images/appsaranellogo.png',
                  height: 26, // İsterseniz bu değeri değiştirebilirsiniz
                ),
              ),
              SizedBox(width: 10), // Logo ile kullanıcı adı arasında boşluk
              // Kullanıcı Adı
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                  username ?? "Kullanıcı",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          // İconlar için bir Row oluşturduk.
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: IconButton(
                  icon: Icon(Icons.add, color: Colors.white),
                  onPressed: () {
                    _showPostInput(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: IconButton(
                  icon: Icon(Icons.notifications, color: Colors.white),
                  onPressed: () {
                    // Bildirim sayfasını açmak için buraya kod ekleyebilirsiniz.
                  },
                    
                  
                ),
              ),
            ],
          ),
          
        ],
      ),
    ),
      
    

              Expanded(
  child: Column(
    children: [
      Expanded(
        child: FutureBuilder<QuerySnapshot>(
          future: getForumData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              );
            }
            return ListView.builder(
  itemCount: snapshot.data!.docs.length,
  itemBuilder: (context, index) {
    var data = snapshot.data!.docs[index];
    var postId = snapshot.data!.docs[index].id;
    bool hasImageUrl = (data.data() as Map<String, dynamic>).containsKey('resimUrl');


                              return Column(children: [
   Padding(
     padding: const EdgeInsets.only(bottom: 14),
     child: Material(
      elevation: 0, // Gölgenin yüksekliği
      shadowColor: Colors.blue.shade800, // Gölgenin rengi
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.0), // Card'ın köşe yuvarlaklığı
      ), 
      child: Container( 
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
         child: Column( 
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                                            Padding(
                                                padding: const EdgeInsets.all(10), 
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
                                                                  Colors.black,
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
                                                                    color: Colors.black,
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
                                                                              .black),
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
                                                        child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [  Text(
                                                              data['aciklama'],
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100,
                                                                fontSize: 12,
                                                                color: Colors.black,
                                                              ), 
                                                            ), 
                                                            
                                                            SizedBox(height: 2),
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
                                                            Divider(
                                                              thickness: 0.2,
                                                              color: Colors.black,
                                                            ),
                                                           StreamBuilder<DocumentSnapshot>(
  stream: _firestore.collection('forum').doc(postId).snapshots(),
  builder: (context, snapshot) {
    if (!snapshot.hasData) {
      return SizedBox.shrink();
    }
    var postDocument = snapshot.data!;
    Map<String, dynamic>? postData = postDocument.data() as Map<String, dynamic>?;

    if (postData == null || !postData.containsKey('comments')) {
      return SizedBox.shrink();
    }

    List<dynamic> comments = postData['comments'] ?? [];

    double containerHeight;
    if (comments.length <= 4) {
      containerHeight = comments.length * 100.0; // Her yorum için 50.0 yükseklik varsayıldı. Bu değeri ihtiyacınıza göre ayarlayabilirsiniz.
    } else {
      containerHeight = 340.0; // 4 yorum için toplam 200.0 yükseklik varsayıldı.
    }
  
    return Container(
      height: containerHeight,
      child: SingleChildScrollView(
        child: Column(
          children: comments.map((comment) {
            return _buildCommentWidget(postId, comment);
          }).toList(),
        ), 
      ),
    ); 
   },
),Divider(color: Colors.black45,
        height: 1.0,
        thickness: 0.5,),
TextField(
  controller: getCommentController(postId,),
  decoration: InputDecoration(
    hintText: 'Yorum yap...',
                                                                hintStyle:
                                                                    TextStyle(
                                                                  color: Colors.black
                                                                      .withOpacity(
                                                                          0.6),
                                                                  fontSize: 11,
                                                                ),
                                                                suffixIcon:
                                                                    IconButton(
                                                                  icon: Icon(
                                                                      Icons.send,
                                                                      color: Colors
                                                                          .black),
                                                                  onPressed: () {
  if (_commentControllers.containsKey(postId)) {
    addComment(postId, _commentControllers[postId]!.text);
    _commentControllers[postId]!.clear();
  }
}

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

        
                                            

                                                                                                  
                                                        
                                                      
                                                    
                                          
                            
]))]))]))))]); 
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
        );
  }
}
