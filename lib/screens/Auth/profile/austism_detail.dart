import 'package:austism/resources/appAssets.dart';
import 'package:austism/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AustismDetail extends StatefulWidget {
  const AustismDetail({super.key});

  @override
  State<AustismDetail> createState() => _AustismDetailState();
}

class _AustismDetailState extends State<AustismDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeading("What is Autism?"),
              _buildContent(
                  "Autism spectrum disorder (ASD) is a complex developmental disorder that affects communication, behavior, and social interaction. "
                  "It is a lifelong condition that can be diagnosed at any age, although symptoms usually appear in the first two years of life. "
                  "The spectrum nature of autism means that it affects individuals differently, ranging from those who can live independently to those who require significant support."),
              SizedBox(height: 20.h),
              Image.asset(
                Appassets.austism1,
                height: 150.h,
                width: double.infinity,
              ),
              SizedBox(height: 20.h),
              _buildContent(
                  "ASD is known for its variety of symptoms, which can include difficulty in communication, repetitive behaviors, and challenges with social skills. "
                  "Some individuals with autism may also have exceptional abilities in specific areas like music, art, or mathematics, although these talents are not common to all."),
              SizedBox(height: 20.h),
              _buildHeading("Symptoms"),
              _buildContent(
                  "The symptoms of autism vary widely, but they generally fall into two main categories: "
                  "communication and social interaction challenges, and repetitive behaviors or restricted interests."),
              SizedBox(height: 20.h),
              _buildSubHeading("Communication and Social Interaction"),
              _buildContent(
                  "- Difficulty understanding social cues, such as facial expressions or tone of voice.\n"
                  "- Challenges in developing and maintaining relationships with peers.\n"
                  "- Limited use of gestures, like pointing or waving, and difficulty understanding these gestures.\n"
                  "- Delayed language development or unusual use of language, such as repeating phrases (echolalia)."),
              SizedBox(height: 20.h),
              Image.asset(
                Appassets.learning,
                height: 150.h,
                width: double.infinity,
              ),
              SizedBox(height: 20.h),
              _buildSubHeading("Repetitive Behaviors and Restricted Interests"),
              _buildContent(
                  "- Repeating the same movements, such as rocking or hand-flapping.\n"
                  "- Insistence on routines and difficulty with changes in routine.\n"
                  "- Intense interest in specific topics or objects, sometimes focusing on details rather than the broader concept.\n"
                  "- Unusual sensory sensitivities, such as being overly sensitive to sounds, lights, or textures."),
              SizedBox(height: 20.h),
              _buildHeading("Related Problems"),
              _buildContent(
                  "Autism often comes with related conditions that can further affect an individual's quality of life. "
                  "These co-occurring conditions may require additional attention and care."),
              SizedBox(height: 20.h),
              _buildSubHeading("Anxiety and Depression"),
              _buildContent(
                  "Many individuals with autism experience anxiety and depression, particularly as they get older. "
                  "This can be due to difficulties in social situations, bullying, or a general sense of not fitting in. "
                  "Managing these mental health conditions often requires a combination of therapy, medication, and support."),
              SizedBox(height: 20.h),
              Image.asset(
                Appassets.anxiety,
                height: 150.h,
                width: double.infinity,
              ),
              SizedBox(height: 20.h),
              _buildSubHeading(
                  "Attention-Deficit/Hyperactivity Disorder (ADHD)"),
              _buildContent(
                  "ADHD is another common co-occurring condition with autism. "
                  "Individuals with ADHD may have trouble focusing, be hyperactive, or act impulsively. "
                  "The combination of autism and ADHD can make it even more challenging for individuals to navigate social situations or succeed in school."),
              SizedBox(height: 20.h),
              _buildSubHeading("Sensory Processing Issues"),
              _buildContent(
                  "People with autism often have sensory processing issues, which means they may be overly sensitive or under-sensitive to sensory input. "
                  "For example, a loud noise might be overwhelming, or certain fabrics might be intolerable to wear. "
                  "These sensory sensitivities can make everyday activities challenging."),
              SizedBox(height: 20.h),
              Image.asset(
                Appassets.sensory,
                height: 150.h,
                width: double.infinity,
              ),
              SizedBox(height: 20.h),
              _buildSubHeading("Gastrointestinal Issues and Sleep Disorders"),
              _buildContent(
                  "Gastrointestinal issues, such as constipation or diarrhea, are common in individuals with autism. "
                  "Sleep disorders, including difficulties falling asleep or staying asleep, are also prevalent. "
                  "These issues can exacerbate other symptoms of autism, making it important to address them as part of an overall care plan."),
              SizedBox(height: 20.h),
              _buildSubHeading(
                  "Learning Disabilities or Intellectual Disabilities"),
              _buildContent(
                  "While not all individuals with autism have intellectual disabilities, some do. "
                  "Learning disabilities can also affect how a person with autism performs in school or at work. "
                  "Tailoring educational and vocational programs to their needs can help them achieve their full potential."),
              SizedBox(height: 20.h),
              Image.asset(
                Appassets.learning,
                height: 150.h,
                width: double.infinity,
              ),
              SizedBox(height: 20.h),
              _buildHeading("Support and Treatment"),
              _buildContent(
                  "There is no cure for autism, but there are many therapies and interventions that can help individuals with autism lead fulfilling lives. "
                  "Early intervention is crucial and can include behavioral therapy, speech therapy, occupational therapy, and social skills training."),
              SizedBox(height: 20.h),
              _buildSubHeading("Behavioral Therapy"),
              _buildContent(
                  "Behavioral therapy is a cornerstone of autism treatment. Applied Behavior Analysis (ABA) is one of the most common types of therapy used. "
                  "It focuses on encouraging positive behaviors and discouraging negative ones. ABA can be tailored to each individual's needs."),
              SizedBox(height: 20.h),
              Image.asset(
                Appassets.behaviour,
                height: 150.h,
                width: double.infinity,
              ),
              SizedBox(height: 20.h),
              _buildSubHeading("Speech Therapy"),
              _buildContent(
                  "Speech therapy can help individuals with autism improve their verbal and non-verbal communication skills. "
                  "Therapists work on helping them express themselves more clearly and understanding others better."),
              SizedBox(height: 20.h),
              _buildSubHeading("Occupational Therapy"),
              _buildContent(
                  "Occupational therapy focuses on helping individuals with autism develop the skills they need for daily living, such as dressing, eating, and interacting with others. "
                  "It also helps them manage sensory processing issues."),
              SizedBox(height: 20.h),
              _buildSubHeading("Social Skills Training"),
              _buildContent(
                  "Social skills training helps individuals with autism learn how to interact with others in a way that is socially appropriate. "
                  "This can include understanding body language, taking turns in conversation, and making eye contact."),
              SizedBox(height: 20.h),
            ],
          ).paddingSymmetric(horizontal: 20.w),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            height: 20.h,
            width: 20.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Image.asset(
              Appassets.arrowback,
              scale: 1.5,
              color: kprimaryColor,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        "AUTISM",
        style: TextStyle(
          color: kprimaryColor,
          fontWeight: FontWeight.w800,
          fontSize: 35.sp,
        ),
      ),
    );
  }

  Widget _buildHeading(String heading) {
    return Text(
      heading,
      style: TextStyle(
        color: kprimaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 28.sp,
      ),
    );
  }

  Widget _buildSubHeading(String subheading) {
    return Text(
      subheading,
      style: TextStyle(
        color: kprimaryColor,
        fontWeight: FontWeight.w600,
        fontSize: 20.sp,
      ),
    );
  }

  Widget _buildContent(String content) {
    return Text(
      content,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.sp,
        height: 1.5,
      ),
    );
  }
}
