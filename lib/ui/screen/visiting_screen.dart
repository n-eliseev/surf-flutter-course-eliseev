import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/domain/app_ui.dart';
import 'package:places/domain/app_strings.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/screen/bottom_nav_bar.dart';

// Класс описывает виджет экрана с местами, которые пользователь 
// желает посетить и уже посетил
class VisitingScreen extends StatelessWidget {
  
  const VisitingScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      
      length: 2,
      
      child: Scaffold(
        
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 56,
          
          title: const Center(
            child: const Text(
              AppStrings.favorite,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 18,
                color: const Color(0xFF252849),
                height: 1.14
              ),
            )
          ),
          
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(52),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color(0xFFF5F5F5),
              ),
              margin: EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 16,
              ),
              child: TabBar(
                tabs: [
                  Tab( text: 'Хочу посетить'),
                  Tab( text: 'Посетил' ),
                ],
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color(0xFF3B3E5B),
                ),
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  height: 1.1
                ),
                unselectedLabelColor: const Color.fromRGBO(124, 126, 146, 0.56),
              ),
            ),
          ),
        ),

        body: TabBarView(
          children: [
            _SightListTab(sight: mocks.sublist(2), icon: Icons.my_location, emptyTitle: 'Отмечайте понравившиеся\nместа и они появиятся здесь.',),            
            _SightListTab(sight: mocks.sublist(0,1),icon: Icons.checklist, emptyTitle: 'Завершите маршрут,\nчтобы место попало сюда.'),            
          ]
        ),

        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}


/// Класс описывает виджет закладки со списком мест
/// В конструктор передаётся:
///  - <Sight>[] sight - список мест 
///  - IconData icon - иконка, которая будет отображаться во вкладке, если список пуст
///  - String emptyTitle - текст, который будет отображаться если список пуст
/// 
class _SightListTab extends StatelessWidget {
  
  final IconData icon;
  final String emptyTitle;
  final List<Sight> sight;
  
  _SightListTab({ 
    required this.icon, 
    required this.emptyTitle,
    this.sight = const <Sight>[],  
    Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const emptyColor = Color.fromRGBO(124, 126, 146, 0.56);
    const emptyStyle = const TextStyle(fontFamily: 'Roboto', color: emptyColor);

    return sight.length == 0 ? 
      Column(
        mainAxisAlignment: MainAxisAlignment.center , 
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 64, color: emptyColor),
          SizedBox(height: 32),
          Text('Пусто', textAlign: TextAlign.center, style: emptyStyle.copyWith(fontSize: 18, height: 1.14)),
          SizedBox(height: 8),
          Text(emptyTitle, textAlign: TextAlign.center, style: emptyStyle.copyWith(fontSize: 14, height: 1.1)),
        ],
      ) :
      Column(
        mainAxisAlignment: MainAxisAlignment.start, 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for(int i=0; i<this.sight.length; i++)
            Padding(
              padding: EdgeInsets.fromLTRB(AppUi.p16, AppUi.p16, AppUi.p16, 0),
              child: SightCard(this.sight[i])
            )
        ]
      )
    ;
  }
}