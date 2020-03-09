import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uis_walking_routes/CardItemModel.dart';

class Utiles{
  Utiles();
  
   static var appColors = [
    Color.fromRGBO(0, 51, 102, 1.0),
    Color.fromRGBO(200, 177, 139, 1.0),
    Color.fromRGBO(102, 51, 153, 1.0),
    Color.fromRGBO(85, 85, 85, 1.0),
    Color.fromRGBO(255, 0, 153, 1.0),
    Color.fromRGBO(204, 204, 204, 1.0),
    Color.fromRGBO(0, 153, 255, 1.0),
    Color.fromRGBO(188, 211, 49, 1.0),
    Color.fromRGBO(255, 204, 51, 1.0),
    Color.fromRGBO(0, 51, 102, 1.0),
    Color.fromRGBO(200, 177, 139, 1.0),

  ];
  static List<String> imagesBg = [
    "image1.jpeg",
    "image2.jpeg",
    "image3.jpeg",
    "image4.jpeg",
    "image5.jpeg",
    "image6.jpeg",
    "image7.jpeg",
    "image8.jpeg",
    "image9.jpeg",
    "image10.jpeg",
    "image11.jpeg",
    "image12.jpeg",
    "image13.jpeg",
  ];
  static List<Color> array = [
    Color.fromRGBO(0, 51, 102, 1.0),
    Color.fromRGBO(200, 177, 139, 1.0),
    Color.fromRGBO(0, 51, 102, 1.0),
    Color.fromRGBO(200, 177, 139, 1.0),
    Color.fromRGBO(0, 51, 102, 1.0),
    Color.fromRGBO(200, 177, 139, 1.0),
    Color.fromRGBO(0, 51, 102, 1.0),
    Color.fromRGBO(200, 177, 139, 1.0),
    Color.fromRGBO(0, 51, 102, 1.0),
    Color.fromRGBO(200, 177, 139, 1.0),
    Color.fromRGBO(0, 51, 102, 1.0),
    Color.fromRGBO(200, 177, 139, 1.0),
  ];
  static var cardsList = [
    CardItemModel("0.25 Mile loop", Icons.account_circle, 9, 0.83),
    CardItemModel("0.5 Mile loop", Icons.work, 12, 0.24),
    CardItemModel("0.8 Mile loop", Icons.home, 7, 0.32),
    CardItemModel("1 Mile loop", Icons.work, 12, 0.24),
    CardItemModel("1 Mile loop (2)", Icons.work, 12, 0.24),
    CardItemModel("1.5 Mile loop", Icons.work, 12, 0.24),
    CardItemModel("1.5 Mile loop (2)", Icons.work, 12, 0.24),
    CardItemModel("2 Mile loop", Icons.home, 7, 0.32),
    CardItemModel("2.3 Mile loop", Icons.work, 12, 0.24),
    CardItemModel("3.1 Mile loop (5k)", Icons.work, 12, 0.24),
    CardItemModel("6.2 Mile loop (10k)", Icons.work, 12, 0.24),
    CardItemModel("Feedback", Icons.work, 12, 0.24)
  ];
  static List<LatLng> latlngStartingPoints = List();
  static List<LatLng> point_A_List = List();
  static List<LatLng> point_B_List = List();
  static List<LatLng> point_C_List = List();
  static List<LatLng> point_CA_List = List();
  static List<LatLng> point_CB_List = List();
  static List<LatLng> point_D_List = List();
  static List<LatLng> point_E_List = List();
  static List<LatLng> point_F_List = List();
  static List<LatLng> point_G_List = List();
  static List<LatLng> point_H_List = List();
  static List<LatLng> point_I_List = List();
  static List<List<LatLng>> all_points_List = List();

  /****************************   0.25 mile route  ***********************************8 */
 
