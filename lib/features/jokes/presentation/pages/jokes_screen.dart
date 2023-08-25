import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sb_myreports/features/jokes/presentation/manager/jokeprovider.dart';
import '../../../../core/utils/globals/globals.dart';
import '../../../../core/widgets/custom/continue_button.dart';
import '../../../../core/widgets/custom/custom_form_field.dart';

class JokeScreen extends StatefulWidget {
  const JokeScreen({Key? key}) : super(key: key);

  @override
  State<JokeScreen> createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  JokeProvider jokeProvider = sl();

  // Provider state managements
  @override
  Widget build(BuildContext context) {
    return (ChangeNotifierProvider.value(
        value: jokeProvider, child: const JokeScreenContent()));
  }
}

class JokeScreenContent extends StatefulWidget {
  const JokeScreenContent({Key? key}) : super(key: key);

  @override
  State<JokeScreenContent> createState() => _JokeScreenContentState();
}

class _JokeScreenContentState extends State<JokeScreenContent> {
  TextEditingController jokeQueryController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<JokeProvider>().getRandomJoke();

  }

  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _key,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextFormField(
                    hintText: 'Search',
                    labelText: 'Joke'.tr(),
                    // validator: FormValidators.validateJoke,

                    controller: jokeQueryController,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ContinueButton(
                      //loadingNotifier: context.read<JokesProvider>().queryJokeLoading,
                      text: 'Find'.tr(),
                      onPressed: () {
                        // context.read<JokeProvider>().getRandomJoke();
                      }),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(15.r),
                    width: double.infinity,
                    height: 300.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.grey.withOpacity(.2)),
                    child: Center(
                        child: ValueListenableBuilder<bool>(
                            valueListenable:
                                context.read<JokeProvider>().randomJokeLoading,
                            builder: (_, loading, __) {
                              if (context
                                      .read<JokeProvider>()
                                      .getRandomJokeResponseModel ==
                                  null) {
                                return const Text('Joke Here').tr();
                              }

                              return loading== true?  const Center(child: CircularProgressIndicator.adaptive(),):Text(context.read<JokeProvider>().getRandomJokeResponseModel!.value);
                            })),
                  ),
                  IconButton(
                      onPressed: () {
                        context.read<JokeProvider>().getRandomJoke();
                      },
                      icon: const Icon(Icons.refresh)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
