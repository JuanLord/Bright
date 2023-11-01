import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/*
class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  static Color bgColor = Color(0xFFe2e2fe);
  static Color mainColor = Color(0xFF000633);
  static Color accentColor = Color(0xFF0065FF);

  static List<Color> cardsColor = [
    Colors.white,
    Colors.red.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.blueGrey.shade100,
  ];
  static TextStyle mainTitle = GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static TextStyle mainContent = GoogleFonts.nunito(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
  static TextStyle dateTitle = GoogleFonts.roboto(
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor,
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: mainColor,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "data",
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                SizedBox(
                  height: 20.0,
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("usersData")
                      .doc(FirebaseAuth.instance.currentUser?.uid)
                      .collection("journal")
                      .snapshots(),
                  builder: (context, AsyncSnapshot snapshot) {
                    // check connectionstate
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasData) {
                      return GridView(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2));
                    }
                    return Text(
                      "there's no Notes",
                      style: GoogleFonts.nunito(color: Colors.white),
                    );
                  },
                ),
              ]),
        ));
  }
}
*/
class JournalScreen extends StatefulWidget {
  @override
  _JournalScreenState createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Write Journal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: "Write about your day...",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // TODO: Save the journal content
                print(_controller.text);
              },
              child: Text('Save Entry'),
            ),
          ],
        ),
      ),
    );
  }
}
