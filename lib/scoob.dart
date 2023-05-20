
library scoob;

export 'src/scoob_base.dart';

class Scoob {
  
  List<dynamic> getListOfObjectsStatic({String query, List<dynamic> objects}) {
      List<dynamic> data;
      if (data == null) {
        data = new List<dynamic>();
      }
        if (!query.endsWith(' ')) {
    query = query + ' ';
  }
    while (query.startsWith(' ')) {
    query = query.substring(1, query.length);
  }
       List<String> splitQuery = query.split(' ');
  List<List<dynamic>> objectsForEachWord = new List<List<dynamic>>();
  splitQuery.forEach((word) {
    objectsForEachWord.add(
        getListOfObjects(query: word, objects: objects, modelName: modelName));
  });

  }

}

// TODO: Export any libraries intended for clients of this package.
