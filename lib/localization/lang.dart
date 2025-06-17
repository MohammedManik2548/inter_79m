enum SupportedLanguage {
  english({
    "english":"English",
    "bengali":"Bengali",
    "buttonIntroduction":
        "Each button should be clickable\nSome may have requirement of level\nSome you have to figure it couldn't be clicked",
    "firstTest": "First test",
    "secondTest": "Second test",
    "thirdTest": "Third test",
    "fourthTest": "Fourth test",
    "floatingButtonDescription":
        'By clicking on the + button,\nyour level will either increase / decrease randomly.\n\nYou are now on level: \${level}',
    "availableOnDescription": "Available on level \${level}",
    "yourLevel": "Your level: \${level}",
    "getSizeBeforeBuild": "Get size before build",
    "getSizeAfterBuild": "Get size after build",
    "firstTestIntroduction": "Did you notice the slowness when scrolling? Try to fix it.",
    "secondTestIntroduction":
        "I hope that you notice there's a lag when generating 1 million data when opening first test screen. We would like to know, why does it create a small lag like that, and better yet, if you can re-create FirstTest page, along with its Bloc and State classes, but without lagging, replacing this Second Test widget.",
    "thirdTestIntroduction":
        "I have a really long lorem ipsum text below, now, the two buttons above it doesn't have any logic yet. I want you to define the logic of, how do I get the width and height of the text, for both cases, Before Build, and After Build.",
    "fourthTestIntroduction":
        "We implemented a very simple localization for this project, and the folder structure is a bit messy. If you can, please redefine the folder structure using Clean Architecture principal, and use Flutter's proper localization to replace our simple localization.",
  }),
  bengali({
    "english":"English",
    "bengali":"Bengali",
    "buttonIntroduction":
        "প্রতিটি বোতাম ক্লিকযোগ্য হওয়া উচিত।\nকিছু বোতামের জন্য নির্দিষ্ট স্তরের প্রয়োজন হতে পারে।\nকিছু বোতামের ক্ষেত্রে আপনাকে বুঝে নিতে হবে যে সেগুলি ক্লিক করা যাবে না।",
    "firstTest": "প্রথম পরীক্ষা",
    "secondTest": "দ্বিতীয় পরীক্ষা",
    "thirdTest": "তৃতীয় পরীক্ষা",
    "fourthTest": "চতুর্থ পরীক্ষা",
    "floatingButtonDescription":
        '+ বোতামটি ক্লিক করলে,\nতোমার লেভেল এলোমেলোভাবে বাড়তে বা কমতে পারে।\n\nতুমি এখন যে লেভেলে আছো: \${level}',
    "availableOnDescription": "লেভেল \${level} এ আনলক হবে",
    "yourLevel": "তোমার লেভেল: \${level}",
    "getSizeBeforeBuild": "build এর আগে size নিন",
    "getSizeAfterBuild": "build এর পরে size নিন",
    "firstTestIntroduction": "আপনি কি লক্ষ্য করেছেন যে 'scrolling' করার সময় ধীরগতি হয়? এটা ঠিক করার চেষ্টা করুন।",
    "secondTestIntroduction":
        "আমি আশা করি আপনি লক্ষ্য করেছেন যে প্রথম 'FirstTest' স্ক্রিন খোলার সময় ১ মিলিয়ন ডাটা তৈরি করার ফলে ল্যাগ হয়। আমরা জানতে চাই কেন এরকম ছোট একটি ল্যাগ হয়। আরও ভালো হবে যদি আপনি 'FirstTest' পেজটি পুনর্নির্মাণ করতে পারেন, সাথে তার 'Bloc' এবং 'State' ক্লাসগুলো, তবে ল্যাগ না করে, এবং এই 'Second Test widget' এর পরিবর্তে ব্যবহার করতে পারেন।",
    "thirdTestIntroduction":
        "আমার কাছে নিচে একটি খুব দীর্ঘ লোরেম ইপসাম টেক্সট আছে। এখন, এর উপরে থাকা দুইটি বোতামের কোনো লজিক এখনও তৈরি হয়নি। আমি চাই আপনি লজিকটি সংজ্ঞায়িত করুন, কীভাবে আমি টেক্সটের প্রস্থ এবং উচ্চতা পেতে পারি, দুটো ক্ষেত্রেই — 'Build' এর আগে এবং 'Build' এর পরে।",
    "fourthTestIntroduction":
        "আমরা এই প্রজেক্টের জন্য একটি খুব সাধারণ লোকালাইজেশন তৈরি করেছি, কিন্তু ফোল্ডার স্ট্রাকচার একটু এলোমেলো। আপনি যদি পারেন, তাহলে দয়া করে 'Clean Architecture' প্রিন্সিপাল অনুযায়ী ফোল্ডার স্ট্রাকচার পুনঃসংজ্ঞায়িত করুন এবং আমাদের সাধারণ লোকালাইজেশনের পরিবর্তে 'Flutter'-এর সঠিক লোকালাইজেশন ব্যবহারের উপায় দেখান।",
  });

  const SupportedLanguage(this.dictionary);

  final Map<String, String> dictionary;
}

SupportedLanguage currentLanguage = SupportedLanguage.english;

extension SupportedLanguageExt on SupportedLanguage {
  String translate(String key) {
    return dictionary[key] ?? key;
  }
}
