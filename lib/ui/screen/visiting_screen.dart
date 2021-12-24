import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/app_strings.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/screen/bottom_nav_bar.dart';
import 'package:places/ui/res/themes.dart';


// Класс описывает виджет экрана с местами, которые пользователь 
// желает посетить и уже посетил
class VisitingScreen extends StatelessWidget {
  
  const VisitingScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final theme = Theme.of(context);

    return DefaultTabController(
      
      length: 2,
      
      child: Scaffold(
        
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 56,
          
          title: Center(
            child: Text(
              AppStrings.favorite,
              textAlign: TextAlign.center,
              style: theme.textTheme.headline2
            )
          ),
          
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(52),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: theme.r40brc,
                color: theme.cardTheme.color
              ),
              margin: const EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 16,
              ),
              child: const TabBar(
                tabs: [
                  Tab( text: AppStrings.wantToVisit),
                  Tab( text: AppStrings.visited ),
                ],
              ),
            ),
          ),
        ),

        body: TabBarView(
          children: [
            //_SightListTab(sight: mocks.sublist(2), icon: Icons.my_location, emptyTitle: 'Отмечайте понравившиеся\nместа и они появиятся здесь.',),            
            const _SightListTab(icon: Icons.my_location, emptyTitle: AppStrings.markedPlace,),            
            _SightListTab(sight: mocks.sublist(0,1),icon: Icons.checklist, emptyTitle: AppStrings.donePath),            
          ]
        ),

        bottomNavigationBar: const BottomNavBar(),
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
  
  const _SightListTab({ 
    required this.icon, 
    required this.emptyTitle,
    this.sight = const <Sight>[],  
    Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context),
          ibColor = theme.colorScheme.appColorSet.inactiveBlack;

    return sight.isEmpty ? 
      Column(
        mainAxisAlignment: MainAxisAlignment.center , 
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 64, color: ibColor),
          const SizedBox(height: 32),
          Text(
            AppStrings.empty, 
            textAlign: TextAlign.center, 
            style: theme.textTheme.headline2?.copyWith(color: ibColor)
          ),
          const SizedBox(height: 8),
          Text(
            emptyTitle, 
            textAlign: TextAlign.center, 
            style: theme.textTheme.bodyText1?.copyWith(color: ibColor)
          ),
        ],
      ) :
      Column(
        mainAxisAlignment: MainAxisAlignment.start, 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for(int i=0; i<sight.length; i++)
            Padding(
              padding: EdgeInsets.fromLTRB(theme.p16, theme.p16, theme.p16, 0),
              child: SightCard(sight[i])
            )
        ]
      )
    ;
  }
}
