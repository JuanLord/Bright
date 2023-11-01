import 'package:bright_app/screens/chat/components/receiver_msg.dart';
import 'package:bright_app/screens/chat/components/receiver_reply_msg.dart';
import 'package:bright_app/screens/chat/components/receiver_text_image_msg.dart';
import 'package:bright_app/screens/chat/components/sender_msg.dart';
import 'package:bright_app/util/constants.dart';
import 'package:bright_app/util/widgets/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatScreenView extends StatefulWidget {
  const ChatScreenView({Key? key}) : super(key: key);

  @override
  State<ChatScreenView> createState() => _ChatScreenViewState();
}

class _ChatScreenViewState extends State<ChatScreenView> {
  // CHATGPT
  Future<String> sendMessage(String message) async {
    print("CHATTY!");
    final OpenAIChatCompletionModel chatCompletion =
        await OpenAI.instance.chat.create(
      model: "gpt-3.5-turbo",
      messages: [
        OpenAIChatCompletionChoiceMessageModel(
          content: "You are now an AI therapist, your job is to text and help the user with their mental health. From now on you will talk like if it was a text, your answers must be very short, remember to be concise and caring. Remember to help the user with your short text like writing. The message is this: ${message}",
          role: OpenAIChatMessageRole.user,
        ),
      ],
    );
    return chatCompletion.choices.first.message.content;
  }

  Future<void> saveMessage(String Chattext) async {
    print("trying");
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference collectionRef = firestore
          .collection('usersData')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection("chats")
          .doc("QaOki92DVCmGGk57W0Bq")
          .collection("messages");

      final String text = await sendMessage(Chattext);
      // Set the data to be saved
      print("object");

      Map<String, dynamic> data = {
        'text': text,
        'sender_id': 'Chatbot',
        'timestamp': Timestamp.now(),
        // Add more fields as needed
      };

      // Create the document in the collection
      await collectionRef.add(data);

      print('Document created successfully');
    } catch (e) {
      print('Error creating document: $e');
    }
  }

  final TextEditingController _controllerChat = TextEditingController();

  Future<String> _getUserID() async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    User user = auth.currentUser!;
    return user.uid;
  }

  void _addUserMessage() async {
    String userID = await _getUserID();
    if (_controllerChat.text.isNotEmpty) {
      FirebaseFirestore.instance
          .collection('usersData')
          .doc(userID)
          .collection("chats")
          .doc("QaOki92DVCmGGk57W0Bq")
          .collection("messages")
          .add({
        'text': _controllerChat.text,
        'sender_id': userID,
        'timestamp': Timestamp.now(),
      });
      _controllerChat.clear();
    }
  }

  List<int> widgets = [1, 2, 3, 4, 5, 6];

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: AppColors.primary,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                        child: Text("Chatbot",
                            style: AppTextStyles.text24W700
                                .copyWith(color: AppColors.textColor2))),
                    SizedBox(
                        width: 38,
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: const Icon(Icons.search))),
                    SizedBox(
                        width: 38,
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: const Icon(Icons.menu))),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: AppColors.chatBotBg,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('usersData')
                        .doc("qCSDdmI2UPSbKe2RnONiJkMlySG2")
                        .collection("chats")
                        .doc("QaOki92DVCmGGk57W0Bq")
                        .collection("messages")
                        .orderBy("timestamp")
                        .snapshots(),
                    builder: (context, snapshot) {
                      DateTime now = snapshot.data?.docs[0]['timestamp'].toDate();

                      var prevDate = DateTime(now.year, now.month, now.day);
                      return ListView(
                        controller:
                            _scrollController, // Add a scroll controller
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data() as Map<String, dynamic>;

                          final currentDate =
                              (data['timestamp'] as Timestamp).toDate();
                          final currentDate2 = DateTime(currentDate.year,
                              currentDate.month, currentDate.day);
                          if (currentDate2 != prevDate) {
                            // If the date has changed, add a divider
                            if (data['sender_id'] == 'Chatbot') {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Center(
                                        child: Text(
                                            "${DateFormat('yy-MM-dd').format(currentDate2)}")),
                                  ),
                                  ReceiverMsg(
                                      size: size,
                                      time: DateFormat('HH:mm')
                                          .format(data["timestamp"].toDate())
                                          .toString(),
                                      text: data["text"])
                                ],
                              );
                            } else {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Center(
                                        child: Text(
                                            "${DateFormat('yy-MM-dd').format(currentDate2)}")),
                                  ),
                                  SenderMsg(
                                      size: size,
                                      time: DateFormat('HH:mm')
                                          .format(data["timestamp"].toDate())
                                          .toString(),
                                      text: data["text"]),
                                ],
                              );
                            }
                          }
                          prevDate = currentDate2;

                          if (data['sender_id'] == 'Chatbot') {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ReceiverMsg(
                                  size: size,
                                  time: DateFormat('HH:mm')
                                      .format(data["timestamp"].toDate())
                                      .toString(),
                                  text: data["text"]),
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SenderMsg(
                                  size: size,
                                  time: DateFormat('HH:mm')
                                      .format(data["timestamp"].toDate())
                                      .toString(),
                                  text: data["text"]),
                            );
                          }
                        }).toList(),
                      );
                      return ListView.builder(
                        controller:
                            _scrollController, // Add a scroll controller
                        itemCount: widgets.length,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        itemBuilder: (context, index) {
                          return index == 0
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 15.0),
                                  child: ReceiverTextImageMsg(size: size),
                                )
                              : index == 1
                                  ? ReceiverReplyMsg(size: size)
                                  : index == 2
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 15.0),
                                          child: SenderMsg(
                                              size: size,
                                              time: "16:46",
                                              text: 'No Problem!'),
                                        )
                                      : index == 3
                                          ? SenderMsg(
                                              size: size,
                                              time: "16:46",
                                              text:
                                                  'I would like to talk about my dream?')
                                          : index == 4
                                              ? Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        height: 2,
                                                        color: AppColors
                                                            .greyLineColor,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(15.0),
                                                      child: Text("Sat, 17/10",
                                                          style: AppTextStyles
                                                              .text14W500
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .textColor5)),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 2,
                                                        color: AppColors
                                                            .greyLineColor,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : index == 5
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 15.0),
                                                      child: ReceiverMsg(
                                                        size: size,
                                                        text:
                                                            "Thank you! you are a very comforting",
                                                        time: "16:46",
                                                      ),
                                                    )
                                                  : Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 15.0),
                                                      child: SenderMsg(
                                                          size: size,
                                                          time: "16:46",
                                                          text: 'Test Message'),
                                                    );
                        },
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                height: 50,
                child: Row(
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                    Flexible(
                      child: TextField(
                        controller: _controllerChat,
                        decoration: const InputDecoration(
                          labelText: 'Message ...',
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _addUserMessage();
                            saveMessage(_controllerChat.text);
                          });
                          // Scroll to the bottom after adding a new message
                          WidgetsBinding.instance?.addPostFrameCallback((_) {
                            _scrollController.animateTo(
                              _scrollController.position.maxScrollExtent,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          });
                        },
                        icon: Image.asset(AppImages.sendIcon)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
