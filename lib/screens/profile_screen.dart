import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isMath = false;
  bool isChem = false;
  bool isCS = false;
  bool isPhys = false;
  bool isBiology = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.selected,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.black;
    }
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile Screen',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: Colors.lightBlueAccent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.width / 2 + 40,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.white,
                    Colors.white,
                    Colors.lightBlueAccent,
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(size.width / 2),
                  bottomLeft: Radius.circular(size.width / 2),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                Container(
                  width: size.width / 2,
                  height: size.width / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size.width / 4),
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Container(
                      width: size.width / 2 - 8,
                      height: size.width / 2 - 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.width / 4),
                        image: const DecorationImage(
                          image:
                              AssetImage('assets/example_profile_photo.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'abc@gmail.com',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  height: 40,
                  thickness: 2,
                  color: Colors.black,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Interested Categories:',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isMath,
                      onChanged: (bool? value) {
                        setState(
                          () {
                            isMath = value!;
                          },
                        );
                      },
                    ),
                    Text(
                      'Matematik',
                      style: TextStyle(
                        fontSize: 18,
                        color: isMath ? Colors.black : Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isPhys,
                      onChanged: (bool? value) {
                        setState(
                          () {
                            isPhys = value!;
                          },
                        );
                      },
                    ),
                    Text(
                      'Fizik',
                      style: TextStyle(
                        fontSize: 18,
                        color: isPhys ? Colors.black : Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isChem,
                      onChanged: (bool? value) {
                        setState(
                          () {
                            isChem = value!;
                          },
                        );
                      },
                    ),
                    Text(
                      'Kimya',
                      style: TextStyle(
                        fontSize: 18,
                        color: isChem ? Colors.black : Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isBiology,
                      onChanged: (bool? value) {
                        setState(
                          () {
                            isBiology = value!;
                          },
                        );
                      },
                    ),
                    Text(
                      'Biyoloji',
                      style: TextStyle(
                        fontSize: 18,
                        color: isBiology ? Colors.black : Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isCS,
                      onChanged: (bool? value) {
                        setState(
                          () {
                            isCS = value!;
                          },
                        );
                      },
                    ),
                    Text(
                      'Bilişim',
                      style: TextStyle(
                        fontSize: 18,
                        color: isCS ? Colors.black : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