  /****************************   0.25 mile route  ***********************************8 */
  static LatLng point_A_1 = LatLng(39.729556, -89.617305);
  static LatLng point_A_2 = LatLng(39.729041, -89.616875);
  static LatLng point_A_3 = LatLng(39.729072, -89.616031);
  static LatLng point_A_4 = LatLng(39.729674, -89.615589);
  static LatLng point_A_5 = LatLng(39.730176, -89.616081);
  static LatLng point_A_6 = LatLng(39.730210, -89.616847);

/****************************   0.5 mile route  ***********************************8 */
  static LatLng point_B_1 = LatLng(39.729563, -89.617288);
  static LatLng point_B_2 = LatLng(39.729055, -89.616878);
  static LatLng point_B_3 = LatLng(39.729132, -89.613494);
  static LatLng point_B_4 = LatLng(39.729724, -89.613653);
  static LatLng point_B_5 = LatLng(39.729696, -89.615549);
  static LatLng point_B_6 = LatLng(39.730177, -89.616051);
  static LatLng point_B_7 = LatLng(39.730192, -89.616835);
  static LatLng point_B_8 = LatLng(39.729563, -89.617288);

/****************************   0.8 mile route  ***********************************8 */
  static LatLng point_CA_1 = LatLng(39.730428, -89.619990);
  static LatLng point_CA_2 = LatLng(39.730454, -89.619775);
  static LatLng point_CA_3 = LatLng(39.730375, -89.619549);
  static LatLng point_CA_4 = LatLng(39.730112, -89.619275);
  static LatLng point_CA_5 = LatLng(39.729843, -89.618977);
  static LatLng point_CA_6 = LatLng(39.729742, -89.618728);
  static LatLng point_CA_7 = LatLng(39.729745, -89.618199);
  static LatLng point_CA_8 = LatLng(39.730035, -89.618022);
  static LatLng point_CA_9 = LatLng(39.730235, -89.618016);
  static LatLng point_CA_10 = LatLng(39.730602, -89.618206);
  static LatLng point_CA_11 = LatLng(39.730950, -89.618409);
  static LatLng point_CA_12 = LatLng(39.731091, -89.618416);
  static LatLng point_CA_13 = LatLng(39.731269, -89.618286);
  static LatLng point_CA_14 = LatLng(39.731316, -89.617074);
  static LatLng point_CA_15 = LatLng(39.729692, -89.615527);
  static LatLng point_CA_16 = LatLng(39.729066, -89.616037);
  static LatLng point_CA_17 = LatLng(39.728990, -89.618733);
  static LatLng point_CA_18 = LatLng(39.729217, -89.618960);
  static LatLng point_CA_19 = LatLng(39.729211, -89.619419);
  static LatLng point_CA_20 = LatLng(39.729472, -89.619750);
  static LatLng point_CA_21 = LatLng(39.729627, -89.620539);

/****************************   1 mile route  ***********************************8 */

  static LatLng point_CB_1 = LatLng(39.729044, -89.616902);
  static LatLng point_CB_2 = LatLng(39.729077, -89.615070);
  static LatLng point_CB_3 = LatLng(39.728649, -89.615032);
  static LatLng point_CB_4 = LatLng(39.728494, -89.614711);
  static LatLng point_CB_5 = LatLng(39.728229, -89.614512);

  static LatLng point_CB_6 = LatLng(39.728267, -89.614247);
  static LatLng point_CB_7 = LatLng(39.728310, -89.613140);
  static LatLng point_CB_8 = LatLng(39.729027, -89.613198);
  static LatLng point_CB_9 = LatLng(39.729130, -89.613101);
  static LatLng point_CB_10 = LatLng(39.729123, -89.613574);

  static LatLng point_CB_11 = LatLng(39.729737, -89.613607);
  static LatLng point_CB_12 = LatLng(39.729686, -89.615458);
  static LatLng point_CB_13 = LatLng(39.729667, -89.616299);
  static LatLng point_CB_14 = LatLng(39.729824, -89.616461);
  static LatLng point_CB_15 = LatLng(39.729771, -89.617279);

  static LatLng point_CB_16 = LatLng(39.729733, -89.617210);

  static LatLng point_CB_17 = LatLng(39.729720, -89.618540);

  static LatLng point_CB_18 = LatLng(39.729878, -89.619035);

  static LatLng point_CB_19 = LatLng(39.730335, -89.619504);

  static LatLng point_CB_20 = LatLng(39.730452, -89.619725);

  static LatLng point_CB_21 = LatLng(39.730467, -89.619992);

  static LatLng point_CB_22 = LatLng(39.729675, -89.620510);

