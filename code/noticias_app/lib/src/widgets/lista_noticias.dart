import 'package:flutter/material.dart';
import 'package:noticias_app/src/models/news_models.dart';
import 'package:noticias_app/src/theme/tema.dart';


class ListaNoticias extends StatelessWidget {

  final List<Article> noticias;

  const ListaNoticias(this.noticias);

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: this.noticias.length,
      itemBuilder: (BuildContext context, int index) {
        return _Noticia(
          noticia: this.noticias[index], 
          index: index
        );
     },
    );
  }
}

class _Noticia extends StatelessWidget {

  final Article noticia;
  final int index;

  const _Noticia({
    @required this.noticia, 
    @required this.index
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _TarjetaTopBar(noticia, index),
        _TarjetaTitulo(noticia),
        _TarjetaImagen(noticia),
        _TarjetaBody(noticia),
        _TarjetaBotones(),
        SizedBox(height: 10.0),
        Divider()

      ],
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  
  final Article noticia;
  final int index;

  const _TarjetaTopBar(this.noticia, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      margin: EdgeInsets.only(bottom: 10.0),
      child:  Row(
        children: <Widget>[
          Text('${index + 1}. ', style: TextStyle(color: miTema.accentColor)),
          Text('${noticia.source.name}.'),
        ],
      ),
    );
  }
}


class _TarjetaTitulo extends StatelessWidget {

  final Article noticia;

  const _TarjetaTitulo(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(noticia.title, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700)),
    );
  }
}


class _TarjetaImagen extends StatelessWidget {

  final Article noticia;

  const _TarjetaImagen(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: ClipRRect(
        borderRadius:BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50) 
        ),
        child: (noticia.urlToImage != null)
        ? FadeInImage(
            placeholder: AssetImage('assets/img/giphy.gif'), 
            image: NetworkImage('${noticia.urlToImage}')
        )
        : Image(image: AssetImage('assets/img/no-image.png'),),
      ),
    );
  }
}


class _TarjetaBody extends StatelessWidget {

  final Article noticia;

  const _TarjetaBody(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Text((noticia.description !=null)
        ? noticia.description
        : ''
      ),
    );
  }
}


class _TarjetaBotones extends StatelessWidget {

  //final Article noticia;

  //const _TarjetaBotones(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            fillColor: miTema.accentColor,
            child: Icon(Icons.star_border),
            onPressed: () {}
          ),
          SizedBox(width: 15.0),
          RawMaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            fillColor: Colors.blue,
            child: Icon(Icons.more),
            onPressed: () {}
          )
        ],
      )
    );
  }
}