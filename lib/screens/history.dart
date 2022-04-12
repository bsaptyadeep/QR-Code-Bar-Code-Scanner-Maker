import 'package:app/custom/history_msg.dart';
import 'package:app/functions/database_helper.dart';
import 'package:app/models/model1.dart';
import 'package:flutter/material.dart';

class HisPage extends StatefulWidget {
  const HisPage({Key? key}) : super(key: key);

  @override
  _HisPageState createState() => _HisPageState();
}

class _HisPageState extends State<HisPage> {
  DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/historyPage.png'),
                fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 30, right: 60, top: 20, bottom: 20),
                        child: Text('History',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30)),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  initialData: const [],
                  future: _dbHelper.getHis(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    if (snapshot.data!.isNotEmpty) {
                      List<History> data = List.castFrom<dynamic, History>(
                              snapshot.data as List<History>)
                          .toList();
                      return ScrollConfiguration(
                        behavior: NoGlowBehaviour(),
                        //  child: Text('${snapshot.data}'),

                        child: Scrollbar(
                          child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                child: HisMsg(
                                  oper: data[index].oper,
                                  txt: data[index].txt,
                                  date: data[index].date,
                                )

                                // child: ElevatedButton(onPressed: () {  },
                                // child: Text(data[index].title),),
                                // onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => Taskpage(
                                //       task: snapshot.data[index],
                                //     ),
                                //   ),
                                // ).then(
                                //   (value) {
                                //     setState(() {});
                                //   },
                                // );
                                // },
                                // child: CatCardWidget(
                                //   title: snapshot.connectionState.index,
                                // ),
                              );
                            },
                          ),
                        ),
                      );
                    }
                    return const Text('No Catagory Defined');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NoGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