  static LatLng point_CB_23 = LatLng(39.729447, -89.619687);

  static LatLng point_CB_24 = LatLng(39.729345, -89.619533);

  static LatLng point_CB_25 = LatLng(39.728978, -89.619230);

  static LatLng point_CB_26 = LatLng(39.728978, -89.618925);

  static LatLng point_CB_27 = LatLng(39.727754, -89.618869);

  static LatLng point_CB_28 = LatLng(39.727783, -89.617846);

  static LatLng point_CB_29 = LatLng(39.728702, -89.617884);

  static LatLng point_CB_30 = LatLng(39.729023, -89.617694);

  static LatLng point_CB_31 = LatLng(39.729052, -89.616976);

/****************************   1(2) mile route  ***********************************8 */
  static LatLng point_C_1 = LatLng(39.726573, -89.625264);
  static LatLng point_C_2 = LatLng(39.728643, -89.625255);
  static LatLng point_C_3 = LatLng(39.728799, -89.619374);
  static LatLng point_C_4 = LatLng(39.728990, -89.619226);
  static LatLng point_C_5 = LatLng(39.729025, -89.617656);
  static LatLng point_C_6 = LatLng(39.728689, -89.617887);
  static LatLng point_C_7 = LatLng(39.727779, -89.617844);
  static LatLng point_C_8 = LatLng(39.727755, -89.618858);
  static LatLng point_C_9 = LatLng(39.726981, -89.618831);
  static LatLng point_C_10 = LatLng(39.727446, -89.619960);
  static LatLng point_C_10A = LatLng(39.727525, -89.620660);

  static LatLng point_C_11 = LatLng(39.726634, -89.620648);
  static LatLng point_C_12 = LatLng(39.726512, -89.625277);
  static LatLng point_C_13 = LatLng(39.728654, -89.625308);

  /****************************   1.5 mile route  ***********************************8 */

  static LatLng point_D_1 = LatLng(39.729984, -89.618408);
  static LatLng point_D_2 = LatLng(39.729913, -89.618607);
  static LatLng point_D_3 = LatLng(39.730110, -89.618912);

  static LatLng point_D_4 = LatLng(39.730451, -89.619037);

  static LatLng point_D_5 = LatLng(39.730695, -89.619065);

  static LatLng point_D_6 = LatLng(39.731062, -89.619383);

  static LatLng point_D_7 = LatLng(39.730829, -89.619688);

  static LatLng point_D_8 = LatLng(39.730554, -89.619898);

  static LatLng point_D_9 = LatLng(39.729679, -89.620491);

  static LatLng point_D_10 = LatLng(39.730061, -89.621477);

  static LatLng point_D_11 = LatLng(39.730885, -89.620917);

  static LatLng point_D_12 = LatLng(39.730061, -89.621477);
  static LatLng point_D_13 = LatLng(39.730543, -89.619967);

  static LatLng point_D_14 = LatLng(39.730882, -89.619720);

  static LatLng point_D_15 = LatLng(39.731219, -89.619296);

  static LatLng point_D_16 = LatLng(39.731297, -89.618369);
  static LatLng point_D_17 = LatLng(39.732098, -89.618424);
  static LatLng point_D_18 = LatLng(39.732134, -89.617211);
  static LatLng point_D_19 = LatLng(39.731339, -89.617171);
  static LatLng point_D_20 = LatLng(39.731269, -89.616758);

  static LatLng point_D_21 = LatLng(39.730935, -89.615830);

  static LatLng point_D_22 = LatLng(39.730746, -89.615494);

  static LatLng point_D_23 = LatLng(39.731859, -89.614132);

  static LatLng point_D_24 = LatLng(39.731833, -89.613900);

  static LatLng point_D_25 = LatLng(39.731058, -89.613106);

  static LatLng point_D_26 = LatLng(39.730453, -89.612740);

  static LatLng point_D_27 = LatLng(39.730293, -89.612813);

  static LatLng point_D_28 = LatLng(39.729780, -89.614847);

  static LatLng point_D_29 = LatLng(39.730601, -89.615543);

  static LatLng point_D_30 = LatLng(39.730832, -89.615761);

