import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mamusoft/app/bloc/blocOperation/operationBloc.dart';
import 'package:mamusoft/app/bloc/blocOperation/operationEvent.dart';
import 'package:mamusoft/app/bloc/blocOperation/operationState.dart';
import 'package:mamusoft/app/bloc/blocStock/blockStock.dart';
import 'package:mamusoft/app/bloc/blocStock/eventStock.dart';
import 'package:mamusoft/app/bloc/blocStock/stateStock.dart';
import 'package:mamusoft/app/bloc/blocvente/blocVente.dart';
import 'package:mamusoft/app/bloc/blocvente/eventVente.dart';
import 'package:mamusoft/app/bloc/blocvente/stateVente.dart';
import 'package:mamusoft/app/model/venteModel.dart';
import 'package:mamusoft/app/source/data_api_provider.dart';
import 'package:mamusoft/app/source/repository.dart';
import 'package:mamusoft/screens/detailStock.dart';
import 'package:mamusoft/screens/identite.dart';
import 'package:mamusoft/util/app_theme.dart';
import 'package:mamusoft/util/design_course_app_theme.dart';
import 'package:mamusoft/util/hotel_app_theme.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyHomePage extends StatefulWidget {
  static const String rootName = '/myhome';
  final quantite;
  final entreprise;

  const MyHomePage({Key key, this.quantite, this.entreprise}) : super(key: key);
  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  ProgressDialog dialogueProgress;
  BlocVente _blocVente;
  BlocStock _blocStock;
  OperationBloc _operation0;
  OperationBloc _operation1;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  ScrollController _scrollControlle;
  int perpage = 15;
  int pagaOffset = 0;
  DateTime dateSelect;
  DateTime dateSelec;

  @override
  void initState() {
    super.initState();

    _blocStock = BlocStock();
    _blocVente = BlocVente();
    _operation0 = OperationBloc();
    _operation1 = OperationBloc();
    _blocStock.add(EventStockerFetch(entreprise: widget.entreprise));
    _blocVente.add(EventVenteLoaded(
        entreprise: widget.entreprise, limit: (10).toString(), limitdb: '10'));
    _operation0.add(OperationEventFetch(
        date: '2019-05-19', entreprise: widget.entreprise, position: 1));
    _operation1.add(OperationEventFetch(
        date: '2019-05-25', entreprise: widget.entreprise, position: 2));
  }

  final _identifier = MyIdentite();
  CategoryType categoryType = CategoryType.bkv;
  bool isConnexion = false;
  String title = 'BUKAVU';
  var isSelectedItm = 0;
  final ScrollController _scrollController = ScrollController();

  // DateTime _currentdate;
  @override
  Widget build(BuildContext context) {
    // String _formatDate = DateFormat.yMMMEd().format(_currentdate);
    return Container(
      child: SafeArea(
        maintainBottomViewPadding: true,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    isSelectedItm == 0
                        ? Icons.widgets
                        : isSelectedItm == 1
                            ? Icons.add_to_queue
                            : isSelectedItm == 2
                                ? Icons.folder_open
                                : Icons.person,
                    color: Color(0xFF11C1EC),
                  ),
                  onPressed: () {}),
            ],
          ),
          body: Stack(
            // key: globalKey,
            children: <Widget>[
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: NestedScrollView(
                        controller: _scrollController,
                        headerSliverBuilder:
                            (BuildContext context, bool inner) {
                          return <Widget>[
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0,
                                        right: 8.0,
                                        bottom: 8.0,
                                        top: 8.0),
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16, right: 16),
                                          child: Row(
                                            children: <Widget>[
                                              getButtonUI(
                                                categoryTypeData:
                                                    CategoryType.bkv,
                                                isSelected: categoryType ==
                                                    CategoryType.bkv,
                                                onClick: () {
                                                  FocusScope.of(context)
                                                      .requestFocus(
                                                          new FocusScopeNode());
                                                  setState(() {
                                                    isSelectedItm = 0;
                                                    categoryType =
                                                        CategoryType.bkv;
                                                    title = "BUKAVU";
                                                  });
                                                },
                                              ),
                                              const SizedBox(
                                                width: 16,
                                              ),
                                              getButtonUI(
                                                categoryTypeData:
                                                    CategoryType.bavi,
                                                isSelected: categoryType ==
                                                    CategoryType.bavi,
                                                onClick: () {
                                                  FocusScope.of(context)
                                                      .requestFocus(
                                                          new FocusScopeNode());
                                                  setState(() {
                                                    isSelectedItm = 0;
                                                    categoryType =
                                                        CategoryType.bavi;
                                                    title = "UVIRA";
                                                  });
                                                },
                                              ),
                                              const SizedBox(
                                                width: 16,
                                              ),
                                              getButtonUI(
                                                categoryTypeData:
                                                    CategoryType.kamitu,
                                                isSelected: categoryType ==
                                                    CategoryType.kamitu,
                                                onClick: () {
                                                  setState(() {
                                                    FocusScope.of(context)
                                                        .requestFocus(
                                                            new FocusScopeNode());
                                                    isSelectedItm = 0;
                                                    categoryType =
                                                        CategoryType.kamitu;

                                                    title = "KAMITUGA";
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                childCount: 1,
                              ),
                            ),
                            SliverPersistentHeader(
                              delegate: ContestTabHeader(
                                searchUI: getFilterBarUI(),
                              ),
                              floating: true,
                              pinned: true,
                            )
                          ];
                        },
                        body: Padding(
                          padding: const EdgeInsets.only(
                            left: 0.0,
                            right: 0.0,
                            top: 0.0,
                            bottom: 0.0,
                          ),
                          child: categoryType == CategoryType.bavi
                              ? Container(
                                  color: HotelAppTheme.buildLightTheme()
                                      .backgroundColor,
                                  child: isSelectedItm == 0
                                      ? SmartRefresher(
                                          scrollController: _scrollControlle,
                                          enablePullDown: true,
                                          enablePullUp: false,
                                          controller: _refreshController,
                                          onRefresh: () async {
                                            await Future.delayed(
                                                Duration(microseconds: 1000));
                                            _blocVente.add(EventVenteLoaded(
                                                entreprise: widget.entreprise,
                                                limit: '10',
                                                limitdb: '10'));
                                            _refreshController
                                                .refreshCompleted();
                                          },
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 16, top: 4),
                                                    child: Text(
                                                      'Dashboard',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xFF5AD0EE),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      left: 16,
                                                      top: 4,
                                                    ),
                                                    child: FlatButton(
                                                      onPressed: () {},
                                                      child: Text(
                                                        'View All',
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  BlocBuilder(
                                                    bloc: _operation1,
                                                    builder: (context, state) {
                                                      if (state
                                                          is OperationStateInit) {
                                                        return Center(
                                                          child: SpinKitCircle(
                                                            size: 12,
                                                            color: Colors.blue,
                                                          ),
                                                        );
                                                      }
                                                      if (state
                                                          is OperationStateLoading) {
                                                        return Center(
                                                          child: SpinKitCircle(
                                                            size: 12,
                                                            color: Colors.blue,
                                                          ),
                                                        );
                                                      }
                                                      if (state
                                                          is OperationStateLoaded) {
                                                        return customDashbord(
                                                            icon: FontAwesomeIcons
                                                                .angleDoubleDown,
                                                            color: Color(
                                                                0xFFB8F1FF),
                                                            nombre: state
                                                                        .operation !=
                                                                    null
                                                                ? "${state.operation[0].nobre}"
                                                                : "0.00",
                                                            name: state.operation !=
                                                                    null
                                                                ? 'Entrées'
                                                                : "Date invalider");
                                                      }
                                                    },
                                                  ),
                                                  BlocBuilder(
                                                    bloc: _operation0,
                                                    builder: (context, state) {
                                                      if (state
                                                          is OperationStateInit) {
                                                        return Center(
                                                          child: SpinKitCircle(
                                                            size: 12,
                                                            color: Colors.blue,
                                                          ),
                                                        );
                                                      }
                                                      if (state
                                                          is OperationStateLoading) {
                                                        return Center(
                                                          child: SpinKitCircle(
                                                            size: 12,
                                                            color: Colors.blue,
                                                          ),
                                                        );
                                                      }
                                                      if (state
                                                          is OperationStateLoaded) {
                                                        return customDashbord(
                                                            color: Color(
                                                                0xFFEBBB9C),
                                                            icon:
                                                                Icons.save_alt,
                                                            name: state.operation !=
                                                                    null
                                                                ? 'Sorties'
                                                                : "Date invalite",
                                                            nombre: state
                                                                        .operation !=
                                                                    null
                                                                ? "${state.operation[0].nobre}"
                                                                : "0.00",
                                                            onTap: () {
                                                              showCupertinoModalPopup(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return SafeArea(
                                                                      maintainBottomViewPadding:
                                                                          true,
                                                                      child: Scaffold(
                                                                          body: Container(
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Text("DATA"),
                                                                        ),
                                                                      )),
                                                                    );
                                                                  });
                                                            });
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                              SizedBox(child: Text("")),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  BlocBuilder(
                                                    bloc: _blocStock,
                                                    builder: (context, state) {
                                                      if (state
                                                          is StateStockInit) {
                                                        return Center(
                                                          child: SpinKitCircle(
                                                            color: Colors
                                                                .lightBlue,
                                                            size: 20,
                                                          ),
                                                        );
                                                      }
                                                      if (state
                                                          is StateStockerLoading) {
                                                        return Center(
                                                          child: SpinKitCircle(
                                                              color: Colors
                                                                  .lightBlue,
                                                              size: 20),
                                                        );
                                                      }
                                                      if (state
                                                          is StateStockerFetch) {
                                                        return state.data !=
                                                                null
                                                            ? customDashbord(
                                                                icon: Icons
                                                                    .collections_bookmark,
                                                                color: Color(
                                                                    0xFF86B8E9),
                                                                nombre:
                                                                    "${state.data[0].quantite}",
                                                                name:
                                                                    'Quantite disponibles',
                                                                onTap: () {
                                                                  FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          FocusNode());
                                                                  Navigator.push<
                                                                      dynamic>(
                                                                    context,
                                                                    MaterialPageRoute<
                                                                            dynamic>(
                                                                        builder: (BuildContext
                                                                                context) =>
                                                                            DetailStock(
                                                                              date: '2019-06-03',
                                                                              entreprise: widget.entreprise,
                                                                            ),
                                                                        fullscreenDialog:
                                                                            true),
                                                                  );
                                                                })
                                                            : customDashbord(
                                                                icon: Icons
                                                                    .warning,
                                                                color: Color(
                                                                    0xFFEE7979),
                                                                nombre:
                                                                    "${0.0}",
                                                                name:
                                                                    'Quantite disponibles');
                                                      }
                                                    },
                                                  ),
                                                  customDashbord(
                                                      color: Color(0x94F7737A),
                                                      icon: Icons.pie_chart,
                                                      name:
                                                          'Produit non disponibles ',
                                                      nombre: '5400'),
                                                ],
                                              ),
                                              SizedBox(child: Text("")),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0,
                                                    right: 8,
                                                    top: 0,
                                                    bottom: 8),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                      color: Color(0xFFDDD6D6),
                                                      width: 2,
                                                    ),
                                                    color: Color(0xFFFFFFFF),
                                                  ),
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.2,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      children: <Widget>[
                                                        Text(
                                                          "Balanced",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                        Text(
                                                          "Change your risk",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.blue,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: <Widget>[
                                                            Expanded(
                                                                child: Material(
                                                              elevation: 0.5,
                                                              child: Container(
                                                                height: 50,
                                                                child: Center(
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: <
                                                                        Widget>[
                                                                      Text(
                                                                        'Nr',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.grey),
                                                                      ),
                                                                      Text(
                                                                        'AWS 2455',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize:
                                                                                13,
                                                                            fontWeight:
                                                                                FontWeight.w600),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            )),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Expanded(
                                                                child: Material(
                                                              elevation: 0.5,
                                                              child: Container(
                                                                height: 50,
                                                                child: Center(
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: <
                                                                        Widget>[
                                                                      Text(
                                                                        'Created',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.grey),
                                                                      ),
                                                                      Text(
                                                                        '22 Dec 2015',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize:
                                                                                13,
                                                                            fontWeight:
                                                                                FontWeight.w600),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            )),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Icon(
                                                              FontAwesomeIcons
                                                                  .adobe,
                                                              size: 15,
                                                            ),
                                                            Text(
                                                              "System de Gestion",
                                                              style: AppTheme
                                                                  .title,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : isSelectedItm == 1
                                          ? BlocBuilder(
                                              bloc: _blocVente,
                                              builder: (context, state) {
                                                if (state is StateVenteInit) {
                                                  return Center(
                                                    child: SpinKitCircle(
                                                      color: Colors.lightBlue,
                                                      size: 40,
                                                    ),
                                                  );
                                                }
                                                if (state
                                                    is StateVenteLoading) {
                                                  return Center(
                                                    child: SpinKitCircle(
                                                      color: Colors.lightBlue,
                                                      size: 40,
                                                    ),
                                                  );
                                                }
                                                if (state is StateVenteFetch) {
                                                  return state.data.length == 0
                                                      ? Center(
                                                          child: Image.asset(
                                                            "assets/new vide.png",
                                                          ),
                                                        )
                                                      : SmartRefresher(
                                                          scrollController:
                                                              _scrollControlle,
                                                          enablePullDown: true,
                                                          enablePullUp: true,
                                                          footer: CustomFooter(
                                                              builder:
                                                                  (BuildContext
                                                                          context,
                                                                      LoadStatus
                                                                          mode) {
                                                            Widget body;
                                                            if (mode ==
                                                                LoadStatus
                                                                    .idle) {
                                                              body = Text(
                                                                  "Chargement encours...");
                                                            } else if (mode ==
                                                                LoadStatus
                                                                    .loading) {
                                                              body =
                                                                  SpinKitCircle(
                                                                color:
                                                                    Colors.blue,
                                                                size: 20,
                                                              );
                                                            } else if (mode ==
                                                                LoadStatus
                                                                    .failed) {
                                                              body = Text(
                                                                  "Chargement echouer! essayer encord");
                                                            } else if (mode ==
                                                                LoadStatus
                                                                    .canLoading) {
                                                              body = Text(
                                                                  "release to load more");
                                                            } else {
                                                              body = Text(
                                                                  "No more Data");
                                                            }
                                                            return Container(
                                                              height: 50.0,
                                                              child: Center(
                                                                  child: body),
                                                            );
                                                          }),
                                                          header:
                                                              MaterialClassicHeader(
                                                                  color: Colors
                                                                      .blueAccent),
                                                          controller:
                                                              _refreshController,
                                                          onRefresh: () async {
                                                            await Future.delayed(
                                                                Duration(
                                                                    milliseconds:
                                                                        1000));

                                                            _blocVente.add(
                                                                EventVenteLoaded(
                                                                    entreprise:
                                                                        widget
                                                                            .entreprise,
                                                                    limit: (10)
                                                                        .toString(),
                                                                    limitdb:
                                                                        '10'));
                                                            _refreshController
                                                                .refreshCompleted();
                                                          },
                                                          onLoading: () async {
                                                            await Future.delayed(
                                                                Duration(
                                                                    milliseconds:
                                                                        1000));

                                                            _blocVente.add(EventVenteLoaded(
                                                                entreprise: widget
                                                                    .entreprise,
                                                                limit: (state
                                                                            .data
                                                                            .length +
                                                                        10 +
                                                                        10)
                                                                    .toString(),
                                                                limitdb: '10'));
                                                            if (mounted)
                                                              setState(() {});
                                                            _refreshController
                                                                .loadComplete();
                                                          },
                                                          // () async {
                                                          //   await Future.delayed(
                                                          //       Duration(
                                                          //           microseconds:
                                                          //               1000));
                                                          //   _blocVente.add(
                                                          //       EventVenteLoaded(
                                                          //           entreprise:
                                                          //               "0001-KMGA",
                                                          //           limit:
                                                          //               '5'));

                                                          //   _refreshController
                                                          //       .refreshCompleted();
                                                          // },
                                                          child:
                                                              ListView.builder(
                                                            physics:
                                                                ScrollPhysics(),
                                                            itemCount: state
                                                                .data.length,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            4.0,
                                                                        bottom:
                                                                            4.0),
                                                                child: getDetail(
                                                                    onClick: () {
                                                                      print(
                                                                          "${state.data[index].montant}");
                                                                    },
                                                                    ico: Icons.vertical_align_bottom,
                                                                    montant: '${state.data[index].montant}',
                                                                    payer: '${state.data[index].apayer}',
                                                                    devise: 'USD',
                                                                    dette: '${state.data[index].dette}',
                                                                    date: '${state.data[index].date}',
                                                                    color: Colors.red,
                                                                    colo: Colors.redAccent),
                                                              );
                                                            },
                                                          ),
                                                        );
                                                }
                                              },
                                            )
                                          : isSelectedItm == 2
                                              ? GridView.count(
                                                  crossAxisCount: 3,
                                                  children: List.generate(100,
                                                      (index) {
                                                    return InkWell(
                                                      onTap: () {
                                                        print(index);
                                                      },
                                                      child: rapport(
                                                          date: DateTime.now()
                                                              .toString()
                                                              .substring(
                                                                  0, 10)),
                                                    );
                                                  }))
                                              : ListView(
                                                  children: <Widget>[
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Hero(
                                                          tag: 'assets/b8.png',
                                                          child: Container(
                                                            height: 150,
                                                            width: 150,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          75),
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      'assets/b8.png'),
                                                                  fit: BoxFit
                                                                      .cover),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 15.0,
                                                        ),
                                                        Text(
                                                          "Akim",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontSize: 20.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 4.0,
                                                        ),
                                                        Text(
                                                          "Admin system",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Montserrat',
                                                              color:
                                                                  Colors.grey),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  30.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
                                                              Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: <
                                                                    Widget>[
                                                                  Text(
                                                                    "25",
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      fontSize:
                                                                          20.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 4.0,
                                                                  ),
                                                                  Text(
                                                                    "AGEs",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Colors
                                                                            .grey),
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: <
                                                                    Widget>[
                                                                  Text(
                                                                    "65",
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      fontSize:
                                                                          20.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 4.0,
                                                                  ),
                                                                  Text(
                                                                    "POIDs",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Colors
                                                                            .grey),
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: <
                                                                    Widget>[
                                                                  Text(
                                                                    "1.5",
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      fontSize:
                                                                          20.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 4.0,
                                                                  ),
                                                                  Text(
                                                                    "TAILLEs",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Colors
                                                                            .grey),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 15.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: <Widget>[
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 0,
                                                                        bottom:
                                                                            16),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFF11C1EC),
                                                                  shape: BoxShape
                                                                      .rectangle,
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              8)),
                                                                ),
                                                                width: 150,
                                                                height: 45,
                                                                child:
                                                                    FlatButton(
                                                                  child: Text(
                                                                      'Déconnexion',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight: FontWeight
                                                                              .w300,
                                                                          color:
                                                                              Colors.white)),
                                                                  onPressed:
                                                                      () {},
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 0,
                                                                        bottom:
                                                                            16),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Color(
                                                                          0xFF11C1EC)),
                                                                  color: Color(
                                                                      0xFFFFFFFF),
                                                                  shape: BoxShape
                                                                      .rectangle,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .all(
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                  ),
                                                                ),
                                                                width: 150,
                                                                height: 45,
                                                                child:
                                                                    FlatButton(
                                                                  child: Text(
                                                                      'Edit',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight: FontWeight
                                                                              .w300,
                                                                          color:
                                                                              Color(0xFF11C1EC))),
                                                                  onPressed:
                                                                      () {
                                                                    _identifier
                                                                        .showDialogue(
                                                                            context);
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ))
                              : categoryType == CategoryType.bkv
                                  ? Container(
                                      child: Column(
                                        children: <Widget>[],
                                      ),
                                    )
                                  : Container(
                                      child: Center(
                                        child: Text("Kamituga"),
                                      ),
                                    ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: FancyBottomNavigation(
              circleColor: Color(0xFF11C1EC),
              activeIconColor: Color(0xFFFFFFFF),
              inactiveIconColor: Color(0xFF11C1EC),
              textColor: Colors.grey,
              barBackgroundColor: Color(0xFFFFFFFF),
              //   initialSelection: 0,
              tabs: [
                TabData(iconData: Icons.widgets, title: "Accueil"),
                TabData(iconData: Icons.add_to_queue, title: "Caisse"),
                TabData(iconData: Icons.folder_open, title: "Rapport"),
                TabData(iconData: Icons.person, title: "Profil"),
              ],
              onTabChangedListener: (position) {
                setState(() {
                  isSelectedItm = position;
                });
              }),
        ),
      ),
    );
  }

  Widget getButtonUI(
      {CategoryType categoryTypeData, bool isSelected, Function onClick}) {
    String txt = '';
    if (CategoryType.bkv == categoryTypeData) {
      txt = 'BUKAVU';
    } else if (CategoryType.bavi == categoryTypeData) {
      txt = 'UVIRA';
    } else if (CategoryType.kamitu == categoryTypeData) {
      txt = 'KAMITUGA';
    }
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: isSelected
                ? DesignCourseAppTheme.nearlyBlue
                : DesignCourseAppTheme.nearlyWhite,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            border: Border.all(color: DesignCourseAppTheme.nearlyBlue)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            onTap: onClick,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, left: 18, right: 18),
              child: Center(
                child: Text(
                  txt,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                    letterSpacing: 0.27,
                    color: isSelected
                        ? DesignCourseAppTheme.nearlyWhite
                        : DesignCourseAppTheme.nearlyBlue,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  dashBoard({
    Color color,
    String libele,
    String montant,
    String devise,
    IconData icon,
  }) {
    return Container(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
        bottom: 10,
      ),
      margin: EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 35.0,
              width: 35.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.white,
                  width: 1.0,
                ),
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Date",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "$libele",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "$montant",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                "$devise",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getFilterBarUI() {
    return Stack(
      // key: globalKey,
      children: <Widget>[
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 24,
            decoration: BoxDecoration(
              color: HotelAppTheme.buildLightTheme().backgroundColor,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    offset: const Offset(0, -2),
                    blurRadius: 8.0),
              ],
            ),
          ),
        ),
        Container(
          color: HotelAppTheme.buildLightTheme().backgroundColor,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Container(
                                height: MediaQuery.of(context).size.height / 4,
                                child: custom(),
                              ),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Annulé")),
                                FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        _operation0.add(OperationEventFetch(
                                            date:
                                                "${dateSelect.toString().substring(0, 10)}",
                                            entreprise: widget.entreprise,
                                            position: 1));
                                        _operation1.add(OperationEventFetch(
                                            date:
                                                "${dateSelect.toString().substring(0, 10)}",
                                            entreprise: widget.entreprise,
                                            position: 2));
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Confirmer")),
                              ],
                            );
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Sélectionner date',
                            style: TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: 13,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.calendar_view_day,
                                color: HotelAppTheme.buildLightTheme()
                                    .primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Divider(
            height: 1,
          ),
        )
      ],
    );
  }

  // Widget dialog(BuildContext context) {
  //   return showDialog(context: context, child:

  //   sh
  //   );
  // }

  Widget getDetail(
      {String montant,
      String date,
      String devise,
      Function onClick,
      IconData icon,
      IconData ico,
      Color color,
      Color colo,
      String payer,
      String dette}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.blue.withOpacity(.1),
        ),
        child: Row(
          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 35,
                          height: 35,
                          margin: EdgeInsets.only(left: 0, right: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.grey, width: 1.0),
                          ),
                          child:
                              Icon(Icons.attach_money, color: Colors.redAccent),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      // width: MediaQuery.of(context).size.width *
                                      //     0.3,
                                      child: Text(
                                        "$date",
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: Color(0xFF11C1EC),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(child: Text("A payer")),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Text(
                                        "$montant",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(child: Text("Payer")),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: Text(
                                        "$payer",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(child: Text("Dette")),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: Text(
                                        "$dette",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: onClick,
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: Colors.redAccent, width: 1),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        ico,
                                        color: colo,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget customDashbord(
      {String name,
      String nombre,
      Color color,
      IconData icon,
      Function onTap}) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 5,
                  color: color,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, right: 5.0),
                        child: InkWell(
                          onTap: onTap,
                          child: Container(
                            width: 35,
                            height: 35,
                            child: Icon(icon, color: Colors.white),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                    width: 1)),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2.2,
                        height: MediaQuery.of(context).size.height / 7 - 35,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "${name}",
                                softWrap: true,
                                style: TextStyle(
                                    fontSize: 13, color: Colors.white54),
                              ),
                              Text(
                                "${nombre}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 25,
                                    color: Colors.white),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 5.0, right: 5.0, bottom: 2),
                                // child: Text(
                                //   "Grâce à ce tableau de bord, vous pouvez savoir ce qui génère votre chiffre d'affaires et en apprendre plus le profil de vos",
                                //   style: TextStyle(
                                //       fontSize:
                                //           12,
                                //       color: Colors
                                //           .black26),
                                // ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget rapport({String date}) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 8.0, top: 8.0),
      child: Stack(
        children: <Widget>[
          Material(
            borderRadius: BorderRadius.circular(10.0),
            elevation: 0.0,
            color: Colors.black12,
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.folder,
                        size: 80,
                        color: Color(0xFF11C1EC),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, bottom: 0.0, right: 8.0, top: 0.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                  color: Color(0xFFFFFFFF), width: 1)),
                          child: Center(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  '${date}',
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xFFDA5931)),
                                ),
                                SizedBox(
                                  width: 2.0,
                                ),
                                Icon(
                                  Icons.calendar_today,
                                  color: Color(0xFFDA5931),
                                  size: 12,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget custom() {
    return CupertinoDatePicker(
      initialDateTime: DateTime.now(),
      mode: CupertinoDatePickerMode.date,
      maximumYear: DateTime.now().year,
      minimumYear: DateTime.now().year - 10,
      key: Key(""),
      use24hFormat: false,
      backgroundColor: Color(0xFFFFFFFF),
      onDateTimeChanged: (val) {
        setState(() {
          dateSelect = val;
        });
      },
    );
  }
}

class ContestTabHeader extends SliverPersistentHeaderDelegate {
  ContestTabHeader({
    this.searchUI,
  });

  final Widget searchUI;

  @override
  double get maxExtent => 52.0;

  @override
  double get minExtent => 52.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return searchUI;
  }
}

enum CategoryType {
  bkv,
  bavi,
  kamitu,
}
enum Position {
  bkv,
  bavi,
  kamitu,
}
