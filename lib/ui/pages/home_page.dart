import 'dart:async';

import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/destination_cubit.dart';
import 'package:airplane/models/destination_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/destination_card.dart';
import 'package:airplane/ui/widgets/destination_card_skelaton.dart';
import 'package:airplane/ui/widgets/destination_tile.dart';
import 'package:airplane/ui/widgets/destination_tile_skelaton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletons/skeletons.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../widgets/banner_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentSlide = 0;

  final List<String> _slideItems = [
    'https://i.postimg.cc/Nfpq3QX7/Screen-Shot-2023-04-04-at-14-22-20.png',
    'https://i.postimg.cc/9Q6xSkLY/Screen-Shot-2023-03-27-at-21-27-24.png',
  ];
  @override
  void initState() {
    context.read<DestinationCubit>().fetchDestinations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget skelatonheader() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                top: 30,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SkeletonParagraph(
                            style: SkeletonParagraphStyle(
                                lines: 2,
                                spacing: 6,
                                lineStyle: SkeletonLineStyle(
                                  randomLength: true,
                                  height: 15,
                                  borderRadius: BorderRadius.circular(8),
                                  minLength:
                                      MediaQuery.of(context).size.width / 6,
                                  maxLength:
                                      MediaQuery.of(context).size.width / 3,
                                ))),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            SkeletonParagraph(
                                style: SkeletonParagraphStyle(
                                    lines: 1,
                                    spacing: 6,
                                    lineStyle: SkeletonLineStyle(
                                      randomLength: true,
                                      height: 10,
                                      borderRadius: BorderRadius.circular(8),
                                      minLength:
                                          MediaQuery.of(context).size.width / 6,
                                      maxLength:
                                          MediaQuery.of(context).size.width / 3,
                                    ))),
                            SkeletonAvatar(
                              style: SkeletonAvatarStyle(
                                borderRadius: BorderRadius.circular(5),
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                top: 30,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Howdy,\n${state.user.name}',
                          style: blackTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Text(
                              'Where to fly today?',
                              style: greyTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: light,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/image_profile.png',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget bannerSection() {
      return BannerCard(_slideItems);
    }

    Widget skelatonpopularDestinations() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              DestinationCardSkelaton(),
              DestinationCardSkelaton(),
            ],
          ),
        ),
      );
    }

    Widget popularDestinations(List<DestinationModel> destinations) {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: destinations.map((DestinationModel destination) {
              return DestinationCard(destination);
            }).toList(),
          ),
        ),
      );
    }

    Widget skeletonNewDestination() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
          bottom: 100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SkeletonParagraph(
                style: SkeletonParagraphStyle(
                    lines: 1,
                    spacing: 6,
                    lineStyle: SkeletonLineStyle(
                      randomLength: true,
                      height: 15,
                      borderRadius: BorderRadius.circular(8),
                      minLength: MediaQuery.of(context).size.width / 6,
                      maxLength: MediaQuery.of(context).size.width / 3,
                    ))),
            Column(
              children: [
                DestinationTileSkelaton(),
              ],
            )
          ],
        ),
      );
    }

    Widget newDestinations(List<DestinationModel> destinations) {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
          bottom: 100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New This Year',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            Column(
              children: destinations.map((DestinationModel destination) {
                return DestinationTile(destination);
              }).toList(),
            ),
          ],
        ),
      );
    }

    return BlocConsumer<DestinationCubit, DestinationState>(
      listener: (context, state) {
        if (state is DestinationFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: kRedColor,
              content: Text(state.error),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is DestinationSuccess) {
          return ListView(
            children: [
              header(),
              bannerSection(),
              popularDestinations(state.destinations),
              newDestinations(state.destinations)
            ],
          );
        }

        return Center(
          child: Column(children: [
            skelatonheader(),
            skelatonpopularDestinations(),
            skeletonNewDestination(),
          ]),
        );
      },
    );
  }
}
