/*
import 'package:bright_app/util/constants.dart';
import 'package:bright_app/util/widgets/custom_rounded_button.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
//import 'package:audioplayers/audioplayers.dart';
//import 'package:just_audio/just_audio.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  //JustAudioWindows.initialize();
}

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 40,
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_rounded,
                              color: AppColors.textColor2,
                              size: 20,
                            ))),
                    Text("Videos",
                        style: AppTextStyles.text24W700
                            .copyWith(color: AppColors.textColor2)),
                    const SizedBox(width: 38),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  height: 35,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child: RoundedButton(
                            borderColor: AppColors.textColor.withOpacity(.2),
                            buttonColor: Colors.white,
                            textColor: AppColors.textColor2,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            borderRadius: 50,
                            onTap: () {},
                            btnImage: '',
                            btnText: 'Recommended',
                            hasImage: false),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: 80,
                        child: RoundedButton(
                            borderColor: AppColors.textColor.withOpacity(.2),
                            buttonColor: Colors.white,
                            textColor: AppColors.textColor2,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            borderRadius: 50,
                            onTap: () {},
                            btnImage: '',
                            btnText: 'other',
                            hasImage: false),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const TopVideoWidget(),
              const SizedBox(height: 30),
              StepperContainer(
                  heading: 'Mental Health Minute',
                  desc: 'Episode 3',
                  image: 'welcome.png',
                  color: Color(0xFF6DD3CE),
                  time: '2',
                  podcast: 'PodcastOne.mp3'),
              const SizedBox(height: 20),
              StepperContainer(
                  heading: 'Lucy: A story of success',
                  desc: 'Episode 3',
                  image: 'harmony.png',
                  color: Color(0xFF8367C7),
                  time: '3',
                  podcast: 'PodcastTwo.mp3'),
              const SizedBox(height: 20),
              StepperContainer(
                heading: 'Why should you take a break',
                desc: 'Prioritizing mental health at schools',
                image: 'serenity.png',
                color: Color(0xFF85CB33),
                time: '2',
                podcast: 'PodcastThree.mp3',
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class StepperContainer extends StatefulWidget {
  String heading, desc, image, time, podcast;
  Color color;
  StepperContainer({
    required this.heading,
    required this.desc,
    required this.image,
    required this.time,
    required this.color,
    required this.podcast,
    super.key,
  });

  @override
  State<StepperContainer> createState() => _StepperContainerState();
}

class _StepperContainerState extends State<StepperContainer> {
  @override

  //FlutterSound flutterSound = FlutterSound();
  AudioPlayer _player = AudioPlayer();
  //Added the late. Not in tutorial.
  late AudioCache cache;
  bool isPlaying = false;
  IconData playBtn = Icons.play_arrow_sharp;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    cache = AudioCache(fixedPlayer: _player);

    cache.load('PodcastOne.mp3'); // Mental health minute
    cache.load('PodcastTwo.mp3');
    cache.load('PodcastThree.mp3');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 36, right: 16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: widget.color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3), // changes the position of the shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.heading,
                    style: AppTextStyles.text20bold.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontFamily: AppTextStyles.fontPoppins)),
                Text(widget.desc,
                    style: AppTextStyles.text12W500.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontFamily: AppTextStyles.fontPoppins)),
                SizedBox(height: 30),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (!isPlaying) {
                          //_player.play;
                          cache.play(widget.podcast);
                          isPlaying = true;
                          setState(() {
                            playBtn = Icons.pause;
                          });
                          playBtn = Icons.pause;
                        } else {
                          _player.pause();
                          setState(() {
                            playBtn = Icons.play_arrow_sharp;
                          });
                          isPlaying = false;
                        }
                      },
                      icon: Icon(
                        playBtn,
                        size: 19,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text("Play",
                        style: AppTextStyles.text12W500.copyWith(
                            fontSize: 12,
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppTextStyles.fontPoppins)),
                    const SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 2),
                        child: Text(widget.time + " min",
                            style: AppTextStyles.text14W500),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/${widget.image}',
                height: 96.h,
                width: 96.w,
              ))
        ],
      ),
    );
  }
}

class TopVideoWidget extends StatelessWidget {
  const TopVideoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(AppImages.topVideoSldier,
                  height: 200, fit: BoxFit.cover)),
          Positioned(
            left: 12,
            child: Container(
              padding: const EdgeInsets.only(top: 20, bottom: 35),
              height: 225.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Let it go",
                          style: AppTextStyles.text20bold
                              .copyWith(color: AppColors.primary)),
                      Text("Don’t Judge Yourself",
                          style: AppTextStyles.text14W500
                              .copyWith(color: AppColors.primary)),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 12,
                            child: Icon(Icons.play_arrow_sharp, size: 15),
                          ),
                          const SizedBox(width: 8),
                          Text("Play",
                              style: AppTextStyles.text12W500.copyWith(
                                  fontSize: 12,
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(width: 8),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 2),
                              child: Text("32 mint",
                                  style: AppTextStyles.text14W500),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Image.asset(AppImages.trackIcon),
                          const SizedBox(width: 5),
                          Text("8 Tracks",
                              style: AppTextStyles.text12W500
                                  .copyWith(color: AppColors.primary)),
                          const SizedBox(width: 8),
                          Image.asset(AppImages.trackIcon),
                          const SizedBox(width: 8),
                          Text("2 min read",
                              style: AppTextStyles.text12W500.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 15),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
              right: 10,
              bottom: 30,
              top: 15,
              child: Image.asset(AppImages.topVideoLogo))
        ],
      ),
    );
  }
}

 */
