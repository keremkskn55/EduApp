import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:live_stream_test_app/components/video_list.dart';
import 'package:live_stream_test_app/models/live_stream.dart';
import 'package:live_stream_test_app/models/question.dart';
import 'package:live_stream_test_app/screens/live_stream_screen.dart';
import 'package:live_stream_test_app/screens/profile_screen.dart';
import 'package:live_stream_test_app/screens/question_creating.dart';
import 'package:live_stream_test_app/screens/questions_show_off.dart';

import '../models/video.dart';

enum SelectedCategory { question, videos }

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({Key? key}) : super(key: key);

  @override
  _StudentHomeScreenState createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  List<LiveStream> liveStreams = [
    LiveStream(
      lesson: 'Fizik',
      lessonDetail: 'Atışlar',
      backgroundPhoto: 'assets/phys_${Random().nextInt(5)}.jpg',
      url: 'url',
      instructorName: 'Kerem Keskin',
      instructorPhoto: 'assets/example_profile_photo.jpeg',
      isThereAds: false,
    ),
    LiveStream(
      lesson: 'Matematik',
      lessonDetail: 'Rasyonel Sayılar',
      backgroundPhoto: 'assets/math_${Random().nextInt(5)}.jpg',
      url: 'url',
      instructorName: 'Hamza Duman',
      instructorPhoto: 'assets/example_profile_photo.jpeg',
      isThereAds: false,
    ),
    LiveStream(
      lesson: 'Kimya',
      lessonDetail: 'Organik Kimya',
      backgroundPhoto: 'assets/chem_${Random().nextInt(5)}.jpg',
      url: 'url',
      instructorName: 'Ahmet Taş',
      instructorPhoto: 'assets/example_profile_photo.jpeg',
      isThereAds: false,
    ),
  ];

  List<Question> questionList = [
    Question(
      lessonTitle: 'Fizik',
      lessonDetail: 'Atışlar',
      instructorName: 'Kerem Keskin',
      questionNumber: 12,
      attempNum: 7,
      backgroundPhoto: 'assets/phys_${Random().nextInt(5)}.jpg',
      date: '11.02.2022',
    ),
    Question(
      lessonTitle: 'Matematik',
      lessonDetail: 'Limit',
      instructorName: 'Ismail Allahverdiyev',
      questionNumber: 15,
      attempNum: 21,
      backgroundPhoto: 'assets/math_${Random().nextInt(5)}.jpg',
      date: '11.02.2022',
    ),
  ];

  List<Video> videoList = [
    Video(
      lessonTitle: 'Fizik',
      lessonDetail: 'Newton Hareketleri',
      instructorName: 'Kerem Keskin',
      backgroundPhoto: 'assets/chem_${Random().nextInt(5)}.jpg',
    ),
    Video(
      lessonTitle: 'Matematik',
      lessonDetail: 'İntegral',
      instructorName: 'Hamza Duman',
      backgroundPhoto: 'assets/math_${Random().nextInt(5)}.jpg',
    ),
  ];

  SelectedCategory selectedCategory = SelectedCategory.question;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Container(
          height: 100,
          width: 100,
          child: FloatingActionButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => QuestionCreating()));
            },
            child: Container(
                height: 1000,
                width: 1000,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [
                          Color(0xff7F7FD5),
                          Color(0xff86A8E7),
                          Color(0xff91EAE4),
                        ]
                    )
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                )
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: EdgeInsets.all(8),
                      height: size.width / 5 - 32,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Ders ve video arama',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileScreen()));
                      },
                      child: Container(
                        margin: EdgeInsets.all(8),
                        width: size.width / 5 - 8,
                        height: size.width / 5 - 16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(size.width / 10),
                          color: Colors.red,
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: size.width / 2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: liveStreams.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LiveStreamScreen()));
                      },
                      child: Container(
                        width: size.width / 3,
                        height: size.width / 2,
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image:
                                AssetImage(liveStreams[index].backgroundPhoto),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                liveStreams[index].lesson,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                liveStreams[index].lessonDetail,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Container(
                              width: size.width / 6,
                              height: size.width / 6,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(size.width / 12),
                                gradient: const LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    Colors.green,
                                    Colors.yellow,
                                  ],
                                ),
                              ),
                              child: Center(
                                child: Container(
                                  width: size.width / 6 - 6,
                                  height: size.width / 6 - 6,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          size.width / 12),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            liveStreams[index].instructorPhoto),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(
                  height: 20,
                  color: Colors.black,
                  thickness: 2,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = SelectedCategory.question;
                        });
                      },
                      child: Text(
                        'Sorular',
                        style: TextStyle(
                          fontSize: 24,
                          color: selectedCategory == SelectedCategory.question
                              ? Colors.black
                              : Colors.grey,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = SelectedCategory.videos;
                        });
                      },
                      child: Text(
                        'Videolar',
                        style: TextStyle(
                          fontSize: 24,
                          color: selectedCategory == SelectedCategory.videos
                              ? Colors.black
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            selectedCategory == SelectedCategory.question
                ? SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => QuestionsShowOff()));
                          },
                          child: Container(
                            margin: EdgeInsets.all(16),
                            width: size.width,
                            height: size.width / 2,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    questionList[index].backgroundPhoto),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.black),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(4),
                                      margin: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.75),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        questionList[index].instructorName,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(4),
                                      margin: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.75),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        'Attemp: ${questionList[index].attempNum}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.white.withOpacity(0.75),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        questionList[index].lessonDetail,
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        questionList[index].lessonTitle,
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(4),
                                      margin: EdgeInsets.only(bottom: 4, left: 4),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white.withOpacity(0.75),
                                      ),
                                      child: Text(
                                        'Soru Sayısı: ${questionList[index].questionNumber}',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(4),
                                      margin:
                                          EdgeInsets.only(bottom: 4, right: 4),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white.withOpacity(0.75),
                                      ),
                                      child: Text(
                                        questionList[index].date,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: questionList.length,
                    ),
                  )
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VideoList()));
                          },
                          child: Container(
                            margin: EdgeInsets.all(16),
                            width: size.width,
                            height: size.width / 2,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    videoList[index].backgroundPhoto),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.black),
                            ),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    margin: EdgeInsets.all(8),
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.75),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          videoList[index].lessonTitle,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          videoList[index].lessonDetail,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(videoList[index].instructorName),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: 1,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