  static LatLng point_D_31 = LatLng(39.731236, -89.616974);

  static LatLng point_D_32 = LatLng(39.731259, -89.618369);

  static LatLng point_D_33 = LatLng(39.731222, -89.618887);

  static LatLng point_D_34 = LatLng(39.731103, -89.619282);

  static LatLng point_D_35 = LatLng(39.730727, -89.618988);

  static LatLng point_D_36 = LatLng(39.730479, -89.618444);
  static LatLng point_D_37 = LatLng(39.730086, -89.618217);

/****************************   1.5(2) mile route  ***********************************8 */

  static LatLng point_E_1 = LatLng(39.728794, -89.620791);
  static LatLng point_E_2 = LatLng(39.728818, -89.619447);
  static LatLng point_E_3 = LatLng(39.728727, -89.619336);
  static LatLng point_E_4 = LatLng(39.728665, -89.618922);
  static LatLng point_E_5 = LatLng(39.728716, -89.617415);
  static LatLng point_E_6 = LatLng(39.728296, -89.616796);
  static LatLng point_E_7 = LatLng(39.728301, -89.615968);
  static LatLng point_E_8 = LatLng(39.725025, -89.615848);
  static LatLng point_E_9 = LatLng(39.724774, -89.617286);
  static LatLng point_E_10 = LatLng(39.724599, -89.625269);
  static LatLng point_E_11 = LatLng(39.728675, -89.625388);

  /****************************   2 mile route  ***********************************8 */

  static LatLng point_F_1 = LatLng(39.728680, -89.625343);
  static LatLng point_F_2 = LatLng(39.732725, -89.625396);
  static LatLng point_F_3 = LatLng(39.732716, -89.623404);
  static LatLng point_F_4 = LatLng(39.733184, -89.622347);
  static LatLng point_F_5 = LatLng(39.733237, -89.621682);
  static LatLng point_F_6 = LatLng(39.733007, -89.620869);

  static LatLng point_F_7 = LatLng(39.731142, -89.619453);
  static LatLng point_F_8 = LatLng(39.731309, -89.618585);

  static LatLng point_F_9 = LatLng(39.731321, -89.617034);
  static LatLng point_F_10 = LatLng(39.730745, -89.615532);
  static LatLng point_F_11 = LatLng(39.731893, -89.614040);
  static LatLng point_F_12 = LatLng(39.730426, -89.612772);
  static LatLng point_F_13 = LatLng(39.730036, -89.613925);

  static LatLng point_F_14 = LatLng(39.729750, -89.613922);
  static LatLng point_F_15 = LatLng(39.729708, -89.615603);
  static LatLng point_F_16 = LatLng(39.729074, -89.616021);
  static LatLng point_F_17 = LatLng(39.729039, -89.617453);
  static LatLng point_F_18 = LatLng(39.729179, -89.617575);

  static LatLng point_F_19 = LatLng(39.729174, -89.617770);
  static LatLng point_F_20 = LatLng(39.729023, -89.617878);
  static LatLng point_F_21 = LatLng(39.728996, -89.618926);
  static LatLng point_F_22 = LatLng(39.727937, -89.618886);
  static LatLng point_F_23 = LatLng(39.727832, -89.622739);

  static LatLng point_F_24 = LatLng(39.728509, -89.622767);
  static LatLng point_F_25 = LatLng(39.728477, -89.624391);
  static LatLng point_F_26 = LatLng(39.728717, -89.624418);

/****************************   2.3 mile route  ***********************************8 */
  static LatLng point_G_0 = LatLng(39.728680, -89.625343);
  static LatLng point_G_1 = LatLng(39.732725, -89.625396);
  static LatLng point_G_2 = LatLng(39.732716, -89.623404);
  static LatLng point_G_3 = LatLng(39.733184, -89.622347);
  static LatLng point_G_4 = LatLng(39.733237, -89.621682);
  static LatLng point_G_5 = LatLng(39.733007, -89.620869);
  static LatLng point_G_6 = LatLng(39.732656, -89.620433);
  static LatLng point_G_7 = LatLng(39.733200, -89.618810);
  static LatLng point_G_8 = LatLng(39.733257, -89.616731);
  static LatLng point_G_9 = LatLng(39.732898, -89.615240);
  static LatLng point_G_10 = LatLng(39.732357, -89.614173);
  static LatLng point_G_11 = LatLng(39.731291, -89.612968);
  static LatLng point_G_12 = LatLng(39.729693, -89.612178);
  static LatLng point_G_13 = LatLng(39.727416, -89.612523);
  static LatLng point_G_14 = LatLng(39.725996, -89.613853);
  static LatLng point_G_15 = LatLng(39.724859, -89.616568);
  static LatLng point_G_16 = LatLng(39.724583, -89.625286);
  static LatLng point_G_17 = LatLng(39.728680, -89.625343);
  /****************************  3.1 mile(5k) route  *********************************** */

