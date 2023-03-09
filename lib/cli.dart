// functions

// ignore_for_file: unused_local_variable, unrelated_type_equality_checks

// ignore: unused_import
import 'dart:ffi';
import 'dart:io';

//List<String> displayElement = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
List list = [
  ['0', '1', '2'],
  ['3', '4', '5'],
  ['6', '7', '8']
];

String currentmarker = 'x';
String currentplayer = '1';
int col = 0;
int row = 0;

String? slot;

void darwboard() {
  //for (int i = 0; i <= 8; i++) {
  //print("1" + "|" + "2");
  print(list[0][0] + "|" + list[0][1] + "|" + list[0][2]);
  print("---------");
  print(list[1][0] + "|" + list[1][1] + "|" + list[1][2]);
  print("---------");
  print(list[2][0] + "|" + list[2][1] + "|" + list[2][2]);
}

String playmarker(String slot) {
  //detect place in play
  //row
  for (int i = 0; i < 3; i++) {
    if (slot == '0' || slot == '1' || slot == '2') {
      row = 0;
    } else if (slot == '3' || slot == '4' || slot == '5') {
      row = 1;
    } else {
      row = 2;
    }
    for (int i = 0; i < 3; i++) {
      if (slot == '0' || slot == '3' || slot == '6') {
        col = 0;
      } else if (slot == '1' || slot == '4' || slot == '7') {
        col = 1;
      } else {
        col = 2;
      }
    }
  }

  //print(" $row  ','  $col");

  list[row][col] = currentmarker;
  return currentmarker;
}

winner() {
  for (int i = 0; i < 9; i++) {
    for (int i = 0; i < 3; i++) {
      //row
      if (list[i][0] == list[i][1] && list[i][1] == list[i][2]) {
        return currentplayer;
      }
      //col
      if (list[0][i] == list[1][i] && list[1][i] == list[2][i]) {
        return currentplayer;
      }
    }
    //dia
    if (list[0][0] == list[1][1] && list[1][1] == list[2][2]) {
      return currentplayer;
    }
    if (list[0][2] == list[1][1] && list[1][1] == list[2][0]) {
      return currentplayer;
    }

    return currentmarker;
  }
}

void swaplayermarker() {
  if (currentplayer == '1') {
    currentplayer = '2';
  } else {
    currentplayer = '1';
  }
  if (currentmarker == 'x') {
    currentmarker = 'o';
  } else {
    currentmarker = 'x';
  }
}

//return currentplayer;
//print(" the winner is: $currentplayer");

void game() {
  var playerwon;

  print(" player onr:Enter your marker");
  String? markerp1;
  markerp1 = stdin.readLineSync()!;
  //currentplayer = '1';
  currentmarker = markerp1;
  darwboard();

  for (int i = 0; i < 9; i++) {
    print("it is player $currentplayer ,s turn  Enter your slot");
    slot = stdin.readLineSync()!;
    playmarker(slot!);
    darwboard();

    playerwon = winner();
    if (playerwon == '1') {
      print("congrat player one");
      break;
    }
    if (playerwon == '2') {
      print("congrat player two");
      break;
    }
    swaplayermarker();
    //darwboard();
  }

  if (playerwon != '1' && playerwon != '2') {
    print("game over");
  }
}
