import 'package:flutter/material.dart';

class LiveStreamScreen extends StatefulWidget {
  const LiveStreamScreen({Key? key}) : super(key: key);

  @override
  _LiveStreamScreenState createState() => _LiveStreamScreenState();
}

class _LiveStreamScreenState extends State<LiveStreamScreen> {
  List joinedPeople = [
    '1.',
    '2.',
    '3.',
    '4.',
    '5.',
  ];

  List comments = [
    {
      'personName': 'Kerem Keskin',
      'email': 'asd@gmail.com',
      'comment': 'Hello',
      'date': '13.02.2022',
      'time': '15.28'
    },
    {
      'personName': 'Mehmet Ali',
      'email': 'xyz@gmail.com',
      'comment': 'Hi',
      'date': '13.02.2022',
      'time': '15.32'
    },
  ];

  bool isOtherComponent = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Container(
                    width: size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/zoomPhoto.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(48),
                        bottomLeft: Radius.circular(48),
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 200),
                    opacity: isOtherComponent ? 1 : 0,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isOtherComponent = !isOtherComponent;
                        });
                      },
                      child: Container(
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(48),
                            bottomLeft: Radius.circular(48),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.75),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.arrow_back_ios_sharp,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              attempedPerson(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: size.width,
                color: Colors.white,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        itemCount: comments.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: size.width - 16,
                            margin: EdgeInsets.all(8),
                            height: 56,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 4,
                                ),
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/example_profile_photo.jpeg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      comments[index]['comment'],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      comments[index]['personName'],
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.8),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Text(
                                  comments[index]['time'],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  fillColor: Colors.blueGrey.withOpacity(0.2),
                                  filled: true,
                                  hintText: 'Enter Comment',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 54,
                            height: 54,
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: Icon(
                                Icons.send,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget attempedPerson() {
    return Container(
      height: 256,
      width: 64,
      child: joinedPeople.length <= 3
          ? ListView.builder(
              itemCount: joinedPeople.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 48,
                  height: 48,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage('assets/example_profile_photo.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              })
          : ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                if (index == 3) {
                  return Container(
                    width: 48,
                    height: 48,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white.withOpacity(0.75),
                    ),
                    child: Center(
                      child: Text(
                        '+${joinedPeople.length - 3}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  );
                }
                return Container(
                  width: 48,
                  height: 48,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage('assets/example_profile_photo.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
