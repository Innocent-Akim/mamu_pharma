import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mamusoft/app/bloc/blocFicheStock/blocFiche.dart';
import 'package:mamusoft/app/bloc/blocFicheStock/eventFiche.dart';
import 'package:mamusoft/app/bloc/blocFicheStock/stateFiche.dart';
import 'package:mamusoft/util/constante.dart';
import 'package:mamusoft/util/hotel_app_theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DetailStock extends StatefulWidget {
  static const String rootName = '/detailstock';
  final date, entreprise;

  const DetailStock({Key key, this.date, this.entreprise}) : super(key: key);
  _DetailStock createState() => _DetailStock();
}

class _DetailStock extends State<DetailStock> {
  DatePickerController controller;
  ScrollController _scrollController;
  bool visib = false;
  bool search = true;
  BlocFiche _blocFiche;
  int compteur = 0;
  int year = DateTime.now().year - 20;
  int moth = DateTime.now().month;
  int day = DateTime.now().month;
  String dateTime = "2019-01-01 00:00:00.000";
  TextEditingController controlleSearcher = TextEditingController();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  void initState() {
    super.initState();
    _blocFiche = BlocFiche();
    _blocFiche
        .add(EventFicheFetch(date: widget.date, entreprise: widget.entreprise));
    _refreshController.headerMode.addListener(() {
      if (_refreshController.headerMode.value == RefreshStatus.idle) {
        Future.delayed(Duration(milliseconds: 20)).then((value) {});
      }
    });

    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HotelAppTheme.buildLightTheme().backgroundColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 1.0,
            backgroundColor: Colors.white,
            leading: IconButton(
                icon: Icon(Icons.close, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 3.0, right: 3.0),
                child: customiseCalendrier(onChange: (date) {
                  setState(() {
                    _blocFiche.add(EventFicheFetch(
                        date: date.toString().substring(0, 10),
                        entreprise: widget.entreprise));
                  });
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black12.withOpacity(.1)),
                  child: TextFormField(
                    controller: controlleSearcher,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          search ? Icons.search : Icons.close,
                          color: Colors.black,
                          size: 12,
                        ),
                        hintText: "Recherche..."),
                    onTap: () {
                      setState(() {
                        search = !search;
                      });
                    },
                    onChanged: (val) {
                      setState(() {
                        _blocFiche.add(EventFicheonChanged(
                            valeur: val,
                            entreprise: widget.entreprise,
                            date: widget.date));
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Elements trouves... ${compteur}",
                      style: TextStyle(fontSize: 10, color: Colors.black12),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SmartRefresher(
                  scrollController: _scrollController,
                  enablePullDown: true,
                  enablePullUp: true,
                  footer: CustomFooter(
                      builder: (BuildContext context, LoadStatus mode) {
                    Widget body;
                    if (mode == LoadStatus.idle) {
                      body = Text("Chargement encours...");
                    } else if (mode == LoadStatus.loading) {
                      body = SpinKitCircle(
                        color: Colors.blue,
                        size: 20,
                      );
                    } else if (mode == LoadStatus.failed) {
                      body = Text("Chargement echouer! essayer encord");
                    } else if (mode == LoadStatus.canLoading) {
                      body = Text("release to load more");
                    } else {
                      body = Text("No more Data");
                    }
                    return Container(
                      height: 30.0,
                      child: Center(child: body),
                    );
                  }),
                  header: MaterialClassicHeader(),
                  controller: _refreshController,
                  onRefresh: () async {
                    await Future.delayed(Duration(microseconds: 1000));

                    _blocFiche.add(EventFicheFetch(
                        date: widget.date, entreprise: widget.entreprise));
                    if (mounted) setState(() {});
                    _refreshController.refreshFailed();
                  },
                  child: BlocBuilder(
                    bloc: _blocFiche,
                    builder: (context, state) {
                      if (state is StateFicheInit) {
                        return Center(
                          child: SpinKitCircle(
                            color: Colors.blueAccent,
                            size: 30,
                          ),
                        );
                      }
                      if (state is StateFicheLoading) {
                        return Center(
                          child: SpinKitCircle(
                            color: Colors.blueAccent,
                            size: 30,
                          ),
                        );
                      }
                      if (state is SteteFicheLoaded) {
                        compteur = state.fiche.length;
                        return ListView.builder(
                          shrinkWrap: false,
                          controller: _scrollController,
                          physics: ScrollPhysics(),
                          itemCount: state.fiche.length,
                          itemBuilder: (context, index) {
                            return state.fiche != null
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      cardDetail(
                                          designation: Constants.capitalize(
                                              val: state
                                                  .fiche[index].designation),
                                          date: state.fiche[index].date,
                                          mTotal: state.fiche[index].ptSortie,
                                          sInitialer:
                                              state.fiche[index].qteEntre,
                                          sDisponiler:
                                              state.fiche[index].qteStock,
                                          sVendus: state.fiche[index].qteSortie,
                                          onclick: () {
                                            setState(() {
                                              visib = !visib;
                                            });
                                          },
                                          count: index),
                                    ],
                                  )
                                : Center(
                                    child: Material(
                                        elevation: 1,
                                        color: Colors.black12,
                                        child:
                                            Image.asset("assets/empty.png")));
                          },
                        );
                      }
                    },
                  ),
                  onLoading: () {
                    Future.delayed(Duration(milliseconds: 1000)).then((value) {
                      _refreshController.loadComplete();
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // selectedTextColor: Colors.blue.shade200,
  //       selectionColor: Colors.blue.shade200,
  Widget customiseCalendrier({Function onChange}) {
    return Column(
      children: <Widget>[
        Material(
          color: Colors.white,
          elevation: 0.0,
          child: DatePicker(DateTime.now(),
              controller: controller,
              locale: 'fr_FR',
              initialSelectedDate: DateTime.now(),
              selectedTextColor: Colors.redAccent,
              dateTextStyle: TextStyle(
                  color: Color(0xFF42A5F5),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
              onDateChange: onChange),
        )
      ],
    );
  }

  Widget cardDetail(
      {String designation,
      String sInitialer,
      String sDisponiler,
      String sVendus,
      String mTotal,
      String date,
      Function onclick,
      count}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: HotelAppTheme.buildLightTheme().backgroundColor,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: const Offset(0, 2),
                blurRadius: 4.0),
          ],
        ),
        child: Material(
          elevation: 0.5,
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xEAFFFFFF), width: 1)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Désignation"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      border: Border.all(
                                          color: Colors.black, width: 1)),
                                  child: Center(
                                      child: Icon(
                                    Icons.widgets,
                                    size: 12,
                                    color: Colors.black,
                                  )),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("${designation}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18)),
                              ],
                            ),
                          ],
                        )),
                    Container(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("S.initiale"),
                          Row(
                            children: <Widget>[
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1,
                                    )),
                                child: Center(
                                    child: Icon(
                                  Icons.playlist_add_check,
                                  size: 12,
                                  color: Colors.black,
                                )),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("${sInitialer}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ],
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          border:
                              Border.all(color: Color(0xFF42A5F5), width: 1)),
                      child: Center(
                        child: Icon(Icons.airplay,
                            size: 12, color: Color(0xFF42A5F5)),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Rapport des ventes",
                      style: TextStyle(
                          color: Color(0xFF42A5F5),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.call_missed_outgoing,
                          color: Colors.black,
                          size: 12,
                        ),
                        Text(
                          "S.disponible",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.call_missed_outgoing,
                          color: Colors.black,
                          size: 12,
                        ),
                        Text(
                          "S.vendus",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.call_missed_outgoing,
                          color: Colors.black,
                          size: 12,
                        ),
                        Text(
                          "Montant",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.trending_down,
                          color: Colors.black,
                          size: 12,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "${sDisponiler}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.trending_up,
                          color: Colors.black,
                          size: 12,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "${sVendus}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.attach_money,
                          color: Colors.black,
                          size: 12,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "${mTotal}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, top: 0, bottom: 0),
                      child: Material(
                        child: Text(
                          "${date}",
                          style: TextStyle(color: Colors.black, fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: onclick,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.red[300],
                    ),
                    child: Icon(
                      visib ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: <Widget>[
                      Text("-"),
                      Text("${count}"),
                      Text("-"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
