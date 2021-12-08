import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

String kQuote = 'quote';
String kAuthor = 'author';
String anonymous = 'Anonymous';
String kcategory = 'category';
String imageURL = 'image';


List quoteList = [
  {
    kQuote: 'If something is wrong fix it. But train your self not to worry, worry fixes nothing',
    kAuthor: 'Ernest Hemingway',
    kcategory: "Motivation",
    imageURL : 'Images/bg2.png',
  },
  {
    kQuote: "Temperamentally anxious people can have a hard time staying motivated, period, because their intense focus on their worries distracts them from their goals",
    kAuthor: "Winifred Gallagher, Rapt: Attention and the Focused Life",
    kcategory: "Worry ",
    imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "I've had a lot of worries in my life, most of which never happened.",
    kAuthor: "Mark Twain",
    kcategory: "Worry ",
    imageURL : 'Images/bg3.png',
  },
  {
    kQuote: "Everytime I judge someone else, I reveal an unhealed part of my self.",
    kAuthor: "Don Miguel Ruiz",
    kcategory: "Emotional ",
    imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "You can't litter negativity everywhere and wonder why you have a trashy life.Over thinking ruins you. It ruins the situation, twists things around, makes you worry about futile questions and makes everything much worse than actually it is.",
    kAuthor: anonymous,
    kcategory: "Sadness ",
    imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "If you've given up and chosen something else, then don't hold on to what you let go.",
    kAuthor: "Hoon jae, Legend of the Blue Sea",
    kcategory: "Emotional ",
    imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "A creative man is motivated by the desire to achieve, not by the desire to beat others.",
    kAuthor: "Ayn Rand",
    kcategory: "Motivation",
    imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Truth suffers from too much analysis",
    kAuthor: 'Ancient Fremen Saying',
    kcategory: "Emotional ",
    imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "My philosophy is that worrying means you suffer twice.",
    kAuthor: "J.K. Rowling",
    kcategory: "Sadness ",
    imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "In every life we have some trouble. But when you worry, you make it double.",
    kAuthor: 'Bobby McFerrin, Don’t Worry be Happy',
    kcategory: "Stress ",
    imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Empty pockets never held anyone back. Only empty heads and empty hearts can do that.",
    kAuthor: "Norman Vincent Peale",
    kcategory: "Emotional ",
    imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "There is nothing that wastes the body like worry, and one who has any faith in God should be ashamed to worry about anything whatsoever.",
    kAuthor: "Mohandas Gandhi",
    kcategory: "Worry ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "The reason why we struggle with insecurity is because we compare our behind the scenes with everyone else’s highlight reel.",
    kAuthor: "Stephen Furtick",
    kcategory: "Relationship ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "If you want to be happy, do not dwell in the past, do not worry about the future, focus on living fully in the present.",
    kAuthor: "Roy T. Bennett, The Light in the Heart",
    kcategory: "happiness ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "A day of worry is more exhausting than a week of work.",
    kAuthor: "John Lubbock",
    kcategory: "Stress ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "In a society, only those who don't have skills complain.",
    kAuthor: 'Kakashi Hatake, Naruto',
    kcategory: "Motivation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "The man who moves the mountains begins by moving small stones.",
    kAuthor: "Confucius",
    kcategory: "Motivation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Over thinking ruins you. Ruins the situation, twists things around, make you worry and just makes everything worse than it actually is.",
    kAuthor: anonymous,
    kcategory: "Stress ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "The moment you stop chasing happiness, you become happy.",
    kAuthor: "Sandy Hyatt-James",
    kcategory: "happiness ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Letting go gives us freedom, and freedom is the only condition for happiness. If, in our heart, we still cling to anything - anger, anxiety, or possessions - we cannot be free.",
    kAuthor: "Thich Nhat Hanh",
    kcategory: "happiness ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Unaccepted, the universe has no meaning; it is senseless fate and chaos, but acceptance is a way of discovering meaning, not of manufacturing it.",
    kAuthor: "Alan W. Watts",
    kcategory: "Mediation ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Always be happy, you never know how happy you can make another by just being happy.",
    kAuthor: "Ogwo David Emenike",
    kcategory: "happiness",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Happiness is always there. You just have to choose to see it. There's no point dwelling in the dark and ignoring the light of the stars.",
    kAuthor: "Carrie Hope Fletcher",
    kcategory: "happiness",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Happiness is a perfume you cannot pour on others without getting some on yourself",
    kAuthor: "Ralph Waldo Emerson",
    kcategory: "happiness",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "A calm and modest life brings more happiness than the pursuit of success combined with constant restlessness.",
    kAuthor: "Albert Einstein",
    kcategory: "Mediation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Turn your wounds into wisdom.",
    kAuthor: "Oprah Winfrey",
    kcategory: "Motivation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Take responsibility of your own happiness, never put it in other people’s hands.",
    kAuthor: "Roy T. Bennett",
    kcategory: "happiness ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Its important to know when to leave , whether its , a Party, a Job, or evening a Relationship. If it aint right , dont stressed it . just walk away peacefully.",
    kAuthor: "Shaneika Marie",
    kcategory: "Relationship",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Destiny, I feel, is also a relationship - a play between divine grace and willful self-effort.",
    kAuthor: "Elizabeth Gilbert, Eat, Pray, Love",
    kcategory: "Relationship ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "You know what I admire the most in romantic relationships? The couple's ability to express childish expressions.",
    kAuthor: "Dr.Hong, Doctors",
    kcategory: "Relationship ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Every relationship ends because of distance. Some people are too far, but most are just too close.",
    kAuthor: anonymous,
    kcategory: "Relationship ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "If you are driven by fear, anger or pride nature will force you to compete. If you are guided by courage, awareness, tranquility and peace nature will serve you.",
    kAuthor: "Amit Ray",
    kcategory: "Mediation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "When we have done our best, we should wait the result in peace.",
    kAuthor: "John Lubbock",
    kcategory: "Mind ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Letting go gives us freedom, and freedom is the only condition for happiness. If, in our heart, we still cling to anything - anger, anxiety, or possessions - we cannot be free.",
    kAuthor: "Thich Nhat Hanh",
    kcategory: "Sadness ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Stress and confusion come from being busy. Peace and clarity come from slowing down and stilling your waters.",
    kAuthor: "Maxime Lagacé",
    kcategory: "Stress ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "If the selflessness of phenomena is analyzed and if this analysis is cultivated, it causes the effect of attaining nirvana. Through no other cause does one come to peace.",
    kAuthor: anonymous,
    kcategory: "Mind ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Human happiness and moral duty are inseparably connected.",
    kAuthor: "George Washington",
    kcategory: "Mind ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Youth is happy because it has the capacity to see beauty. Anyone who keeps the ability to see beauty never grows old.",
    kAuthor: "Franz Kafka",
    kcategory: "happiness ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "When we hate our enemies, we are giving them power over us: power over our sleep, our appetites, our blood pressure, our health, and our happiness",
    kAuthor: "Dale Carnegie,How to Stop Worrying and Start Living",
    kcategory: "Mind",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Adaptiveness is the shortest road to happiness. Get used to everything around you.",
    kAuthor: "Mwanandeke Kindembo",
    kcategory: "happiness ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "We are sometimes dragged into a pit of unhappiness by someone else’s opinion that we do not look happy",
    kAuthor: "Mokokoma Mokhonoana",
    kcategory: "Sadness ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "... For without pain, there can be no pleasure. Without sadness, there can be no happiness. Without misery there can be no beauty. And without these, life is endless, hopeless, doomed and damned.Adult. You have become adult.",
    kAuthor: "Harlan Ellison, Paingod and Other Delusions",
    kcategory: "Sadness ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Face every challenge like a beginner to learn what your expertise has been hiding.",
    kAuthor: "Jeffrey G. Duarte",
    kcategory: "Motivation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Price is what you pay. Value is what you get.",
    kAuthor: "Warren Buffett",
    kcategory: "Motivation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"He must be very ignorant for he answers every question he is asked.",
    kAuthor: "Voltaire",
    kcategory: "Mind ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "The nail that sticks out farthest gets hammered the hardest.",
    kAuthor: "Patrick Jones, Nailed",
    kcategory: "Emotional ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Wisely and slow; they stumble that run fast.",
    kAuthor: " William Shakespeare, Romeo and Juliet",
    kcategory: "Emotional ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Confidence is knowing who you are and not changing it a bit because of someone’s version of reality is not your reality.",
    kAuthor: "Shannon L. Alder",
    kcategory: "Motivation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "If you're gonna burn a bridge behind you, make sure you've crossed it first.",
    kAuthor: "Quentin R. Bufogle",
    kcategory: "Motivation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "To be of good quality, you have to excuse yourself from the presence of shallow and callow minded individuals.",
    kAuthor: "Michael Bassey Johnson",
    kcategory: "Mediation ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Perhaps not consciously. But every interaction you have, every decision you make, all of that is subconsciously determined by who you want people to see you as. Or what you want to hide. Or how you want people to perceive others.",
    kAuthor: "Rebecca Schaeffer, When Villains Rise",
    kcategory: "Relationship",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "The type of person you are is usually reflected in your business. To improve your business, first improve yourself.",
    kAuthor: "Idowu Koyenikan",
    kcategory: "Motivation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "A path is made by walking on it.",
    kAuthor: "Chuang Tzu",
    kcategory: "Motivation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Believe in your infinite potential. Your only limitations are those you set upon yourself.Believe in yourself, your abilities and your own potential. Never let self-doubt hold you captive. You are worthy of all that you dream of and hope for.",
    kAuthor: "Roy T. Bennett, The Light in the Heart",
    kcategory: "Motivation", imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Watch out for those with inflated egos, for they are the ones hiding something behind all that hot air.",
    kAuthor: "Christine E. Szymanski",
    kcategory: "Mind ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "The darkness makes everything disappear but it makes nothing go away.",
    kAuthor: "Craig D. Lounsbrough",
    kcategory: "Motivation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "The way I define happiness is being the creator of your experience, choosing to take pleasure in what you have, right now, regardless of the circumstances, while being the best you that you can be.",
    kAuthor: "Leo Babauta",
    kcategory: "happiness",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Your suffering needs to be respected. Don't try to ignore the hurt, because it is real. Just let the hurt soften you instead of hardening you. Let the hurt open you instead of closing you. Let the hurt send you looking for those who will accept you instead of hiding from those who reject you.",
    kAuthor: " Bryant McGill",
    kcategory: "Motivation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Rejection is an opportunity for your selection.",
    kAuthor: "Bernard Branson",
    kcategory: "Motivation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "You get hit the hardest when trying to run or hide from a problem. Like the defense on a football field, putting all focus on evading only one defender is asking to be blindsided.",
    kAuthor: "Criss Jami, Killosophy",
    kcategory: "Emotional ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Weak people revenge. Strong people forgive. Intelligent people ignore.",
    kAuthor: "Albert Einstein",
    kcategory: "Mind",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Some of the most beautiful things we have in life comes from our mistakes",
    kAuthor: "Surgeo Bell",
    kcategory: "Motivation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Missing a train is only painful if you run after it! Likewise, not matching the idea of success others expect from you is only painful if that’s what you are seeking.",
    kAuthor: "Nassim Nicholas Taleb",
    kcategory: "Success",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Suffering happens when we believe the solution is outside ourselves.",
    kAuthor: "Tehya Sky",
    kcategory: "Mind ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "One reason why birds and horses are not unhappy is because they are not trying to impress other birds and horses.",
    kAuthor: "Dale Carnegie",
    kcategory: "Sadness ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "No disease that can be treated by diet should be treated with any other means.",
    kAuthor: "Moses Maimonides",
    kcategory: "Health ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "No matter how isolated you are and how lonely you feel, if you do your work truly & conscientiously, unknown friends will come & seek you",
    kAuthor: "Carl Jung",
    kcategory: "Success",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "If you have to convince someone to stay with you then they have already left.",
    kAuthor: "Shannon L. Alder",
    kcategory: "Relationship ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "We are products of our past, but we don't have to be prisoners of it.",
    kAuthor: "Rick Warren",
    kcategory: "Emotional",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Those who cannot change their minds cannot change anything.",
    kAuthor: "George Bernard Shaw",
    kcategory: "Mind ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "They always say time changes things, but you actually have to change them yourself.",
    kAuthor: "Andy Warhol",
    kcategory: "Mind ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "You never change your life until you step out of your comfort zone; change begins at the end of your comfort zone.",
    kAuthor: "Roy T. Bennett",
    kcategory: "Motivation ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "When we least expect it, life sets us a challenge to test our courage and willingness to change; at such a moment, there is no point in pretending that nothing has happened or in saying that we are not yet ready. The challenge will not wait. Life does not look back. A week is more than enough time for us to decide whether or not to accept our destiny.",
    kAuthor: "Paulo Coelho",
    kcategory: "Success",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "The snake which cannot cast its skin has to die. As well the minds which are prevented from changing their opinions; they cease to be mind.",
    kAuthor: "Friedrich Nietzsche",
    kcategory: "Mind ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Life is a series of natural and spontaneous changes. Don't resist them; that only creates sorrow. Let reality be reality. Let things flow naturally forward in whatever way they like.",
    kAuthor: "Lao Tzu",
    kcategory: "Reality",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "If you are depressed, you are living in the past. If you are anxious, you are living in future. If you are at peace, you are living in the present",
    kAuthor: "Lao Tzu",
    kcategory: "",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "To be beautiful means to be yourself. You don't need to be accepted by others. You need to accept yourself.",
    kAuthor: "Thich Nhat Hanh",
    kcategory: "Reality",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "You will never have a greater or lesser dominion than that over yourself...the height of a man's success is gauged by his self-mastery; the depth of his failure by his self-abandonment. ...And this law is the expression of eternal justice. He who cannot establish dominion over himself will have no dominion over others.",
    kAuthor: " Leonardo da Vinci",
    kcategory: "Mind ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "We must do our work for its own sake, not for fortune or attention or applause.",
    kAuthor: "Steven Pressfield",
    kcategory: "Reality",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "All Birds find shelter during a rain. But Eagles avoid rain by flying above the clouds. Problems are common, but attitude makes the difference.",
    kAuthor: "Dr. APJ Abdul Kalam",
    kcategory: "Motivation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "To make a difference in someone's life, you don't have to be rich, brilliant, beautiful or perfect. You just have to care.",
    kAuthor: "Mandy Hale",
    kcategory: "Relationship",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Facts have a tendency to get embellished.",
    kAuthor: "Haruki Murakami",
    kcategory: "Reality",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "The fears we don't face become our limits.",
    kAuthor: "Tracy A Malone",
    kcategory: "Success",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Every problem you face is an opportunity to learn something. The biggest lessons in your life have been learned from the darkest days.",
    kAuthor: "Tracy A. Malone",
    kcategory: "Success",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "The capacity to learn is a Gift. The ability to learn is a Skill. The willingness to learn is a Choice.",
    kAuthor: "Brian Herbert",
    kcategory: "Reality",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "A goal is not always meant to be reached. It often serves simply as something to aim at.",
    kAuthor: "Bruce Lee.",
    kcategory: "Reality",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Talk to someone about themselves and they'll listen for hours.",
    kAuthor: "Dale Carnegie",
    kcategory: "Reality",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Forgiveness is a personal process that doesn’t depend on us having direct contact with the people who have hurt us.",
    kAuthor: "Sharon Salzberg,",
    kcategory: "Relationship",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Even god doesn't propose to judge a man till his last days, why should you and I?",
    kAuthor: "Dale Carnegie",
    kcategory: "Emotional",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "The absence of a message sometimes is a presence of one.",
    kAuthor: "Hasse Jerner",
    kcategory: "Relationship",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "If I have learned anything in this long life of mine, it is this: in love we find out who we want to be; in war we find out who we are.",
    kAuthor: "Kristin Hannah",
    kcategory: "Relationship",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "The secret of change is to focus all of your energy, not on fighting the old, but on building the new.",
    kAuthor: "Socrates",
    kcategory: "Mind",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "A person who thinks all the time has nothing to think about except thoughts. So he loses touch with reality & lives in a world of illusions.",
    kAuthor: "Alan Watts",
    kcategory: "Sadness",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Do not go where the path may lead, go instead where there is no path & leave a trail",
    kAuthor: "Ralph Waldo Emerson",
    kcategory: "Motivation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "You don't drown by falling in the water; you drown by staying there.",
    kAuthor: "edwin louis cole",
    kcategory: "Reality",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Sometimes it's not enough to know what things mean, sometimes you have to know what things don't mean.",
    kAuthor: "Bob Dylan",
    kcategory: "Reality",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Recognizing power in another does not diminish your own.",
    kAuthor: "Joss Whedon",
    kcategory: "Success",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "Fear is not evil. It tells you what weakness is. And once you know your weakness, you can become stronger as well as kinder",
    kAuthor: "Gildarts Clive",
    kcategory: "Success",imageURL : 'Images/bg1.png',
  },
  {
    kQuote: "If you are not in the process of becoming the person you want to be, you are automatically engaged in becoming the person you don't want to be.",
    kAuthor: "Dale Carnegie",
    kcategory: "Reality",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"We like to be out in the nature so much because it has no opinion about us.",
    kAuthor:"Friedrich Nietzsche",
    kcategory:"happiness ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"People are not disturbed by things, but by the views they take of them.",
    kAuthor:"Epictetus, Enchiridion",
    kcategory:"Reality",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"The stupid neither forgive nor forget; the naive forgive and forget; the wise forgive but do not forget.",
    kAuthor:"Thomas Szasz",
    kcategory:"Reality",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"A smart person knows how to talk. A wise person knows when to be silent.",
    kAuthor:"Roy T. Bennett",
    kcategory:"Mediation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"You have to be so disciplined that even your distractions become focused.",
    kAuthor:"Onyi Anyado",
    kcategory:"Mediation",imageURL : 'Images/bg1.png',
  },{
    kQuote:"There is nothing more beautiful than someone who goes out of their way to make life beautiful for others",
    kAuthor:"Mandy Hale",
    kcategory:"Relationship",imageURL : 'Images/bg1.png',
  },{
    kQuote:"Wisely and slow; they stumble that run fast.",
    kAuthor:"William Shakespeare",
    kcategory:"Mind",imageURL : 'Images/bg1.png',
  },{
    kQuote:"A wise man gets more use from his enemies than a fool from his friends.",
    kAuthor:"Baltasar Gracian",
    kcategory:"Mind",imageURL : 'Images/bg1.png',
  },{
    kQuote:"The art of being wise is knowing what to overlook",
    kAuthor:"William James",
    kcategory:"Mind",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"It's not what you say out of your mouth that determines your life, it's what you whisper to yourself that has the most power!",
    kAuthor:" Robert T. Kiyosaki",
    kcategory:"Reality",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"People who know little are usually great talkers, while men who know much say little.",
    kAuthor:"Jean Jacques Rousseau",
    kcategory:"Reality",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"The only man who never makes mistakes is the man who never does anything.",
    kAuthor:"Theodore Roosevelt",
    kcategory:"Reality",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"It is one thing to be clever and another to be wise.",
    kAuthor:"George R.R. Martin",
    kcategory:"Motivation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Honesty is the first chapter of the book wisdom.",
    kAuthor:"Thomas Jefferson",
    kcategory:"Motivation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"It is better to remain silent at the risk of being thought a fool, than to talk and remove all doubt of it.",
    kAuthor:"Maurice Switzer",
    kcategory:"Reality",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Happiness is when, what you think, what you say and what you do are in harmony",
    kAuthor:"Mahatma Gandhi",
    kcategory:"happiness",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Don't be afraid of being scared. To be afraid is a sign of common sense. Only complete idiots are not afraid of anything.",
    kAuthor:"Carlos Ruiz Zafón",
    kcategory:"Emotional",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Moonlight drowns out all but the brightest stars.",
    kAuthor:"J.R.R. Tolkien",
    kcategory:"Motivation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Magic always happens when you direct your inner powers to the object you want to change.",
    kAuthor:"Bangambiki Habyarimana",
    kcategory:"Mediation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"People often say that this or that person has not yet found himself. But the self is not something one finds; it is something one creates.",
    kAuthor:"Thomas Szasz",
    kcategory:"Sadness",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Success in life is not for those who run fast, but for those who keep running and always on the move.",
    kAuthor:"Bangambiki Habyarimana",
    kcategory:"Success",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"One must still have chaos in oneself to be able to give birth to a dancing star.",
    kAuthor:"Friedrich Nietzsche",
    kcategory:"Mind",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"The worst enemy to creativity is self-doubt.",
    kAuthor:"Sylvia Plath",
    kcategory:"Stress",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Learn the rules like a pro, so you can break them like an artist.",
    kAuthor:"Pablo Picasso",
    kcategory:"Motivation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Others have seen what is and asked why. I have seen what could be and asked why not.",
    kAuthor:"Pablo Picasso",
    kcategory:"Emotional ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Rules for happiness: something to do, someone to love, something to hope for.",
    kAuthor:"Immanuel Kant",
    kcategory:"happiness ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"The most introspective of souls are often those that have been hurt the most.",
    kAuthor:"Shannon Alder",
    kcategory:"Emotional",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"To love oneself is the beginning of a lifelong romance.",
    kAuthor:"Oscar Wilde",
    kcategory:"happiness",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Being deeply loved by someone gives you strength, while loving someone deeply gives you courage.",
    kAuthor:"Lao Tzu",
    kcategory:"Relationship",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Success seems to be connected to action. Successful people keep moving. They make mistakes, but they don’t quit.",
    kAuthor:"Tom Rath",
    kcategory:"Success",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"If you want to live a Happy Life, Tie it to a Goal & not to People OR Things ",
    kAuthor:"Albert Einstein",
    kcategory:"Sadness",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Patience is the way out of Anxiety",
    kAuthor:"Rumi",
    kcategory:"Sadness",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"It's your road, and yours alone. Others may walk it with you but no one can walk it for you",
    kAuthor:"Rumi",
    kcategory:"Sadness",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Our weakness doesn’t make us weak. Our weakness makes us strong. For we had to carry it all these years.",
    kAuthor:"Brandon Sanderson",
    kcategory:"Sadness",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Defeat is a state of mind. No one is ever defeated, until defeat has been accepted as reality.",
    kAuthor:"Bruce Lee.",
    kcategory:"Sadness",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"It's all very simple. But maybe because it's so simple, it's also hard.",
    kAuthor:"Natsuki Takaya",
    kcategory:"Reality",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"The greatest wealth is to live content with little",
    kAuthor:"Plato",
    kcategory:"Reality",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Education without Morals is like a Ship without a Compass, wandering nowhere",
    kAuthor:"Martin Luther King Jr.",
    kcategory:"Reality",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"No matter how many mistakes you make or how slow you progress, you are still way ahead of everyone who isn't trying",
    kAuthor:"Tony Robbins",
    kcategory:"Success",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Build YOUR own Dreams, OR someone else will hire YOU to build THEIRS ",
    kAuthor:"FARRAH GRAY",
    kcategory:"Success",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"No matter how far you travel, you can never get away from yourself. It’s like your shadow. It follows you everywhere. -Komura",
    kAuthor:"Haruki Murakami",
    kcategory:"happiness",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"My mother said the cure for thinking too much about yourself was helping somebody who was worse off than you.",
    kAuthor:"Sylvia Plath",
    kcategory:"Mind",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"The best way to assess yourself is to base the assessment on the product you produce daily",
    kAuthor:"Sunday Adelaja",
    kcategory:"Mind ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Progress is discovering what you can do without.",
    kAuthor:"Marty Rubin",
    kcategory:"Success",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"If everyday you keep getting better, you end up being the best.",
    kAuthor:"Amit Kalantri",
    kcategory:"Success",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"A true Hero isn't measured by the size of his strength, but by the strength of his heart",
    kAuthor:"Hercules.",
    kcategory:"Emotional ",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Those who make excuses, don't make progress",
    kAuthor:"Amit Kalantri",
    kcategory:"Success",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Commitment mixed with drive and sprinkled with imagination creates sustained results. Stay focused and you will make your mark!",
    kAuthor:"Amy Leigh Mercree",
    kcategory:"Motivation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"The Earth has music for those who listen",
    kAuthor:"William Shakespeare",
    kcategory:"happiness",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"To progress is always to begin always to begin again",
    kAuthor:"Martin Luther",
    kcategory:"Success",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Do not fear to be eccentric in opinion, for every opinion now accepted was once eccentric.",
    kAuthor:"Bertrand Russell",
    kcategory:"",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"You are not the Drop in the Ocean. You are the entire Ocean in the Drop",
    kAuthor:"Rumi",
    kcategory:"",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Self Confidence is a Super Power. Once you start to believe in yourself, magic starts happening",
    kAuthor:"",
    kcategory:"",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"There may be times when we are powerless to prevent injustice, but there must never be a time when we fail to protest.",
    kAuthor:"Elie Wiesel",
    kcategory:"",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Trust yourself. You know more than you think you do.",
    kAuthor:"Benjamin Spock",
    kcategory:"",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"To LIVE is the rarest thing in the world. Most people exist, that is all",
    kAuthor:"Oscar Wilde",
    kcategory:"",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"If you don't stand for something you will fall for anything.",
    kAuthor:"Gordon A. Eadie",
    kcategory:"",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"If you get tired, learn to rest, not to quit",
    kAuthor:"Bansky",
    kcategory:"",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"The opposite of a correct statement is a false statement. But the opposite of a profound truth may well be another profound truth.",
    kAuthor:"Niels Bohr",
    kcategory:"",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"A reliable way to make people believe in falsehoods is frequent repetition, because familiarity is not easily distinguished from truth. Authoritarian institutions and marketers have always known this fact.",
    kAuthor:"Daniel Kahneman",
    kcategory:"",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"If you can't explain it to a six year old, you don't understand it yourself.",
    kAuthor:"Albert Einstein",
    kcategory:"Reality",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Time is a drug. Too much of it kills you.",
    kAuthor:"Terry Pratchett",
    kcategory:"Time",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"To understand the immeasurable, the mind must be extraordinarily quiet, still.",
    kAuthor:"Jiddu Krishnamurti",
    kcategory:"Mediation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"The first principle is that you must not fool yourself and you are the easiest person to fool.",
    kAuthor:"Richard P. Feynman",
    kcategory:"Life",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"An expert is a person who has made all the mistakes that can be made in a very narrow field.",
    kAuthor:"Niels Bohr",
    kcategory:"Motivation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Any intelligent fool can make things bigger, more complex, and more violent. It takes a touch of genius — and a lot of courage to move in the opposite direction.",
    kAuthor:"E.F. Schumacher",
    kcategory:"Reality",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:" believe in everything until it's disproved. So I believe in fairies, the myths, dragons. It all exists, even if it's in your mind. Who's to say that dreams and nightmares aren't as real as the here and now?",
    kAuthor:"John Lennon",
    kcategory:"Reality",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"There are things that cannot be taken back. But the world will keep on spinning whether you laugh or you cry.",
    kAuthor:"Hikigaya Hachiman",
    kcategory:"Reality",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"If you cannot find peace within yourself, you will never find it anywhere else.",
    kAuthor:" Marvin Gaye",
    kcategory:"Mediation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Self-talk reflects your innermost feelings.",
    kAuthor:"Dr. Asa Don Brown",
    kcategory:"Mediation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"You can have peace. Or you can have freedom. Don't ever count on having both at once.",
    kAuthor:"Robert A. Heinlein",
    kcategory:"Mediation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"One should use common words to say uncommon things",
    kAuthor:"Arthur Schopenhauer",
    kcategory:"Life",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"It’s a lack of clarity that creates chaos and frustration. Those emotions are poison to any living goal.",
    kAuthor:"Steve Maraboli",
    kcategory:"Emotional",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Appearance blinds, whereas words reveal.",
    kAuthor:"Oscar Wilde",
    kcategory:"Life",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"People who lack the clarity, courage, or determination to follow their own dreams will often find ways to discourage yours. Live your truth and don't EVER stop!",
    kAuthor:"Steve Maraboli",
    kcategory:"Motivation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Our life is frittered away by detail. Simplify, simplify.",
    kAuthor:"Henry David Thoreau",
    kcategory:"Life",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"If You Want to Gather Honey, Don't Kick Over the Beehive",
    kAuthor:"Dale Carnegie",
    kcategory:"Sadness",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"The greatest ideas are the simplest.",
    kAuthor:"William Golding",
    kcategory:"Success",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Remember, happiness doesn't depend upon who you are or what you have, it depends solely upon what you think.",
    kAuthor:"Dale Carnegie",
    kcategory:"happiness",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"If you dare nothing, then when the day is over, nothing is all you will have gained.",
    kAuthor:"Neil Gaiman",
    kcategory:"Time",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"When you start giving, instead of getting, you make a difference.",
    kAuthor:"Roy T. Bennett",
    kcategory:"Life",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"If you can't sleep, then get up and do something instead of lying there and worrying. It's the worry that gets you, not the loss of sleep.",
    kAuthor:"Dale Carnegie",
    kcategory:"Reality",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"The absence of a message sometimes is a presence of one.",
    kAuthor:"Hasse Jerner",
    kcategory:"Relationship",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Life has a meaning but do not set out to find out. Just live it out.",
    kAuthor:"Bangambiki Habyarimana",
    kcategory:"Life",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"If one comes to the sense that they have arrived, they no longer feel the need to submit themselves to the process of learning and growing. This is a dangerous mindset to carry. The day that we stop learning is the day we stop living.",
    kAuthor:"Jenelle Dancel",
    kcategory:"Mind",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Self-respect is the root of discipline: The sense of dignity grows with the ability to say no to oneself.",
    kAuthor:"Abraham Joshua Heschel",
    kcategory:"Life",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"True freedom is impossible without a mind made free by discipline.",
    kAuthor:"Mortimer J. Adle",
    kcategory:"Mind",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"If you feel you have to open a particular door, open it, otherwise all your life that door will haunt your mind!",
    kAuthor:"Mehmet Murat ildan",
    kcategory:"Life",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"It's not the load that breaks you down, it's the way you carry it.",
    kAuthor:"Lou Holtz",
    kcategory:"Emotional",imageURL : 'Images/bg1.png',
  }, {
    kQuote:"I've hidden memories in boxes inside my head before. Sometimes it's the only way to deal with things.",
    kAuthor:" Alice Feeney",
    kcategory:"Memories",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Death is the easy part, the hard part is living and knowing you could be so much more then you’re willing to be.",
    kAuthor:"robert m drake",
    kcategory:"Life",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"I have to believe that when things are bad I can change them.",
    kAuthor:"Jim Braddock",
    kcategory:"Motivation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"There’s no such thing as too far. You understand? You push everything as far as you can. You push and you push and you push until it starts pushing back. And then you push some goddamn more.",
    kAuthor:"Walter Abrams",
    kcategory:"Reality",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Human happiness and moral duty are inseparably connected.",
    kAuthor:"George Washington",
    kcategory:"happiness",
    imageURL : 'Images/bg1.png',
  }, {
    kQuote:"Work for work’s sake, not for yourself. Act but do not be attached to your actions. Be in the world, but not of it.",
    kAuthor:"Bhagavad Gita",
    kcategory:"Life",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Holding grudges is like growing a garden of thorns in your heart .",
    kAuthor:"Thandazo Perfect Khumalo",
    kcategory:"Life",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Plants and flowers taught me how to grow, by growing in secret and in silence.",
    kAuthor:"Michael Bassey Johnson",
    kcategory:"Nature",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Not every flower belongs in every garden.",
    kAuthor:"Leigh Bardugo",
    kcategory:"Nature",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"When you stop growing you start dying.",
    kAuthor:"William S. Burroughs",
    kcategory:"Life",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Maybe the gift of being human is that we do not give up- even when all hope is lost.",
    kAuthor:"Leigh Bardugo",
    kcategory:"Life",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Too many kings can ruin an army",
    kAuthor:"Homer",
    kcategory:"Reality",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Isn’t it queer: there are only two or three human stories, and they go on repeating themselves as fiercely as if they had never happened before; like the larks in this country, that have been singing the same five notes over for thousands of years.",
    kAuthor:"Willa Cather",
    kcategory:"Life",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Everything is relative in this world, where change alone endures.",
    kAuthor:"Leon Trotsky",
    kcategory:"Life",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"The Chinese use two brush strokes to write the word 'crisis.' One brush stroke stands for danger; the other for opportunity. In a crisis, be aware of the danger--but recognize the opportunity.",
    kAuthor:"John F. Kennedy",
    kcategory:"Motivation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"To conquer a nation, first disarm its citizens.",
    kAuthor:"Adolf Hitler",
    kcategory:"Mind",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"The surest way to corrupt a youth is to instruct him to hold in higher esteem those who think alike than those who think differently.",
    kAuthor:"Friedrich Nietzsche",
    kcategory:"Success",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Youth is happy because it has the capacity to see beauty. Anyone who keeps the ability to see beauty never grows old.",
    kAuthor:"Franz Kafka",
    kcategory:"happiness",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"The only part of you that hurts when you're given the truth is the part that lives on lies.",
    kAuthor:"Stefan Molyneux",
    kcategory:"Sadness",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"After all, when a stone is dropped into a pond, the water continues quivering even after the stone has sunk to the bottom.",
    kAuthor:"Arthur Golden",
    kcategory:"Sadness",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Remember my friend, that knowledge is stronger than memory, and we should not trust the weaker",
    kAuthor:"Bram Stoker",
    kcategory:"Memories",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"No thief, however skillful, can rob one of knowledge, and that is why knowledge is the best and safest treasure to acquire.",
    kAuthor:"L. Frank Baum",
    kcategory:"",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"I’m only brave when I have to be. Being brave doesn’t mean you go looking for trouble.",
    kAuthor:"Mufasa",
    kcategory:"Knowledge",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"People rarely succeed unless they have fun in what they are doing.",
    kAuthor:" Dale Carnegie",
    kcategory:"Success",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"When we hate our enemies, we are giving them power over us: power over our sleep, our appetites, our blood pressure, our health, and our happiness.",
    kAuthor:"Dale Carnegie",
    kcategory:"Life",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Focus on the work. The benefits will follow.",
    kAuthor:"Mitta Xinindlu",
    kcategory:"Work",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"One of the greatest tragedies in life is to lose your own sense of self and accept the version of you that is expected by everyone else.",
    kAuthor:"K.L. Toth",
    kcategory:"Life",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"It isn't what you have, or who you are, or where you are, or what you are doing that makes you happy or unhappy. It is what you think about.",
    kAuthor:"Dale Carnegie",
    kcategory:"happiness",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Do not ruin today with mourning tomorrow.",
    kAuthor:"Catherynne M. Valent",
    kcategory:"Worry",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"It’s only after we’ve lost everything that we’re free to do anything. ",
    kAuthor:"Fight Club",
    kcategory:"happiness",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Some people can’t believe in themselves until someone else believes in them first.",
    kAuthor:"Sean Maguire",
    kcategory:"Life",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"To exist is to change, to change is to mature, to mature is to go on creating oneself endlessly.",
    kAuthor:"Henri Bergson",
    kcategory:"Success",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"The definition of success remains unique and subjective to each person's path of life.",
    kAuthor:"Mitta Xinindlu",
    kcategory:"Success",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"A wise man can learn more from his enemies than a fool from his friends.",
    kAuthor:"Niki Lauda",
    kcategory:"Success",imageURL : 'Images/bg1.png',
  }, {
    kQuote:"You do not play a sonata in order to reach the final chord, and if the meanings of things were simply in ends, composers would write nothing but finales.",
    kAuthor:"Alan W. Watts",
    kcategory:"Work",imageURL : 'Images/bg1.png',
  }, {
    kQuote:"If you don't behave as you believe, you will end by believing as you behave.",
    kAuthor:"Fulton J. Sheen",
    kcategory:"Life",imageURL : 'Images/bg1.png',
  }, {
    kQuote:"Despair is typical of those who do not understand the causes of evil, see no way out, and are incapable of struggle.",
    kAuthor:" Vladimir Lenin",
    kcategory:"Motivation",imageURL : 'Images/bg1.png',
  }, {
    kQuote:"People readily learn but are afraid to think.",
    kAuthor:"Alistair Abram Akrofi-Mantey",
    kcategory:"Knowledge",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"All the turbulences opens up the next level of your strength.",
    kAuthor:"Hiral Nagda",
    kcategory:"Strength",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"We were never promised smooth sailing. But we were equipped to sail in rough seas.",
    kAuthor:"Cécile Rischman",
    kcategory:"Motivation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"In each story, the most important character is the narrator.",
    kAuthor:"Anonymous",
    kcategory:"Life",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Adaptiveness is the shortest road to happiness. Get used to everything around you.",
    kAuthor:"Mwanandeke Kindembo",
    kcategory:"happiness",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"You either allow the challenge to stop you or allow it to make you unstoppable.",
    kAuthor:"Hiral Nagda",
    kcategory:"Motivation",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Do not wait for a coronation; the greatest emperors crown themselves.",
    kAuthor:"Robert Greene",
    kcategory:"Strength",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Be wiser than other people if you can; but do not tell them so.",
    kAuthor:"Dale Carnegie",
    kcategory:"Mind",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"He who is not satisfied with a little is satisfied with nothing.",
    kAuthor:"Epicurus",
    kcategory:"Worry",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Problems that remain persistently insoluble should always be suspected as questions asked in the wrong way.",
    kAuthor:"Alan Wilson Watts",
    kcategory:"Problems",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Even the finest sword plunged into salt water will eventually rust.",
    kAuthor:"Sun Tzu",
    kcategory:"Mind",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Contentment is natural wealth, luxury is artificial poverty.",
    kAuthor:"Socrates, Essential Thinkers - Socrates",
    kcategory:"Nature",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"If you place your head in a lion's mouth, then you cannot complain one day if he happens to bite it off.",
    kAuthor:"Agatha Christie",
    kcategory:"Emotional",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Focus on making yourself better, not on thinking that you are better.",
    kAuthor:"Bohdi Sanders",
    kcategory:"Emotional",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Learning does not make one learned: there are those who have knowledge and those who have understanding. The first requires memory and the second philosophy.",
    kAuthor:"Alexandre Dumas",
    kcategory:"Knowledge",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"To those who are given much, much is expected.",
    kAuthor:"Maya Angelou",
    kcategory:"Strength",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"You may be the only person left who believes in you, but it's enough. It takes just one star to pierce a universe of darkness. Never give up.",
    kAuthor:"Richelle E. Goodrich",
    kcategory:"Strength",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"To overcome fear is the quickest way to gain your self-confidence.",
    kAuthor:"Roy T. Bennett",
    kcategory:"Strength",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"Magic always happens when you direct your inner powers to the object you want to change.",
    kAuthor:"Bangambiki Habyarimana",
    kcategory:"Life",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"For you to make a difference on earth, you need to be focused and have a strong will",
    kAuthor:"Topsy Gift",
    kcategory:"Life",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"When you miss how things were before, you miss out living with what is right before you",
    kAuthor:"Bodhi Smith",
    kcategory:"Knowledge",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"You win, not by defeating others, but by performing better than before.",
    kAuthor:"Vikrmn",
    kcategory:"Success",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"All things good happen by not managing time, but prioritizing attention.",
    kAuthor:"Richie Norton",
    kcategory:"Emotional",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"This blank space represents infinite potential. One day, it may become anything.",
    kAuthor:"No Game No Life",
    kcategory:"Life",imageURL : 'Images/bg1.png',
  },
  {
    kQuote:"The thing called justice changes its shape, Depending on where you stand.",
    kAuthor:"Aokiji, One Piece",
    kcategory:"Life",imageURL : 'Images/bg1.png',
  },
  // FirebaseFirestore.instance.collection('quotes').add()
];

void addQuotesToFirebase() {
  for(var i=0 ; i<quoteList.length ; i++){
    FirebaseFirestore.instance.collection('quotes').add(quoteList[i]).then((value){
      // print('${i}');
    });
  }
}