  static LatLng point_H_1 = LatLng(39.729975, -89.618415);
  static LatLng point_H_2 = LatLng(39.730083, -89.618265);
  static LatLng point_H_3 = LatLng(39.730423, -89.618421);
  static LatLng point_H_4 = LatLng(39.730706, -89.619023);
  static LatLng point_H_5 = LatLng(39.731208, -89.619338);
  static LatLng point_H_6 = LatLng(39.732656, -89.620433);

  static LatLng point_H_7 = LatLng(39.733200, -89.618810);
  static LatLng point_H_8 = LatLng(39.733257, -89.616731);
  static LatLng point_H_9 = LatLng(39.732898, -89.615240);
  static LatLng point_H_10 = LatLng(39.732357, -89.614173);
  static LatLng point_H_11 = LatLng(39.731291, -89.612968);

  static LatLng point_H_12 = LatLng(39.729693, -89.612178);
  static LatLng point_H_13 = LatLng(39.727416, -89.612523);
  static LatLng point_H_14 = LatLng(39.725996, -89.613853);
  static LatLng point_H_15 = LatLng(39.724859, -89.616568);
  static LatLng point_H_16 = LatLng(39.724583, -89.625286);

  static LatLng point_H_17 = LatLng(39.728680, -89.625343);
  static LatLng point_H_18 = LatLng(39.728783, -89.620733);

/****************************   6.2 mile(10k) route  ******************** *************** */
  static LatLng point_I_1 = LatLng(39.724724, -89.620589);
  static LatLng point_I_2 = LatLng(39.724824, -89.616928);
  static LatLng point_I_3 = LatLng(39.724973, -89.615995);
  static LatLng point_I_4 = LatLng(39.714615, -89.615796);
  static LatLng point_I_5 = LatLng(39.714344, -89.617204);
  static LatLng point_I_6 = LatLng(39.714194, -89.623675);
  static LatLng point_I_7 = LatLng(39.715392, -89.625275);
  static LatLng point_I_8 = LatLng(39.715795, -89.626391);

  static LatLng point_I_9 = LatLng(39.717001, -89.625372);
  static LatLng point_I_10 = LatLng(39.718355, -89.622540);
  static LatLng point_I_11 = LatLng(39.724271, -89.625337);
  static LatLng point_I_12 = LatLng(39.728668, -89.625333);
  static LatLng point_I_13 = LatLng(39.728800, -89.629931);

  static LatLng point_I_14 = LatLng(39.732563, -89.629975);
  static LatLng point_I_15 = LatLng(39.732701, -89.625547);
  static LatLng point_I_16 = LatLng(39.732700, -89.623699);
  static LatLng point_I_17 = LatLng(39.733229, -89.621507);
  static LatLng point_I_18 = LatLng(39.731173, -89.619459);

  static LatLng point_I_19 = LatLng(39.730677, -89.619029);
  static LatLng point_I_20 = LatLng(39.730213, -89.618954);
  static LatLng point_I_21 = LatLng(39.729945, -89.618559);
  static LatLng point_I_22 = LatLng(39.730070, -89.618251);
  static LatLng point_I_23 = LatLng(39.730405, -89.618394);

  static LatLng point_I_24 = LatLng(39.730725, -89.619017);
  static LatLng point_I_25 = LatLng(39.732696, -89.620496);
  static LatLng point_I_26 = LatLng(39.733321, -89.617962);
  static LatLng point_I_27 = LatLng(39.733309, -89.616446);
  static LatLng point_I_28 = LatLng(39.734059, -89.616173);

