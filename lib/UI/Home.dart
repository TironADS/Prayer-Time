import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sa_athuswalath/BloC/prayer_bloc.dart';
import 'package:sa_athuswalath/Repository/Model_Class/PrayerModel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

TextEditingController controller = TextEditingController();
late PrayerModel data;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Prayer Time',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 27),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green[50],
                          border: Border.all(
                            color: Colors.green,
                            width: 1,
                          )),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 40,
                            width: 200,
                            child: TextFormField(
                              controller: controller,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Search location'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print(controller.text);
                        BlocProvider.of<PrayerBloc>(context)
                            .add(FetchPrayer(location: controller.text));
                      },
                      child: Container(
                        height: 50,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<PrayerBloc, PrayerState>(
              builder: (context, state) {
                if (state is PrayerBlocLoading) {
                  return Center(
                    child: CircularProgressIndicator(color: Colors.green),
                  );
                }
                if (state is PrayerBlocError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Icon(
                          Icons.not_listed_location_outlined,
                          color: Colors.green[300],
                          size: 100,
                        )),
                        Center(
                            child: Text(
                          'Search your location',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.green[300],
                              fontWeight: FontWeight.bold),
                        )),
                      ],
                    ),
                  );
                }

                if (state is PrayerBlocLoaded) {
                  print('loaded');
                  data = BlocProvider.of<PrayerBloc>(context).prayerModel;

                  return SizedBox(
                    height: 500,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                ('Fajr                '),
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                              ),
                              Text(
                                (':'),
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                              ),
                              Text(
                                  data.items![0].fajr,
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                ('Dhuhr            '),
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                              ),
                              Text(
                                (':'),
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                              ),
                              Text(
                                data.items![0].dhuhr,
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                ('Asr                 '),
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                              ),
                              Text(
                                (':'),
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                              ),
                              Text(
                                data.items![0].asr,
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                ('Maghrib        '),
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                              ),
                              Text(
                                (':'),
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                              ),
                              Text(
                                data.items![0].maghrib,
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                ('Isha               '),
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                              ),
                              Text(
                                (':'),
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                              ),
                              Text(
                                data.items![0].isha,
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_searching_rounded,
                          color: Colors.green[300],
                          size: 100,
                        ),
                        Text(
                          'Search your location',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.green[300],
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
