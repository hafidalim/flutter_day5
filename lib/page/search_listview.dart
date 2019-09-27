import 'package:flutter/material.dart';

class SearchListPage extends StatefulWidget {
  @override
  _SearchListPageState createState() => _SearchListPageState();
}

class _SearchListPageState extends State<SearchListPage> {
  var etSearch = new TextEditingController();
  bool isSearch = true;
  String query = "";

  //Data List
  List<String> dataList;
  List<String> filterList;


  @override
  void initState() {
    super.initState();

    dataList = new List<String>();
    dataList = ["Snake", "Elephant", "Giraffe", "Cats", "Dog", "Orion", "Boomerang", "Pelican", "Goose","Eagle","Horse","ButterFly"
        "Snake1", "Elephant1", "Giraffe1", "Cats1", "Dog1", "Orion1", "Boomerang1", "Pelican1", "Goose1","Eagle1","Horse1","ButterFly1"];
    dataList.sort();
  }

  //SearhListView
  _SearchListPageState(){
    etSearch.addListener((){
      if(etSearch.text.isEmpty){
        setState(() {
          isSearch = true;
          query = "";
        });
      }else{
        setState(() {
          isSearch = false;
          query = etSearch.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Search ListView'),
        backgroundColor: Colors.brown,
      ),

      body: Container(
        margin: EdgeInsets.only(left: 10,right: 10,top: 10),
        child: Column(
          children: <Widget>[
            _createSearchView(),
            isSearch ? _createListView() : _performSearh()
          ],
        ),
      ),
    );
  }

  Widget _createSearchView() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1)
      ),
      child: TextField(
        controller: etSearch,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: new TextStyle(color: Colors.green)
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  //Membuat ListView
  Widget _createListView() {
    return Flexible(
      child: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (BuildContext context, int index){
            return Card(
              color: Colors.white,
              elevation: 5,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text("${dataList[index]}"),
              ),
            );
          }),
    );
  }

  Widget _performSearh() {
    filterList = new List<String>();
    for(int i = 0; i<dataList.length; i++){
      var item = dataList[i];
      if(item.toLowerCase().contains(query.toLowerCase())){
        filterList.add(item);
      }
    }
    return _createFilteredView();
  }

  Widget _createFilteredView() {
    return Flexible(
        child: ListView.builder(
            itemCount: filterList.length,
            itemBuilder: (BuildContext context, int index){
          return Card(
            color: Colors.white,
            elevation: 5,
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: Text("${filterList[index]}"),
            ),
          );
        })
    );
  }
}



