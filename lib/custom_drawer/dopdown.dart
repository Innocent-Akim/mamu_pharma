import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mamusoft/app/bloc/blocOperation/operationBloc.dart';
import 'package:mamusoft/app/bloc/blocOperation/operationState.dart';
import 'package:mamusoft/app/bloc/blocOperation/operationEvent.dart';
import 'package:mamusoft/main.dart';
import 'package:mamusoft/util/constante.dart';
import 'package:mamusoft/util/design_course_app_theme.dart';

class CustomDropDwon extends StatefulWidget {
  @override
  _CustomDropDwon createState() => _CustomDropDwon();
}

class _CustomDropDwon extends State<CustomDropDwon> {
  BlocAgence _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = BlocAgence();
    _bloc.add(EventAgenceSelected());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _bloc,
      builder: (context, state) {
        if (state is StateInitAgence) {
          return Center(
            child: SpinKitCircle(
              color: Colors.white,
              size: 20,
            ),
          );
        }
        if (state is StateLoadingAgence) {
          return Center(
            child: SpinKitCircle(
              color: Colors.white,
              size: 20,
            ),
          );
        }
        if (state is StateLoandedAgence) {
          List<DropdownMenuItem<String>> list = [];
          for (int x = 0; x < state.entreprise.length; x++) {
            list.add(DropdownMenuItem(
              child: Text(state.entreprise[x].designation),
              value: "${state.entreprise[x].designation}",
            ));
          }
          return DropdownButton<String>(
              dropdownColor: Colors.black,
              hint: Text(
                "Sélectionner l'agence",
                style: TextStyle(
                  color: HexColor('#B9BABC'),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              value: Constants.nameAgence,

              // icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 20,
              isExpanded: true,
              style: TextStyle(
                fontFamily: 'WorkSans',
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: DesignCourseAppTheme.nearlyBlue,
              ),
              underline: Container(
                height: 2,
              ),
              onChanged: (String newValue) {
                setState(() {
                  FocusScope.of(context).requestFocus(new FocusScopeNode());
                  Constants.nameAgence = newValue;
                });
              },
              items: list);
        }
      },
    );
  }
}
