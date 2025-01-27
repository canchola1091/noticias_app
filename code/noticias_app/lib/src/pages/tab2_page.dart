import 'package:flutter/material.dart';
import 'package:noticias_app/src/models/category_model.dart';
import 'package:noticias_app/src/services/news_service.dart';
import 'package:noticias_app/src/theme/tema.dart';
import 'package:noticias_app/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';


class Tab2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[

            _ListaCategorias(),

            Expanded(
              child: ListaNoticias(newsService.getArticulosCategoriaSeleccionada)
            )
          ],
        )
   ),
    );
  }
}


class _ListaCategorias extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final categories = Provider.of<NewService>(context).categories;

    return Container(
      width: double.infinity,
      height: 90,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {

          final cName = categories[index].name;
        

          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[

              _CategoryButton(categories[index]),
              SizedBox(height: 5.0),
              Text('${ cName[0].toUpperCase() }${ cName.substring(1)}')

            ],
          ),
        );
       },
      ),
    );
  }
}


class _CategoryButton extends StatelessWidget {

  final Category categoria;
  const _CategoryButton(this.categoria);

  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewService>(context, listen: false);

    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Icon(
          categoria.icon,
          color: (newsService.selectedCategory == this.categoria.name)
            ? miTema.accentColor
            : Colors.black54
        ),
      ),
      onTap: () {
        final newsService = Provider.of<NewService>(context, listen: false);
        newsService.selectedCategory = categoria.name;
      }
    );
  }
}