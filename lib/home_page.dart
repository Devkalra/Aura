import 'package:aura/container_box.dart';
import 'package:aura/geminipage.dart';
import 'package:aura/pallete.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final speechToText = SpeechToText();
  String lastWords = '';
  @override
  void initState() {
    super.initState();
    initSpeechToText();
  }

  Future<void> initSpeechToText() async {
    await speechToText.initialize();
    setState(() {});
  }

  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  @override
  void dispose() {
    super.dispose();
    speechToText.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 127, 30, 10),
        title: const Text(
          textAlign: TextAlign.start,
          'Aura',
          style: TextStyle(
            fontFamily: 'BasierSquare-Regular',
            fontWeight: FontWeight.bold,
            fontSize: 38,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Test.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Lottie.asset(
                          'assets/animations/lottieanimation3.json',
                          width: 280,
                          height: 155),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 40).copyWith(
                      top: 30,
                    ),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Pallete.firstSuggestionBoxColor),
                      borderRadius: BorderRadius.circular(20).copyWith(
                        topLeft: Radius.zero,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Hello I am Aura, '
                            ' How can I help You?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Playfair Display',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 22,
                    ),
                    child: const Text(
                      'Integrated with:',
                      style: TextStyle(
                          fontFamily: 'Etherplex',
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Column(
                    children: [
                      FeatureBox(
                        color: Color.fromRGBO(255, 181, 80, 10),
                        headertext: 'ChatGPT',
                        descriptionText:
                            'A smarter way to stay organized and informed with Chat GPT',
                      ),
                    ],
                  ),
                  const Column(
                    children: [
                      FeatureBox(
                        color: Color.fromRGBO(255, 165, 77, 10),
                        headertext: 'Smart Voice Assistant',
                        descriptionText: 'Under Process.. Soon will available',
                      ),
                    ],
                  ),
                  const Column(
                    children: [
                      FeatureBox(
                        color: Color.fromRGBO(255, 210, 100, 30),
                        headertext: 'Dall-E',
                        descriptionText: 'Under Process..',
                      ),
                    ],
                  ),
                  // const Column(
                  //   children: [
                  //     FeatureBox(
                  //       color: Pallete.mainFontColor,
                  //       headertext: 'Smart Voice Assistant',
                  //       descriptionText:
                  //           'Under Process.. Soon will available',
                  //     ),
                  //   ],
                  // ),
                ],
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: FloatingActionButton(
                    onPressed: () async {
                      if (await speechToText.hasPermission &&
                          speechToText.isNotListening) {
                        await startListening();
                      } else if (speechToText.isListening) {
                        await stopListening();
                      } else {
                        initSpeechToText();
                      }
                    },
                    backgroundColor: Colors.white,
                    child: const Icon(
                      Icons.mic,
                      color: Colors.black87,
                    )

                    // backgroundColor: Color.fromRGBO(226, 226, 226, 100), // Change the color here
                    ),
              ),
              Positioned(
                bottom: 100,
                right: 20,
                child: FloatingActionButton(
                  onPressed: () {
                    // Navigate to the next page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Geminipage()),
                    );
                  },
                  backgroundColor: Colors.white,
                  // backgroundColor: Color.fromRGBO(226, 226, 226, 100), // Make the FAB transparent
                  elevation: 0, // Remove shadow
                  child: SizedBox(
                    width: 35,
                    height: 35,
                    child: Lottie.asset(
                      'assets/animations/geminiiii.json', // Replace with your Lottie animation
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
