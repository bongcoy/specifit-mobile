import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsetsDirectional.fromSTEB(
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
                        fontFamily: 'Open Sans',
                        color: Color(0xFF14181B),
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
                        fontFamily: 'Open Sans',
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
                        fontFamily: 'Open Sans',
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
                        fontFamily: 'Open Sans',
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
                        fontFamily: 'Open Sans',
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
                  const AlignmentDirectional(
                      0, 0),
                  child: Padding(
                    padding:
                    const EdgeInsetsDirectional
                        .fromSTEB(
                        11, 8, 277, 8),
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
    );
  }
}