import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/new_task_widget.dart';
import '/components/profile_widget.dart';
import '/components/task_details_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<UsersRow>>(
      future: UsersTable().querySingleRow(
        queryFn: (q) => q.eq(
          'id',
          currentUserUid,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<UsersRow> homePageUsersRowList = snapshot.data!;
        final homePageUsersRow =
            homePageUsersRowList.isNotEmpty ? homePageUsersRowList.first : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color(0x1E29A00A),
              ),
              child: Stack(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 12.0, 8.0, 12.0),
                        child: Container(
                          width: 400.0,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(24.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(24.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 12.0, 12.0, 12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        child: FutureBuilder<ApiCallResponse>(
                                          future: WeatherCall.call(),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            final userInfoRowWeatherResponse =
                                                snapshot.data!;
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            homePageUsersRow!
                                                                .firstName!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  fontSize:
                                                                      24.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                          Text(
                                                            homePageUsersRow!
                                                                .email!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  fontSize:
                                                                      14.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Weather',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                fontSize: 18.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          WeatherCall.celcius(
                                                            userInfoRowWeatherResponse
                                                                .jsonBody,
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'ºC',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 36.0, 0.0, 12.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await _model.pageViewController
                                              ?.animateToPage(
                                            0,
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.clear_all_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .warning,
                                                  size: 24.0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'AllTasks',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 18.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              FFAppState().allTasks.toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await _model.pageViewController
                                              ?.animateToPage(
                                            1,
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.star_border_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .warning,
                                                  size: 24.0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Important Tasks',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 18.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              FFAppState()
                                                  .importantTasks
                                                  .toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 36.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await _model.pageViewController
                                              ?.animateToPage(
                                            2,
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.done_all_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .warning,
                                                  size: 24.0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Completed Tasks',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 18.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              FFAppState()
                                                  .completedTasks
                                                  .toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1.0,
                                      color: Color(0x427F7F7F),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Divider(
                                      thickness: 1.0,
                                      color: Color(0x427F7F7F),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 12.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            GoRouter.of(context)
                                                .prepareAuthEvent();
                                            await authManager.signOut();
                                            GoRouter.of(context)
                                                .clearRedirectLocation();

                                            context.goNamedAuth('authorization',
                                                context.mounted);
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      GoRouter.of(context)
                                                          .prepareAuthEvent();
                                                      await authManager
                                                          .signOut();
                                                      GoRouter.of(context)
                                                          .clearRedirectLocation();

                                                      context.goNamedAuth(
                                                          'authorization',
                                                          context.mounted);
                                                    },
                                                    child: Icon(
                                                      Icons.output_rounded,
                                                      color: Color(0xFFD8E1E5),
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        GoRouter.of(context)
                                                            .prepareAuthEvent();
                                                        await authManager
                                                            .signOut();
                                                        GoRouter.of(context)
                                                            .clearRedirectLocation();

                                                        context.goNamedAuth(
                                                            'authorization',
                                                            context.mounted);
                                                      },
                                                      child: Text(
                                                        'Logout',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              fontSize: 18.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 12.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: ProfileWidget(
                                                    user: homePageUsersRow,
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                ProfileWidget(
                                                              user:
                                                                  homePageUsersRow,
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));
                                                    },
                                                    child: Icon(
                                                      Icons.settings_rounded,
                                                      color: Color(0xFFD8E1E5),
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  ProfileWidget(
                                                                user:
                                                                    homePageUsersRow,
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            setState(() {}));
                                                      },
                                                      child: Text(
                                                        'Account Settings',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              fontSize: 18.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 12.0, 12.0),
                          child: Container(
                            width: 100.0,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(24.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(24.0),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (_model.pageViewCurrentIndex == 0)
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await _model.pageViewController
                                                    ?.animateToPage(
                                                  0,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease,
                                                );
                                              },
                                              child: Text(
                                                'ALL TASKS',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 32.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                            ),
                                        ],
                                      ),
                                      if (_model.pageViewCurrentIndex == 1)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await _model.pageViewController
                                                  ?.animateToPage(
                                                1,
                                                duration:
                                                    Duration(milliseconds: 500),
                                                curve: Curves.ease,
                                              );
                                            },
                                            child: Text(
                                              'IMPORTANT TASKS',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Color(0xFF0A8EA0),
                                                    fontSize: 32.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      if (_model.pageViewCurrentIndex == 2)
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await _model.pageViewController
                                                ?.animateToPage(
                                              2,
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.ease,
                                            );
                                          },
                                          child: Text(
                                            'COMPLETED TASKS',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 32.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 40.0),
                                          child: PageView(
                                            controller: _model
                                                    .pageViewController ??=
                                                PageController(initialPage: 0),
                                            onPageChanged: (_) =>
                                                setState(() {}),
                                            scrollDirection: Axis.horizontal,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 24.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 751.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: FutureBuilder<
                                                            List<TasksRow>>(
                                                          future: (_model
                                                                      .requestCompleter3 ??=
                                                                  Completer<
                                                                      List<
                                                                          TasksRow>>()
                                                                    ..complete(
                                                                        TasksTable()
                                                                            .queryRows(
                                                                      queryFn: (q) =>
                                                                          q.order(
                                                                              'created_at'),
                                                                    )))
                                                              .future,
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<TasksRow>
                                                                allTasksListTasksRowList =
                                                                snapshot.data!;
                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  allTasksListTasksRowList
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  allTasksListIndex) {
                                                                final allTasksListTasksRow =
                                                                    allTasksListTasksRowList[
                                                                        allTasksListIndex];
                                                                return Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            12.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          enableDrag:
                                                                              false,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: TaskDetailsWidget(
                                                                                taskDetails: allTasksListTasksRow,
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            setState(() {}));
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            70.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              8.0,
                                                                              16.0,
                                                                              8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.0, 1.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 445.0,
                                                                                      height: 25.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: AutoSizeText(
                                                                                        allTasksListTasksRow.body!.maybeHandleOverflow(
                                                                                          maxChars: 100,
                                                                                          replacement: '…',
                                                                                        ),
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Stack(
                                                                                          children: [
                                                                                            if (allTasksListTasksRow.isImportant == false)
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                child: FFButtonWidget(
                                                                                                  onPressed: () async {
                                                                                                    await TasksTable().update(
                                                                                                      data: {
                                                                                                        'isImportant': true,
                                                                                                      },
                                                                                                      matchingRows: (rows) => rows.eq(
                                                                                                        'id',
                                                                                                        allTasksListTasksRow.id,
                                                                                                      ),
                                                                                                    );
                                                                                                    setState(() {
                                                                                                      FFAppState().importantTasks = FFAppState().importantTasks + 1;
                                                                                                    });
                                                                                                    setState(() => _model.requestCompleter3 = null);
                                                                                                    await _model.waitForRequestCompleted3();
                                                                                                    setState(() => _model.requestCompleter1 = null);
                                                                                                    await _model.waitForRequestCompleted1();
                                                                                                    setState(() => _model.requestCompleter2 = null);
                                                                                                    await _model.waitForRequestCompleted2();
                                                                                                  },
                                                                                                  text: 'Important',
                                                                                                  options: FFButtonOptions(
                                                                                                    width: 120.0,
                                                                                                    height: 20.0,
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                          fontFamily: 'Readex Pro',
                                                                                                          color: Colors.white,
                                                                                                        ),
                                                                                                    elevation: 3.0,
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Colors.transparent,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            if (allTasksListTasksRow.isImportant == true)
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                child: FFButtonWidget(
                                                                                                  onPressed: () async {
                                                                                                    await TasksTable().update(
                                                                                                      data: {
                                                                                                        'isImportant': false,
                                                                                                      },
                                                                                                      matchingRows: (rows) => rows.eq(
                                                                                                        'id',
                                                                                                        allTasksListTasksRow.id,
                                                                                                      ),
                                                                                                    );
                                                                                                    setState(() {
                                                                                                      FFAppState().importantTasks = FFAppState().importantTasks + -1;
                                                                                                    });
                                                                                                    setState(() => _model.requestCompleter3 = null);
                                                                                                    await _model.waitForRequestCompleted3();
                                                                                                    setState(() => _model.requestCompleter1 = null);
                                                                                                    await _model.waitForRequestCompleted1();
                                                                                                    setState(() => _model.requestCompleter2 = null);
                                                                                                    await _model.waitForRequestCompleted2();
                                                                                                  },
                                                                                                  text: 'Important',
                                                                                                  options: FFButtonOptions(
                                                                                                    width: 120.0,
                                                                                                    height: 20.0,
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    color: Color(0xFF0A8EA0),
                                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                          fontFamily: 'Readex Pro',
                                                                                                          color: Colors.white,
                                                                                                        ),
                                                                                                    elevation: 3.0,
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Colors.transparent,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                          ],
                                                                                        ),
                                                                                        Stack(
                                                                                          children: [
                                                                                            if (allTasksListTasksRow.isComplete == false)
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                child: FFButtonWidget(
                                                                                                  onPressed: () async {
                                                                                                    await TasksTable().update(
                                                                                                      data: {
                                                                                                        'isComplete': true,
                                                                                                      },
                                                                                                      matchingRows: (rows) => rows.eq(
                                                                                                        'id',
                                                                                                        allTasksListTasksRow.id,
                                                                                                      ),
                                                                                                    );
                                                                                                    setState(() {
                                                                                                      FFAppState().completedTasks = FFAppState().completedTasks + 1;
                                                                                                    });
                                                                                                    setState(() => _model.requestCompleter3 = null);
                                                                                                    await _model.waitForRequestCompleted3();
                                                                                                    setState(() => _model.requestCompleter1 = null);
                                                                                                    await _model.waitForRequestCompleted1();
                                                                                                    setState(() => _model.requestCompleter2 = null);
                                                                                                    await _model.waitForRequestCompleted2();
                                                                                                  },
                                                                                                  text: 'Completed',
                                                                                                  options: FFButtonOptions(
                                                                                                    width: 120.0,
                                                                                                    height: 20.0,
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                          fontFamily: 'Readex Pro',
                                                                                                          color: Colors.white,
                                                                                                        ),
                                                                                                    elevation: 3.0,
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Colors.transparent,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            if (allTasksListTasksRow.isComplete == true)
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                child: FFButtonWidget(
                                                                                                  onPressed: () async {
                                                                                                    await TasksTable().update(
                                                                                                      data: {
                                                                                                        'isComplete': false,
                                                                                                      },
                                                                                                      matchingRows: (rows) => rows.eq(
                                                                                                        'id',
                                                                                                        allTasksListTasksRow.id,
                                                                                                      ),
                                                                                                    );
                                                                                                    setState(() {
                                                                                                      FFAppState().completedTasks = FFAppState().completedTasks + -1;
                                                                                                    });
                                                                                                    setState(() => _model.requestCompleter3 = null);
                                                                                                    await _model.waitForRequestCompleted3();
                                                                                                    setState(() => _model.requestCompleter1 = null);
                                                                                                    await _model.waitForRequestCompleted1();
                                                                                                    setState(() => _model.requestCompleter2 = null);
                                                                                                    await _model.waitForRequestCompleted2();
                                                                                                  },
                                                                                                  text: 'Completed',
                                                                                                  options: FFButtonOptions(
                                                                                                    width: 120.0,
                                                                                                    height: 20.0,
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                          fontFamily: 'Readex Pro',
                                                                                                          color: Colors.white,
                                                                                                        ),
                                                                                                    elevation: 3.0,
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Colors.transparent,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                          ],
                                                                                        ),
                                                                                        FFButtonWidget(
                                                                                          onPressed: () async {
                                                                                            await TasksTable().delete(
                                                                                              matchingRows: (rows) => rows.eq(
                                                                                                'id',
                                                                                                allTasksListTasksRow.id,
                                                                                              ),
                                                                                            );
                                                                                            setState(() {
                                                                                              FFAppState().allTasks = FFAppState().allTasks + -1;
                                                                                            });
                                                                                            if (allTasksListTasksRow.isImportant!) {
                                                                                              setState(() {
                                                                                                FFAppState().importantTasks = FFAppState().importantTasks + -1;
                                                                                              });
                                                                                            }
                                                                                            if (allTasksListTasksRow.isComplete!) {
                                                                                              setState(() {
                                                                                                FFAppState().completedTasks = FFAppState().completedTasks + -1;
                                                                                              });
                                                                                            }
                                                                                            setState(() => _model.requestCompleter3 = null);
                                                                                            await _model.waitForRequestCompleted3();
                                                                                          },
                                                                                          text: 'Delete',
                                                                                          options: FFButtonOptions(
                                                                                            width: 120.0,
                                                                                            height: 20.0,
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                            color: Color(0xFFED1B2A),
                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  fontFamily: 'Readex Pro',
                                                                                                  color: Colors.white,
                                                                                                ),
                                                                                            elevation: 3.0,
                                                                                            borderSide: BorderSide(
                                                                                              color: Colors.transparent,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 24.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 751.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: FutureBuilder<
                                                            List<TasksRow>>(
                                                          future: (_model
                                                                      .requestCompleter1 ??=
                                                                  Completer<
                                                                      List<
                                                                          TasksRow>>()
                                                                    ..complete(
                                                                        TasksTable()
                                                                            .queryRows(
                                                                      queryFn: (q) => q
                                                                          .eq(
                                                                            'isImportant',
                                                                            true,
                                                                          )
                                                                          .order('created_at'),
                                                                    )))
                                                              .future,
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<TasksRow>
                                                                importantTasksListTasksRowList =
                                                                snapshot.data!;
                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  importantTasksListTasksRowList
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  importantTasksListIndex) {
                                                                final importantTasksListTasksRow =
                                                                    importantTasksListTasksRowList[
                                                                        importantTasksListIndex];
                                                                return Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            12.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          enableDrag:
                                                                              false,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: TaskDetailsWidget(
                                                                                taskDetails: importantTasksListTasksRow,
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            setState(() {}));
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            70.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              8.0,
                                                                              16.0,
                                                                              8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.0, 1.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 445.0,
                                                                                      height: 25.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: AutoSizeText(
                                                                                        importantTasksListTasksRow.body!.maybeHandleOverflow(
                                                                                          maxChars: 100,
                                                                                          replacement: '…',
                                                                                        ),
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Stack(
                                                                                          children: [
                                                                                            if (importantTasksListTasksRow.isImportant == false)
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                child: FFButtonWidget(
                                                                                                  onPressed: () async {
                                                                                                    await TasksTable().update(
                                                                                                      data: {
                                                                                                        'isImportant': true,
                                                                                                      },
                                                                                                      matchingRows: (rows) => rows.eq(
                                                                                                        'id',
                                                                                                        importantTasksListTasksRow.id,
                                                                                                      ),
                                                                                                    );
                                                                                                    setState(() {
                                                                                                      FFAppState().importantTasks = FFAppState().importantTasks + 1;
                                                                                                    });
                                                                                                    setState(() => _model.requestCompleter1 = null);
                                                                                                    await _model.waitForRequestCompleted1();
                                                                                                    setState(() => _model.requestCompleter1 = null);
                                                                                                    await _model.waitForRequestCompleted1();
                                                                                                    setState(() => _model.requestCompleter2 = null);
                                                                                                    await _model.waitForRequestCompleted2();
                                                                                                  },
                                                                                                  text: 'Important',
                                                                                                  options: FFButtonOptions(
                                                                                                    width: 120.0,
                                                                                                    height: 20.0,
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                          fontFamily: 'Readex Pro',
                                                                                                          color: Colors.white,
                                                                                                        ),
                                                                                                    elevation: 3.0,
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Colors.transparent,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            if (importantTasksListTasksRow.isImportant == true)
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                child: FFButtonWidget(
                                                                                                  onPressed: () async {
                                                                                                    await TasksTable().update(
                                                                                                      data: {
                                                                                                        'isImportant': false,
                                                                                                      },
                                                                                                      matchingRows: (rows) => rows.eq(
                                                                                                        'id',
                                                                                                        importantTasksListTasksRow.id,
                                                                                                      ),
                                                                                                    );
                                                                                                    setState(() {
                                                                                                      FFAppState().importantTasks = FFAppState().importantTasks + -1;
                                                                                                    });
                                                                                                    setState(() => _model.requestCompleter1 = null);
                                                                                                    await _model.waitForRequestCompleted1();
                                                                                                    setState(() => _model.requestCompleter1 = null);
                                                                                                    await _model.waitForRequestCompleted1();
                                                                                                    setState(() => _model.requestCompleter2 = null);
                                                                                                    await _model.waitForRequestCompleted2();
                                                                                                  },
                                                                                                  text: 'Important',
                                                                                                  options: FFButtonOptions(
                                                                                                    width: 120.0,
                                                                                                    height: 20.0,
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    color: Color(0xFF0A8EA0),
                                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                          fontFamily: 'Readex Pro',
                                                                                                          color: Colors.white,
                                                                                                        ),
                                                                                                    elevation: 3.0,
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Colors.transparent,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                          ],
                                                                                        ),
                                                                                        Stack(
                                                                                          children: [
                                                                                            if (importantTasksListTasksRow.isComplete == false)
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                child: FFButtonWidget(
                                                                                                  onPressed: () async {
                                                                                                    await TasksTable().update(
                                                                                                      data: {
                                                                                                        'isComplete': true,
                                                                                                      },
                                                                                                      matchingRows: (rows) => rows.eq(
                                                                                                        'id',
                                                                                                        importantTasksListTasksRow.id,
                                                                                                      ),
                                                                                                    );
                                                                                                    setState(() {
                                                                                                      FFAppState().completedTasks = FFAppState().completedTasks + 1;
                                                                                                    });
                                                                                                    setState(() => _model.requestCompleter1 = null);
                                                                                                    await _model.waitForRequestCompleted1();
                                                                                                    setState(() => _model.requestCompleter1 = null);
                                                                                                    await _model.waitForRequestCompleted1();
                                                                                                    setState(() => _model.requestCompleter2 = null);
                                                                                                    await _model.waitForRequestCompleted2();
                                                                                                  },
                                                                                                  text: 'Completed',
                                                                                                  options: FFButtonOptions(
                                                                                                    width: 120.0,
                                                                                                    height: 20.0,
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                          fontFamily: 'Readex Pro',
                                                                                                          color: Colors.white,
                                                                                                        ),
                                                                                                    elevation: 3.0,
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Colors.transparent,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            if (importantTasksListTasksRow.isComplete == true)
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                child: FFButtonWidget(
                                                                                                  onPressed: () async {
                                                                                                    await TasksTable().update(
                                                                                                      data: {
                                                                                                        'isComplete': false,
                                                                                                      },
                                                                                                      matchingRows: (rows) => rows.eq(
                                                                                                        'id',
                                                                                                        importantTasksListTasksRow.id,
                                                                                                      ),
                                                                                                    );
                                                                                                    setState(() {
                                                                                                      FFAppState().completedTasks = FFAppState().completedTasks + -1;
                                                                                                    });
                                                                                                    setState(() => _model.requestCompleter1 = null);
                                                                                                    await _model.waitForRequestCompleted1();
                                                                                                    setState(() => _model.requestCompleter1 = null);
                                                                                                    await _model.waitForRequestCompleted1();
                                                                                                    setState(() => _model.requestCompleter2 = null);
                                                                                                    await _model.waitForRequestCompleted2();
                                                                                                  },
                                                                                                  text: 'Completed',
                                                                                                  options: FFButtonOptions(
                                                                                                    width: 120.0,
                                                                                                    height: 20.0,
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                          fontFamily: 'Readex Pro',
                                                                                                          color: Colors.white,
                                                                                                        ),
                                                                                                    elevation: 3.0,
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Colors.transparent,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                          ],
                                                                                        ),
                                                                                        FFButtonWidget(
                                                                                          onPressed: () async {
                                                                                            await TasksTable().delete(
                                                                                              matchingRows: (rows) => rows.eq(
                                                                                                'id',
                                                                                                importantTasksListTasksRow.id,
                                                                                              ),
                                                                                            );
                                                                                            setState(() {
                                                                                              FFAppState().allTasks = FFAppState().allTasks + -1;
                                                                                            });
                                                                                            if (importantTasksListTasksRow.isImportant!) {
                                                                                              setState(() {
                                                                                                FFAppState().importantTasks = FFAppState().importantTasks + -1;
                                                                                              });
                                                                                            }
                                                                                            if (importantTasksListTasksRow.isComplete!) {
                                                                                              setState(() {
                                                                                                FFAppState().completedTasks = FFAppState().completedTasks + -1;
                                                                                              });
                                                                                            }
                                                                                            setState(() => _model.requestCompleter1 = null);
                                                                                            await _model.waitForRequestCompleted1();
                                                                                          },
                                                                                          text: 'Delete',
                                                                                          options: FFButtonOptions(
                                                                                            width: 120.0,
                                                                                            height: 20.0,
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                            color: Color(0xFFED1B2A),
                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  fontFamily: 'Readex Pro',
                                                                                                  color: Colors.white,
                                                                                                ),
                                                                                            elevation: 3.0,
                                                                                            borderSide: BorderSide(
                                                                                              color: Colors.transparent,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 24.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 751.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: FutureBuilder<
                                                            List<TasksRow>>(
                                                          future: (_model
                                                                      .requestCompleter2 ??=
                                                                  Completer<
                                                                      List<
                                                                          TasksRow>>()
                                                                    ..complete(
                                                                        TasksTable()
                                                                            .queryRows(
                                                                      queryFn: (q) => q
                                                                          .eq(
                                                                            'isComplete',
                                                                            true,
                                                                          )
                                                                          .order('created_at'),
                                                                    )))
                                                              .future,
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<TasksRow>
                                                                completedTasksListTasksRowList =
                                                                snapshot.data!;
                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  completedTasksListTasksRowList
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  completedTasksListIndex) {
                                                                final completedTasksListTasksRow =
                                                                    completedTasksListTasksRowList[
                                                                        completedTasksListIndex];
                                                                return Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            12.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          enableDrag:
                                                                              false,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: TaskDetailsWidget(
                                                                                taskDetails: completedTasksListTasksRow,
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            setState(() {}));
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            70.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              8.0,
                                                                              16.0,
                                                                              8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.0, 1.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 445.0,
                                                                                      height: 25.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: AutoSizeText(
                                                                                        completedTasksListTasksRow.body!.maybeHandleOverflow(
                                                                                          maxChars: 100,
                                                                                          replacement: '…',
                                                                                        ),
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Stack(
                                                                                          children: [
                                                                                            if (completedTasksListTasksRow.isImportant == false)
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                child: FFButtonWidget(
                                                                                                  onPressed: () async {
                                                                                                    await TasksTable().update(
                                                                                                      data: {
                                                                                                        'isImportant': true,
                                                                                                      },
                                                                                                      matchingRows: (rows) => rows.eq(
                                                                                                        'id',
                                                                                                        completedTasksListTasksRow.id,
                                                                                                      ),
                                                                                                    );
                                                                                                    setState(() {
                                                                                                      FFAppState().importantTasks = FFAppState().importantTasks + 1;
                                                                                                    });
                                                                                                    setState(() => _model.requestCompleter2 = null);
                                                                                                    await _model.waitForRequestCompleted2();
                                                                                                    setState(() => _model.requestCompleter1 = null);
                                                                                                    await _model.waitForRequestCompleted1();
                                                                                                    setState(() => _model.requestCompleter2 = null);
                                                                                                    await _model.waitForRequestCompleted2();
                                                                                                  },
                                                                                                  text: 'Important',
                                                                                                  options: FFButtonOptions(
                                                                                                    width: 120.0,
                                                                                                    height: 20.0,
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                          fontFamily: 'Readex Pro',
                                                                                                          color: Colors.white,
                                                                                                        ),
                                                                                                    elevation: 3.0,
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Colors.transparent,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            if (completedTasksListTasksRow.isImportant == true)
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                child: FFButtonWidget(
                                                                                                  onPressed: () async {
                                                                                                    await TasksTable().update(
                                                                                                      data: {
                                                                                                        'isImportant': false,
                                                                                                      },
                                                                                                      matchingRows: (rows) => rows.eq(
                                                                                                        'id',
                                                                                                        completedTasksListTasksRow.id,
                                                                                                      ),
                                                                                                    );
                                                                                                    setState(() {
                                                                                                      FFAppState().importantTasks = FFAppState().importantTasks + -1;
                                                                                                    });
                                                                                                    setState(() => _model.requestCompleter2 = null);
                                                                                                    await _model.waitForRequestCompleted2();
                                                                                                    setState(() => _model.requestCompleter1 = null);
                                                                                                    await _model.waitForRequestCompleted1();
                                                                                                    setState(() => _model.requestCompleter2 = null);
                                                                                                    await _model.waitForRequestCompleted2();
                                                                                                  },
                                                                                                  text: 'Important',
                                                                                                  options: FFButtonOptions(
                                                                                                    width: 120.0,
                                                                                                    height: 20.0,
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    color: Color(0xFF0A8EA0),
                                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                          fontFamily: 'Readex Pro',
                                                                                                          color: Colors.white,
                                                                                                        ),
                                                                                                    elevation: 3.0,
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Colors.transparent,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                          ],
                                                                                        ),
                                                                                        Stack(
                                                                                          children: [
                                                                                            if (completedTasksListTasksRow.isComplete == false)
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                child: FFButtonWidget(
                                                                                                  onPressed: () async {
                                                                                                    await TasksTable().update(
                                                                                                      data: {
                                                                                                        'isComplete': true,
                                                                                                      },
                                                                                                      matchingRows: (rows) => rows.eq(
                                                                                                        'id',
                                                                                                        completedTasksListTasksRow.id,
                                                                                                      ),
                                                                                                    );
                                                                                                    setState(() {
                                                                                                      FFAppState().completedTasks = FFAppState().completedTasks + 1;
                                                                                                    });
                                                                                                    setState(() => _model.requestCompleter2 = null);
                                                                                                    await _model.waitForRequestCompleted2();
                                                                                                    setState(() => _model.requestCompleter1 = null);
                                                                                                    await _model.waitForRequestCompleted1();
                                                                                                    setState(() => _model.requestCompleter2 = null);
                                                                                                    await _model.waitForRequestCompleted2();
                                                                                                  },
                                                                                                  text: 'Completed',
                                                                                                  options: FFButtonOptions(
                                                                                                    width: 120.0,
                                                                                                    height: 20.0,
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                          fontFamily: 'Readex Pro',
                                                                                                          color: Colors.white,
                                                                                                        ),
                                                                                                    elevation: 3.0,
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Colors.transparent,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            if (completedTasksListTasksRow.isComplete == true)
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                child: FFButtonWidget(
                                                                                                  onPressed: () async {
                                                                                                    await TasksTable().update(
                                                                                                      data: {
                                                                                                        'isComplete': false,
                                                                                                      },
                                                                                                      matchingRows: (rows) => rows.eq(
                                                                                                        'id',
                                                                                                        completedTasksListTasksRow.id,
                                                                                                      ),
                                                                                                    );
                                                                                                    setState(() {
                                                                                                      FFAppState().completedTasks = FFAppState().completedTasks + -1;
                                                                                                    });
                                                                                                    setState(() => _model.requestCompleter2 = null);
                                                                                                    await _model.waitForRequestCompleted2();
                                                                                                    setState(() => _model.requestCompleter1 = null);
                                                                                                    await _model.waitForRequestCompleted1();
                                                                                                    setState(() => _model.requestCompleter2 = null);
                                                                                                    await _model.waitForRequestCompleted2();
                                                                                                  },
                                                                                                  text: 'Completed',
                                                                                                  options: FFButtonOptions(
                                                                                                    width: 120.0,
                                                                                                    height: 20.0,
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                          fontFamily: 'Readex Pro',
                                                                                                          color: Colors.white,
                                                                                                        ),
                                                                                                    elevation: 3.0,
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Colors.transparent,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                          ],
                                                                                        ),
                                                                                        FFButtonWidget(
                                                                                          onPressed: () async {
                                                                                            await TasksTable().delete(
                                                                                              matchingRows: (rows) => rows.eq(
                                                                                                'id',
                                                                                                completedTasksListTasksRow.id,
                                                                                              ),
                                                                                            );
                                                                                            setState(() {
                                                                                              FFAppState().allTasks = FFAppState().allTasks + -1;
                                                                                            });
                                                                                            if (completedTasksListTasksRow.isImportant!) {
                                                                                              setState(() {
                                                                                                FFAppState().importantTasks = FFAppState().importantTasks + -1;
                                                                                              });
                                                                                            }
                                                                                            if (completedTasksListTasksRow.isComplete!) {
                                                                                              setState(() {
                                                                                                FFAppState().completedTasks = FFAppState().completedTasks + -1;
                                                                                              });
                                                                                            }
                                                                                            setState(() => _model.requestCompleter2 = null);
                                                                                            await _model.waitForRequestCompleted2();
                                                                                          },
                                                                                          text: 'Delete',
                                                                                          options: FFButtonOptions(
                                                                                            width: 120.0,
                                                                                            height: 20.0,
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                            color: Color(0xFFED1B2A),
                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  fontFamily: 'Readex Pro',
                                                                                                  color: Colors.white,
                                                                                                ),
                                                                                            elevation: 3.0,
                                                                                            borderSide: BorderSide(
                                                                                              color: Colors.transparent,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 16.0),
                                            child: smooth_page_indicator
                                                .SmoothPageIndicator(
                                              controller:
                                                  _model.pageViewController ??=
                                                      PageController(
                                                          initialPage: 0),
                                              count: 3,
                                              axisDirection: Axis.horizontal,
                                              onDotClicked: (i) async {
                                                await _model.pageViewController!
                                                    .animateToPage(
                                                  i,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease,
                                                );
                                              },
                                              effect: smooth_page_indicator
                                                  .ExpandingDotsEffect(
                                                expansionFactor: 3.0,
                                                spacing: 8.0,
                                                radius: 16.0,
                                                dotWidth: 16.0,
                                                dotHeight: 4.0,
                                                dotColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                activeDotColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                paintStyle: PaintingStyle.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, 1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 36.0, 64.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            barrierColor: Color(0xFF29A00A),
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: NewTaskWidget(),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        text: 'Add Task',
                        options: FFButtonOptions(
                          width: 100.0,
                          height: 100.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                  ),
                          elevation: 4.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                          hoverBorderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                          hoverTextColor: Color(0xFF3CFF00),
                          hoverElevation: 16.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
