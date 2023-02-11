// TODO: Put public facing types in this file.

/// Checks if you are awesome. Spoiler: you are.
class Scoob {
  bool get isAwesome => true;



  List<dynamic> getListOfObjectsStatic(
    {String query, List<dynamic> objects, String modelName}) {
  List<dynamic> data;
  if (data == null) {
    // ignore: deprecated_member_use
    data = new List<dynamic>();
  }
  // ignore: deprecated_member_use
  List<dynamic> filterObjects = new List<dynamic>();
  if (!query.endsWith(' ')) {
    query = query + ' ';
  }
  while (query.startsWith(' ')) {
    query = query.substring(1, query.length);
  }
  List<String> splitQuery = query.split(' ');
  // ignore: deprecated_member_use
  List<List<dynamic>> objectsForEachWord = new List<List<dynamic>>();
  print('some of words : ${splitQuery.length} , $splitQuery');

  //
  splitQuery.forEach((word) {
    objectsForEachWord.add(
        getListOfObjects(query: word, objects: objects, modelName: modelName));
  });
  print(
      '<><><><><> some of branchesForEachWord : ${objectsForEachWord.length}');
  for (var x = 0; x < objectsForEachWord.length; x++) {
    print('results found for word $x : ${objectsForEachWord[x].length}');
    for (var y = 0; y < objectsForEachWord[x].length; y++) {
      bool existInQuery = false;
      for (var a = 0; a < objectsForEachWord.length; a++) {
        bool existInRow = false;
        for (var b = 0; b < objectsForEachWord[a].length; b++) {
          //{

          //
          String xyId;
          String abId;
          // if (objectsForEachWord[x][y] is Country) {
          if (modelName == 'Country') {
            xyId = objectsForEachWord[x][y].code;
            // print('is Country, xyCode is done : $xyId');
          } else
          // if (objectsForEachWord[x][y] is Branch) {
          // if (objectsForEachWord[x][y].departmentInfoID != null) {
          if (modelName == 'Branch') {
            xyId = objectsForEachWord[x][y].departmentInfoID;
            // print('is Branch, xyCode is done : $xyId');
          }
          // if (objectsForEachWord[a][b] is Country) {
          if (modelName == 'Country') {
            abId = objectsForEachWord[a][b].code;
            // print('is Country, abCode is done : $abId');
          } else
          // if (objectsForEachWord[a][b] is Branch) {
          // if (objectsForEachWord[a][b].departmentInfoID != null) {
          if (modelName == 'Branch') {
            abId = objectsForEachWord[a][b].departmentInfoID;
            // print('is Branch, abCode is done : $abId');
          }

          //

          if (xyId == null && abId == null)
            print('isNULLLLLLLLLLLLLLLLLLLLL');
          else if (xyId == abId) {
            existInRow = true;
            // print('111++++++ existInRow : $existInRow');
            break; // for b
          }
        }

        // print('222++++++ existInRow : $existInRow');
        if (!existInRow) {
          existInQuery = false;
          break; // for a
        } else {
          existInQuery = true;
        }
      }
      if (existInQuery) {
        bool same = false;
        String xyId;
        filterObjects.forEach((model) {
          // if (objectsForEachWord[x][y] is Country) {
          if (modelName == 'Country') {
            xyId = objectsForEachWord[x][y].code;
          } else
          // if (objectsForEachWord[x][y] is Branch) {
          // if (objectsForEachWord[x][y].departmentInfoID != null) {
          if (modelName == 'Branch') {
            xyId = objectsForEachWord[x][y].departmentInfoID;
          }
          // if (model is Country && xyId == model.code) {
          if (modelName == 'Country' && xyId == model.code) {
            same = true;
          } else
          // if ( // model is Branch &&
          // model.departmentInfoID != null &&
          //     xyId == model.departmentInfoID) {
          if (modelName == 'Branch') if (xyId == model.departmentInfoID) {
            same = true;
          }
          // print(' ***  *** ** *++*++*+*+*+* same : $same');
        });

        if (!same) filterObjects.add(objectsForEachWord[x][y]);
      }
    }
  }
  data = filterObjects;
  // print(' ***  *** ** length of result : ${data.length}');
  return data;
}

List<dynamic> getListOfObjects(
    {String query, List<dynamic> objects, String modelName}) {
  List<dynamic> data = objects;
  // for Country Model
  String _name;
  String _code;
  // for Branch Model
  String _depName;
  String _depAddress;
  //

  List<dynamic> filterObjects = data.where(
    (dynamic element) {
      String id;
      if (modelName == 'Country')
        id = element.code;
      else if (modelName == 'Branch') id = element.departmentInfoID;
      //
      bool checkNull = (query == null || id == null);
      bool checkQuery = false;
      //
      if (modelName == 'Country') {
        _name = element.name;
        _code = element.code;
        checkNull = (_code == null || _name == null || checkNull);
        checkQuery = (_name.toLowerCase().contains(query.toLowerCase()) ||
            _code.toLowerCase().contains(query.toLowerCase()));
      } else
      // for Branch Model
      // if (element is Branch) {
      // if (element.departmentInfoID != null) {
      if (modelName == 'Branch') {
        _depName = arabicToPersianCharacter(element.depName);
        _depAddress = arabicToPersianCharacter(element.depAddress);
        query = arabicToPersianCharacter(query);
        checkNull = (_depName == null || _depAddress == null || checkNull);
        checkQuery = (_depName.toLowerCase().contains(query.toLowerCase()) ||
            _depAddress.toLowerCase().contains(query.toLowerCase()));
      }
      // //
      return !checkNull && checkQuery;
    },
  ).toList();

  print(' ***  *** ** length of filterObjects : ${filterObjects.length}');
  data = filterObjects;
  return data;
}
}
