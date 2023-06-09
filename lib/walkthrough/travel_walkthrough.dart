import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app_template/screens/signup.dart';
import 'package:travel_app_template/utils/colors_const.dart';
import 'package:travel_app_template/utils/common_functions.dart';
import 'package:travel_app_template/utils/strings.dart';


class TravelWalkThrough extends StatefulWidget {
  const TravelWalkThrough({Key? key}) : super(key: key);

  @override
  _TravelWalkThroughState createState() => _TravelWalkThroughState();
}

class _TravelWalkThroughState extends State<TravelWalkThrough> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive
            ?Colors.white
            : Colors.white.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // stops: [0.1, 0.5],
              colors: [
                ColorsConstants.amberColor.withOpacity(1),
                ColorsConstants.amberColor,
              ],
            ),
          ),
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.only(right: 10.0, top: 15.0),
                    child: InkWell(
                      onTap: () {
                        _pageController.jumpToPage(2); // for regular jump
                        _pageController.animateToPage(2,
                            curve: Curves.decelerate,
                            duration: const Duration(milliseconds: 300));
                      },
                      child:  Text(Strings.skip,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.zero,
                    height: MediaQuery.of(context).size.height*0.7,
                    child: PageView(
                      physics: const ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // ignore: prefer_const_literals_to_create_immutables
                              Center(
                                  child: Container(
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Colors.white12),
                                child:  Image(
                                  image: const AssetImage(
                                    'assets/icon/03.png',
                                  ),
                                  height: MediaQuery.of(context).size.height*0.3,
                                  width: 400.0,
                                ),
                              )),
                              const SizedBox(height: 30.0),
                               Text(
                                Strings.destination,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                              const SizedBox(height: 15.0),
                              Text(
                               Strings.description,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                  child: Container(
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Colors.white12),
                                child:  Image(
                                  image: const AssetImage(
                                    'assets/icon/01.png',
                                  ),
                                  height: MediaQuery.of(context).size.height*0.3,
                                  width: 400.0,
                                ),
                              )),
                              const SizedBox(height: 30.0),
                               Text(
                                Strings.advanture,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                              const SizedBox(height: 15.0),
                              Text(Strings.description,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                  child: Container(
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Colors.white12),
                                child:  Image(
                                  image: const AssetImage(
                                    'assets/icon/02.png',
                                  ),
                                  height: MediaQuery.of(context).size.height*0.3,
                                  width: 400.0,
                                ),
                              )),
                              const SizedBox(height: 30.0),
                               Text(
                                Strings.enjoyTravel,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                              const SizedBox(height: 15.0),
                              Text(
                                Strings.description,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                  _currentPage != _numPages - 1
                      ? Expanded(
                          child: Align(
                            alignment: FractionalOffset.bottomRight,
                            child: InkWell(
                                onTap: () {
                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(right: 10.0, top: 5.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children:  <Widget>[
                                      Text(
                                        Strings.next,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.0,
                                        ),
                                      ),
                                      const SizedBox(width: 10.0),
                                      const Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                        size: 30.0,
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        )
                      : const Text(''),
                ],
              ),
            ),

        ),
      bottomSheet: _currentPage == _numPages - 1
          ? GestureDetector(
              onTap: () {
            //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>));
               Navigator.of(context).push(CommonFunctions.pushWithTopAnimation(child:  const SignUpScreen(), duration: const Duration(milliseconds: 620)));
              },
              child: Container(
                height: MediaQuery.of(context).size.height*0.08,
                width: double.infinity,
                color: Colors.white,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                    child: Text(
                      Strings.getStarted,
                      style:  TextStyle(
                        color: ColorsConstants.amberColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : const Text(''),
    );
  }
}
