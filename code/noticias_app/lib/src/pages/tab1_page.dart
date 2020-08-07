import 'package:flutter/material.dart';
import 'package:noticias_app/src/services/news_service.dart';
import 'package:noticias_app/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';


class Tab1Page extends StatefulWidget {

  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page>  with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;
  
  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    final headlines = Provider.of<NewService>(context).headlines;
    //newsService.headlines
    // Listanoticias(headlines)
    return Scaffold(
      body: (headlines.length == 0)
        ? Center(
          child: CircularProgressIndicator(),
        )
        : ListaNoticias(headlines)
   );
  }

  
}