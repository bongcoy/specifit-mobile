import 'package:flutter/material.dart';
import 'package:specifit/src/presentation/widgets/search_box.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return GestureDetector(
    return SafeArea(
      // onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        // key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Column(
            children: [
              Container(
                width: 360,
                height: 152,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF810D),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1.1, 1.79),
                      child: Image.asset(
                        'assets/images/element_workout_2.png',
                        width: 91,
                        height: 92,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          142.5, 41.21, 0, 1.14),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/element_workout_header.png',
                          width: 255,
                          height: 111.93,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          18, 69, 231, 50),
                      child: Text(
                        'Olahraga',
                        style: TextStyle(
                              fontFamily: 'Open Sans',
                              color: Colors.white,
                              fontSize: 24,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              SearchBox(),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      width: 100,
                      height: 43,
                      decoration: const BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 15, 0, 0),
                            child: Text(
                              'Olahraga',
                              style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontSize: 16,
                                  ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(194, 10, 16, 0),
                            child: Text(
                              'Lihat Semua',
                              style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    color: Color(0xFFFF810D),
                                    fontSize: 10,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                              child: Container(
                                width: 50,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF1F4F8),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                              child: ListView(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 16, 0),
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 1,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Container(
                                        width: 328,
                                        height: 88,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                        ),
                                        child: SizedBox(
                                          width: 328,
                                          height: 88,
                                          child: Stack(
                                            children: [
                                              const Align(
                                                alignment: AlignmentDirectional(
                                                    -1.99, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(137, 8, 18, 55),
                                                  child: Text(
                                                    'Auto Sixpath by Rapli',
                                                    style: TextStyle(
                                                          fontFamily:
                                                              'Open Sans',
                                                          color:
                                                              Color(0xFF14181B),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              const Align(
                                                alignment: AlignmentDirectional(
                                                    -0.15, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(50, 55, 0, 15),
                                                  child: Text(
                                                    '.',
                                                    style: TextStyle(
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              const Align(
                                                alignment: AlignmentDirectional(
                                                    -1.43, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          130, 23, 129, 35),
                                                  child: Text(
                                                    'Abs',
                                                    style: TextStyle(
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              const Align(
                                                alignment: AlignmentDirectional(
                                                    -0.15, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(110, 55, 0, 15),
                                                  child: Text(
                                                    '4 Olahraga',
                                                    style: TextStyle(
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              const Align(
                                                alignment: AlignmentDirectional(
                                                    -0.15, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          110, 55, 160, 15),
                                                  child: Text(
                                                    '15 Menit',
                                                    style: TextStyle(
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              const Align(
                                                alignment: AlignmentDirectional(
                                                    -0.36, 0.64),
                                                child: Icon(
                                                  Icons.watch_later_outlined,
                                                  color: Colors.black,
                                                  size: 16,
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Padding(   
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(11, 8, 277, 8),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.asset(
                                                      'assets/images/element_workout_abs.png',
                                                      width: 79,
                                                      height: 79,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 16, 0),
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 1,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Container(
                                        width: 328,
                                        height: 88,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                        ),
                                        child: SizedBox(
                                          width: 328,
                                          height: 88,
                                          child: Stack(
                                            children: [
                                              const Align(
                                                alignment: AlignmentDirectional(
                                                    -1.99, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(137, 8, 18, 55),
                                                  child: Text(
                                                    'Auto Sixpath by Rapli',
                                                    style: TextStyle(
                                                          fontFamily:
                                                              'Open Sans',
                                                          color:
                                                              Color(0xFF14181B),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              const Align(
                                                alignment: AlignmentDirectional(
                                                    -0.15, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(50, 55, 0, 15),
                                                  child: Text(
                                                    '.',
                                                    style: TextStyle(
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              const Align(
                                                alignment: AlignmentDirectional(
                                                    -1.43, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          130, 23, 129, 35),
                                                  child: Text(
                                                    'Abs',
                                                    style: TextStyle(
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              const Align(
                                                alignment: AlignmentDirectional(
                                                    -0.15, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(110, 55, 0, 15),
                                                  child: Text(
                                                    '4 Olahraga',
                                                    style: TextStyle(
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              const Align(
                                                alignment: AlignmentDirectional(
                                                    -0.15, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          110, 55, 160, 15),
                                                  child: Text(
                                                    '15 Menit',
                                                    style: TextStyle(
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              const Align(
                                                alignment: AlignmentDirectional(
                                                    -0.36, 0.64),
                                                child: Icon(
                                                  Icons.watch_later_outlined,
                                                  color: Colors.black,
                                                  size: 16,
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Padding(   
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(11, 8, 277, 8),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.asset(
                                                      'assets/images/element_workout_abs.png',
                                                      width: 79,
                                                      height: 79,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 16, 0),
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 1,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Container(
                                        width: 328,
                                        height: 88,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                        ),
                                        child: SizedBox(
                                          width: 328,
                                          height: 88,
                                          child: Stack(
                                            children: [
                                              const Align(
                                                alignment: AlignmentDirectional(
                                                    -1.99, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(137, 8, 18, 55),
                                                  child: Text(
                                                    'Auto Sixpath by Rapli',
                                                    style: TextStyle(
                                                          fontFamily:
                                                              'Open Sans',
                                                          color:
                                                              Color(0xFF14181B),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              const Align(
                                                alignment: AlignmentDirectional(
                                                    -0.15, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(50, 55, 0, 15),
                                                  child: Text(
                                                    '.',
                                                    style: TextStyle(
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              const Align(
                                                alignment: AlignmentDirectional(
                                                    -1.43, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          130, 23, 129, 35),
                                                  child: Text(
                                                    'Abs',
                                                    style: TextStyle(
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              const Align(
                                                alignment: AlignmentDirectional(
                                                    -0.15, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(110, 55, 0, 15),
                                                  child: Text(
                                                    '4 Olahraga',
                                                    style: TextStyle(
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              const Align(
                                                alignment: AlignmentDirectional(
                                                    -0.15, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          110, 55, 160, 15),
                                                  child: Text(
                                                    '15 Menit',
                                                    style: TextStyle(
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              const Align(
                                                alignment: AlignmentDirectional(
                                                    -0.36, 0.64),
                                                child: Icon(
                                                  Icons.watch_later_outlined,
                                                  color: Colors.black,
                                                  size: 16,
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Padding(   
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(11, 8, 277, 8),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.asset(
                                                      'assets/images/element_workout_abs.png',
                                                      width: 79,
                                                      height: 79,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

