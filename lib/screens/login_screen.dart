import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iamnaveenoff/services/auth_service.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  final Duration duration = const Duration(milliseconds: 800);
  Future<void> _loginGoogle() async {
    setState(() {
      _isLoading = true;
    });
    await FirebaseAuthService().signInWithGoogle();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 239, 239),
      body: Container(
        margin: const EdgeInsets.all(8),
        width: size.width,
        height: size.height,
        child: _isLoading
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: CircularProgressIndicator(),
                    ),
                    Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Text(
                        'Processing',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ///
                  FadeInUp(
                    duration: duration,
                    delay: const Duration(milliseconds: 2000),
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 50,
                        left: 5,
                        right: 5,
                      ),
                      width: size.width,
                      height: size.height / 2,
                      child: Lottie.asset("assets/wl.json",
                          animate: true, repeat: false),
                    ),
                  ),

                  ///
                  const SizedBox(
                    height: 15,
                  ),

                  /// TITLE
                  FadeInUp(
                    duration: duration,
                    delay: const Duration(milliseconds: 1600),
                    child: const Text(
                      "iamnaveenoff Wallet",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  ///
                  const SizedBox(
                    height: 10,
                  ),

                  /// SUBTITLE
                  FadeInUp(
                    duration: duration,
                    delay: const Duration(milliseconds: 1000),
                    child: const Text(
                      "Keep Track of your wallet and savings",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 1.2,
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w300),
                    ),
                  ),

                  ///
                  Expanded(child: Container()),

                  /// GOOGLE BTN
                  FadeInUp(
                    duration: duration,
                    delay: const Duration(milliseconds: 600),
                    child: GestureDetector(
                      onTap: () async {
                        _loginGoogle();
                      },
                      child: SButton(
                        size: size,
                        borderColor: Colors.grey,
                        color: Colors.white,
                        img: 'assets/g.png',
                        text: "Continue with Google",
                        textStyle: null,
                      ),
                    ),
                  ),

                  ///
                  const SizedBox(
                    height: 20,
                  ),

                  ///
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
      ),
    );
  }
}

class SButton extends StatelessWidget {
  const SButton({
    Key? key,
    required this.size,
    required this.color,
    required this.borderColor,
    required this.img,
    required this.text,
    required this.textStyle,
  }) : super(key: key);

  final Size size;
  final Color color;
  final Color borderColor;
  final String img;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width / 1.2,
      height: size.height / 15,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor, width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            img,
            height: 40,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
