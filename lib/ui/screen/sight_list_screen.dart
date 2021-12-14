import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/screen/res/themes.dart';
import 'package:places/domain/app_strings.dart';
import 'package:places/domain/app_ui.dart';


/// Класс описывает виджет 
/// Виджет экрана со списком интересных мест
/// Конструктор, на входе получает список мест sight List<Sight> 
/// В теле виджета строится лента (Column) из виджетов SightCard
class SightListScreen extends StatefulWidget {

  final List<Sight> sight;

  const SightListScreen(this.sight, { Key? key }) : super(key: key);

  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 72,
        title: Text(
          AppStrings.appBarTitle,
          style: AppTheme.headerText.copyWith(
            color: Theme.of(context).textTheme.headline1!.color
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          for(int i=0; i<widget.sight.length; i++)
            Padding(
              padding: const EdgeInsets.fromLTRB(AppUi.p16, AppUi.p16, AppUi.p16, 0),
              child: SightCard(widget.sight[i])
            )
        ]
      )
    );
  }
}
