import 'package:covid_track/Model/WorldStateModel.dart';
import 'package:covid_track/Services/States_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStateScreen extends StatefulWidget {
  const WorldStateScreen({Key? key}) : super(key: key);

  @override
  State<WorldStateScreen> createState() => _WorldStateScreenState();
}

class _WorldStateScreenState extends State<WorldStateScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
  AnimationController(duration: const Duration(seconds: 3), vsync: this)
    ..repeat();
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                Expanded(
                  child: FutureBuilder(
                      future: stateServices.fetchWorldStatesRecords(),
                      builder: (context, AsyncSnapshot<WorldStateModel> snapshot) {
                        if (snapshot.hasData) {
                          return SpinKitCircle(
                            color: Colors.white,
                            size: 50.0,
                            controller: _controller,
                          );
                        } else {
                          return Column(
                            children: [
                              PieChart(
                                chartValuesOptions: const ChartValuesOptions(
                                    showChartValuesInPercentage: true),
                                // ignore: prefer_const_literals_to_create_immutables
                                dataMap: {
                                  "Total":
                                  double.parse(snapshot.data!.cases!.toString()),
                                  "Death":
                                  double.parse(snapshot.data!.deaths!.toString()),
                                  "Recoverd": double.parse(
                                      snapshot.data!.recovered!.toString()),
                                },
                                animationDuration: const Duration(milliseconds: 1200),
                                chartRadius: MediaQuery.of(context).size.width / 3.2,
                                legendOptions: const LegendOptions(
                                  legendPosition: LegendPosition.left,
                                  legendTextStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                chartType: ChartType.ring,
                                colorList: const [
                                  Color(0xff4285f4),
                                  Color(0xff1aa260),
                                  Color(0xffde5246),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, right: 10, left: 10, bottom: 5),
                                child: Card(
                                  child: Column(
                                    children: [
                                      ReusabaleRow(
                                          title: "Total",
                                          value: snapshot.data!.cases!.toString()),
                                      ReusabaleRow(
                                        title: "Death",
                                        value: snapshot.data!.deaths!.toString(),
                                      ),
                                      ReusabaleRow(
                                        title: "Recovered",
                                        value: snapshot.data!.recovered!.toString(),
                                      ),
                                      ReusabaleRow(
                                        title: "Active",
                                        value: snapshot.data!.active!.toString(),
                                      ),
                                      ReusabaleRow(
                                        title: "Critical",
                                        value: snapshot.data!.critical!.toString(),
                                      ),
                                      ReusabaleRow(
                                        title: "Today Deaths",
                                        value: snapshot.data!.todayDeaths!.toString(),
                                      ),
                                      ReusabaleRow(
                                        title: "Today Recoverd",
                                        value:
                                        snapshot.data!.todayRecovered!.toString(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {

                                },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.green[600],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                    child: Text('Track Countries'),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                      }),
                ),
              ],
            ),
          )),
    );
  }
}

// ignore: must_be_immutable
class ReusabaleRow extends StatelessWidget {
  String title, value;
  ReusabaleRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title),
                Text(value),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}