  static LatLng point_I_29 = LatLng(39.738300, -89.616233);
  static LatLng point_I_30 = LatLng(39.738428, -89.612513);
  static LatLng point_I_31 = LatLng(39.737820, -89.612723);
  static LatLng point_I_32 = LatLng(39.737524, -89.614730);
  static LatLng point_I_33 = LatLng(39.736541, -89.614792);

  static LatLng point_I_34 = LatLng(39.736395, -89.616174);
  static LatLng point_I_35 = LatLng(39.733867, -89.616212);
  static LatLng point_I_36 = LatLng(39.733098, -89.616310);
  static LatLng point_I_37 = LatLng(39.731342, -89.616123);
  static LatLng point_I_38 = LatLng(39.731040, -89.616184);

  static LatLng point_I_39 = LatLng(39.730727, -89.615560);
  static LatLng point_I_40 = LatLng(39.730197, -89.616080);
  static LatLng point_I_41 = LatLng(39.729675, -89.615570);
  static LatLng point_I_42 = LatLng(39.729048, -89.616057);
  static LatLng point_I_43 = LatLng(39.728349, -89.616014);

  static LatLng point_I_44 = LatLng(39.728239, -89.615740);
  static LatLng point_I_45 = LatLng(39.727884, -89.615897);
  static LatLng point_I_46 = LatLng(39.725015, -89.615844);
  static LatLng point_I_47 = LatLng(39.724853, -89.616673);

  
static void addingListLatLong(){
  /****************************   0.25 mile route  ***********************************8 */
    point_A_List.add(point_A_1);
    point_A_List.add(point_A_2);
    point_A_List.add(point_A_3);
    point_A_List.add(point_A_4);
    point_A_List.add(point_A_5);
    point_A_List.add(point_A_6);
    point_A_List.add(point_A_1);
    all_points_List.add(point_A_List);

/****************************   0.5 mile route  *********************************** */
    point_B_List.add(point_B_1);
    point_B_List.add(point_B_2);
    point_B_List.add(point_B_3);
    point_B_List.add(point_B_4);
    point_B_List.add(point_B_5);
    point_B_List.add(point_B_6);
    point_B_List.add(point_B_7);
    point_B_List.add(point_B_8);
    all_points_List.add(point_B_List);

/****************************   .8 mile   *********************************** */
    point_CA_List.add(point_CA_1);
    point_CA_List.add(point_CA_2);
    point_CA_List.add(point_CA_3);
    point_CA_List.add(point_CA_4);
    point_CA_List.add(point_CA_5);
    point_CA_List.add(point_CA_6);
    point_CA_List.add(point_CA_7);
    point_CA_List.add(point_CA_8);
    point_CA_List.add(point_CA_9);
    point_CA_List.add(point_CA_10);
    point_CA_List.add(point_CA_11);
    point_CA_List.add(point_CA_12);
    point_CA_List.add(point_CA_13);
    point_CA_List.add(point_CA_14);
    point_CA_List.add(point_CA_15);
    point_CA_List.add(point_CA_16);
    point_CA_List.add(point_CA_17);
    point_CA_List.add(point_CA_18);
    point_CA_List.add(point_CA_19);
    point_CA_List.add(point_CA_20);
    point_CA_List.add(point_CA_21);
    point_CA_List.add(point_CA_1);
    all_points_List.add(point_CA_List);
/****************************   1 mile   *********************************** */
    point_CB_List.add(point_CB_1);
    point_CB_List.add(point_CB_2);
    point_CB_List.add(point_CB_3);
    point_CB_List.add(point_CB_4);
    point_CB_List.add(point_CB_5);
    point_CB_List.add(point_CB_6);
    point_CB_List.add(point_CB_7);
    point_CB_List.add(point_CB_8);
    point_CB_List.add(point_CB_9);
    point_CB_List.add(point_CB_10);
    point_CB_List.add(point_CB_11);
    point_CB_List.add(point_CB_12);
    point_CB_List.add(point_CB_13);
    point_CB_List.add(point_CB_14);
    point_CB_List.add(point_CB_15);
    point_CB_List.add(point_CB_16);
    point_CB_List.add(point_CB_17);
    point_CB_List.add(point_CB_18);
    point_CB_List.add(point_CB_19);
    point_CB_List.add(point_CB_20);
    point_CB_List.add(point_CB_21);
    point_CB_List.add(point_CB_22);
    point_CB_List.add(point_CB_23);
    point_CB_List.add(point_CB_24);
    point_CB_List.add(point_CB_25);
    point_CB_List.add(point_CB_26);
    point_CB_List.add(point_CB_27);
    point_CB_List.add(point_CB_28);
    point_CB_List.add(point_CB_29);
    point_CB_List.add(point_CB_30);
    point_CB_List.add(point_CB_31);
    point_CB_List.add(point_CB_1);
    all_points_List.add(point_CB_List);

/****************************   1 mile (2)  *********************************** */
    point_C_List.add(point_C_1);
    point_C_List.add(point_C_2);
    point_C_List.add(point_C_3);
    point_C_List.add(point_C_4);
    point_C_List.add(point_C_5);
    point_C_List.add(point_C_6);
    point_C_List.add(point_C_7);
    point_C_List.add(point_C_8);
    point_C_List.add(point_C_9);
    point_C_List.add(point_C_10);
    point_C_List.add(point_C_10A);
    point_C_List.add(point_C_11);
    point_C_List.add(point_C_1);
    all_points_List.add(point_C_List);

/****************************   1.5 mile  *********************************** */

    point_D_List.add(point_D_1);
    point_D_List.add(point_D_2);
    point_D_List.add(point_D_3);
    point_D_List.add(point_D_4);
    point_D_List.add(point_D_5);
    point_D_List.add(point_D_6);
    point_D_List.add(point_D_7);
    point_D_List.add(point_D_8);
    point_D_List.add(point_D_9);
    point_D_List.add(point_D_10);

    point_D_List.add(point_D_11);
    point_D_List.add(point_D_12);
    point_D_List.add(point_D_13);
    point_D_List.add(point_D_14);
    point_D_List.add(point_D_15);
    point_D_List.add(point_D_16);
    point_D_List.add(point_D_17);
    point_D_List.add(point_D_18);
    point_D_List.add(point_D_19);
    point_D_List.add(point_D_20);

    point_D_List.add(point_D_21);
    point_D_List.add(point_D_22);
    point_D_List.add(point_D_23);
    point_D_List.add(point_D_24);
    point_D_List.add(point_D_25);
    point_D_List.add(point_D_26);
    point_D_List.add(point_D_27);
    point_D_List.add(point_D_28);
    point_D_List.add(point_D_29);
    point_D_List.add(point_D_30);

    point_D_List.add(point_D_31);
    point_D_List.add(point_D_32);
    point_D_List.add(point_D_33);
    point_D_List.add(point_D_34);
    point_D_List.add(point_D_35);
    point_D_List.add(point_D_36);
    point_D_List.add(point_D_37);

    all_points_List.add(point_D_List);

/****************************   1.5 mile (2)  *********************************** */

    point_E_List.add(point_E_1);
    point_E_List.add(point_E_2);
    point_E_List.add(point_E_3);
    point_E_List.add(point_E_4);
    point_E_List.add(point_E_5);
    point_E_List.add(point_E_6);
    point_E_List.add(point_E_7);
    point_E_List.add(point_E_8);
    point_E_List.add(point_E_9);
    point_E_List.add(point_E_10);
    point_E_List.add(point_E_11);
    point_E_List.add(point_E_1);
    all_points_List.add(point_E_List);
/****************************   2 mile  *********************************** */

    point_F_List.add(point_F_1);
    point_F_List.add(point_F_2);
    point_F_List.add(point_F_3);
    point_F_List.add(point_F_4);
    point_F_List.add(point_F_5);
    point_F_List.add(point_F_6);
    point_F_List.add(point_F_7);
    point_F_List.add(point_F_8);
    point_F_List.add(point_F_9);
    point_F_List.add(point_F_10);
    point_F_List.add(point_F_11);
    point_F_List.add(point_F_12);
    point_F_List.add(point_F_13);
    point_F_List.add(point_F_14);
    point_F_List.add(point_F_15);
    point_F_List.add(point_F_16);
    point_F_List.add(point_F_17);
    point_F_List.add(point_F_18);
    point_F_List.add(point_F_19);

    point_F_List.add(point_F_20);
    point_F_List.add(point_F_21);
    point_F_List.add(point_F_22);
    point_F_List.add(point_F_23);
    point_F_List.add(point_F_24);
    point_F_List.add(point_F_25);
    point_F_List.add(point_F_26);
    point_F_List.add(point_F_1);
    all_points_List.add(point_F_List);
/****************************   2.3 mile  *********************************** */
    point_G_List.add(point_G_0);
    point_G_List.add(point_G_1);
    point_G_List.add(point_G_2);
    point_G_List.add(point_G_3);
    point_G_List.add(point_G_4);
    point_G_List.add(point_G_5);
    point_G_List.add(point_G_6);
    point_G_List.add(point_G_7);
    point_G_List.add(point_G_8);
    point_G_List.add(point_G_9);
    point_G_List.add(point_G_10);
    point_G_List.add(point_G_11);
    point_G_List.add(point_G_12);
    point_G_List.add(point_G_13);
    point_G_List.add(point_G_14);
    point_G_List.add(point_G_15);
    point_G_List.add(point_G_16);
    point_G_List.add(point_G_17);

    all_points_List.add(point_G_List);
/****************************   3.1 mile(5k)  *********************************** */
    point_H_List.add(point_H_1);
    point_H_List.add(point_H_2);
    point_H_List.add(point_H_3);
    point_H_List.add(point_H_4);
    point_H_List.add(point_H_5);
    point_H_List.add(point_H_6);
    point_H_List.add(point_H_7);
    point_H_List.add(point_H_8);
    point_H_List.add(point_H_9);
    point_H_List.add(point_H_10);
    point_H_List.add(point_H_11);
    point_H_List.add(point_H_12);
    point_H_List.add(point_H_13);
    point_H_List.add(point_H_14);
    point_H_List.add(point_H_15);
    point_H_List.add(point_H_16);
    point_H_List.add(point_H_17);
    point_H_List.add(point_H_18);
    all_points_List.add(point_H_List);
/****************************   6.2 mile(10k)  *********************************** */
    point_I_List.add(point_I_1);
    point_I_List.add(point_I_2);
    point_I_List.add(point_I_3);
    point_I_List.add(point_I_4);
    point_I_List.add(point_I_5);
    point_I_List.add(point_I_6);
    point_I_List.add(point_I_7);

    point_I_List.add(point_I_9);
    point_I_List.add(point_I_10);

    point_I_List.add(point_I_11);
    point_I_List.add(point_I_12);
    point_I_List.add(point_I_13);
    point_I_List.add(point_I_14);
    point_I_List.add(point_I_15);

    point_I_List.add(point_I_16);
    point_I_List.add(point_I_17);
    point_I_List.add(point_I_18);
    point_I_List.add(point_I_19);
    point_I_List.add(point_I_20);

    point_I_List.add(point_I_21);
    point_I_List.add(point_I_22);
    point_I_List.add(point_I_23);
    point_I_List.add(point_I_24);
    point_I_List.add(point_I_25);

    point_I_List.add(point_I_26);
    point_I_List.add(point_I_27);
    point_I_List.add(point_I_28);
    point_I_List.add(point_I_29);
    point_I_List.add(point_I_30);

    point_I_List.add(point_I_31);
    point_I_List.add(point_I_32);
    point_I_List.add(point_I_33);
    point_I_List.add(point_I_34);
    point_I_List.add(point_I_35);

    point_I_List.add(point_I_36);
    point_I_List.add(point_I_37);
    point_I_List.add(point_I_38);
    point_I_List.add(point_I_39);
    point_I_List.add(point_I_40);

    point_I_List.add(point_I_41);
    point_I_List.add(point_I_42);
    point_I_List.add(point_I_43);
    point_I_List.add(point_I_44);
    point_I_List.add(point_I_45);

    point_I_List.add(point_I_46);
    point_I_List.add(point_I_47);

    all_points_List.add(point_I_List);
}
static bool isEmail(String em) {

  String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);

  return regExp.hasMatch(em);
}
}