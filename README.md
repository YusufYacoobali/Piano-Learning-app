# Read That Sheet

This is a self-contained, cross-platform app designed for mobile phones. The app will run on tablets, however, some scaling issues are to be expected. This app is developed to support piano students on their sight reading journey.

It allows the students to practice identifying individual notes on a staff within the bass and treble clef. The app tracks the time taken by the user to identify the notes and whether they do this correctly, to provide the user with a more personalised experience.

The notes are taught gradually, starting from a few basic notes to slowly increasing their range. The current range of notes being introduced covers three octaves from C3 to C5, where C4 is middle C.

The app tracks the notes the user struggles to identify quickly or accurately and those which they can. This data is then utilised to create practice quizzes that focus on the notes the user needs more practice on, providing a more optimised approach to their learning (this process is detailed in the 'Practice Guided by User's Performance' document).

To allow the user to relate the notes to the keys on the piano, the app incorporates a virtual keyboard that the user can click on.

The app also includes features to encourage and motivate the user to learn. This includes the gamification in the practice section, the daily notifications at 12:00 pm UTC, achievements and other features.

## Getting Started

### Deployment Links
All of these links can be used to access the app. As Appetize.io has limited amount of minutes for testing the app online, if any of these links are not working as expected please use another one.

  - Link 1: <https://appetize.io/app/nw66eb72c5wqyp55v3nrvb6ge0?device=pixel4&osVersion=11.0&scale=75&orientation=landscape&audio=true>
  - Link 2: <https://appetize.io/app/kdt7g2w9dzjmrq2e6vt1r50et0?device=pixel4&osVersion=11.0&scale=75&orientation=landscape&audio=true>
  - Link 3: <https://appetize.io/app/65h48c9ffd4dzdn4zt3rd1pjbw?device=pixel4&osVersion=11.0&scale=75&orientation=landscape&audio=true>
  - Link 4: <https://appetize.io/app/24b145fxh3e5dy3ctef4q8rx9r?device=pixel4&osVersion=11.0&scale=75&orientation=landscape&audio=true>
  - Link 5: <https://appetize.io/app/2adc3br7rtwxrwhp59gt01pvnm?device=pixel4&osVersion=11.0&scale=75&orientation=landscape&audio=true>
  - Link 6: <https://appetize.io/app/7wjmmrg8rhangnwx0v11e7xjc0?device=pixel4&osVersion=11.0&scale=75&orientation=landscape&audio=true>
  - Link 7: <https://appetize.io/app/mf9wjkv5wg08u0k6ffh35em5mm?device=pixel4&osVersion=11.0&scale=100&orientation=landscape&audio=true>


Note: The loading of the sound files on Appetize and the simulator/emulator can sometimes be slow, for the best experience, please allow the app a few tries to load the sounds when using the keyboard.

---

### How to use:

The app contains multiple features which are all easy to access and use.\
The app has lessons that can be found by clicking on the lessons button from the menu screen.  The lessons menu contains ten different lessons that gradually increase in difficulty. These teach the user to read notes from C3 to C5, including the sharps and flats. Lessons 9 and 10 are recap lessons for the treble and bass clef respectively.\
The three octaves of the piano can be accessed via the swipeable on-screen keyboard, a right swipe for the lower octave (C3) and a left swipe for the higher octave (C5); the keyboard always starts with the middle C (C3).\
\
The app also contains a 'Helper' section. This section holds summary cards for all notes introduced in the lessons and a guide to the note lengths. The 'Play along' mode uses different types of notes, which are not taught in the lessons therefore the users can use the summary cards to learn what they mean.\
Although the app uses notes of varied lengths, the app does not support holding a key for an extended period of time. In the play along mode, regardless of the note type displayed, the user should tap the key as usual. The different note types are taught in the note help mode to familiarise the user with what to expect when they see real sheet music.

To practice these lessons, the user can engage in the different modes of practice available by clicking on the Practice button.\
The Practice mode consists of four different types of gameplay: Play along, Speedrun, Take a Quiz and Endless.

 The practice modes are designed for a fun game-like experience, where the user can play as they like, hence the user's speed and accuracy at reading the notes are not tracked, except in the 'Take a Quiz' mode. This is because the quizzes are a revision of all the lessons, and the user metrics allow a more guided practice that focuses on the notes the user is weakest in identifying.

The 'Play Along' mode contains a list of tracks the user can select from to learn to play. The notes of the melody will move across the screen and the user has to play them when they reach the green zone on the left side of the screen. Pressing the wrong notes in play along will not make a difference to the score as long as the correct note is played when the note reaches the green zone, this ensures a smooth experience when learning a specific song.

The 'Speedrun' mode aims to improve the player's sight-reading speed. This mode contains a list of different time lengths the user may want to play for. The user has to answer the questions on screen as quickly as they can in the chosen amount of time.

The 'Endless' mode aims to improve the player's accuracy at reading notes. As in 'Play along' the notes move across the screen and the player must click the correct note when it reaches the green zone. The difference, however, is that the notes are randomised and clicking any wrong note will end the game. The endless mode is affected by the users' set difficulty. As the difficulty increases, the number of sharps and flats increases. Beginner mode will have none, some in intermediate and all the notes in expert mode.

The last mode of Practice is the 'Take a Quiz', this is the only practice mode that tracks the user's answers to customise their practice. The quizzes are a collection of all the questions in the lessons. The user can decide to either practice notes from a specific lesson or do a random quiz with questions from all the lessons.\
The order of questions for this is determined by the player's strength in identifying the notes. If a user is slow or incorrect in identifying the note, then that note will appear more frequently in the quizzes.

To motivate the users to learn, the app also contains achievements. These can be found from the achievements button on the main menu screen. The app contains over 30 different achievements that the user can complete. The achievements screen contains two tabs, all Achievements start in the 'To do' tab and as the user completes them, they are moved to the 'Completed' tab.

Another feature to motivate the user is with a daily notification. The user will be notified with a daily reminder at 12:00 pm UTC to learn and practice their notes.

The app also contains a settings menu where the user can change the difficulty of the app. Increasing the difficulty will increase the speed in all the modes and remove the labels from the keyboard keys. The user can also change the theme on the app between light, dark and pink mode. The settings menu has a 'Reset Progress' button which the user can use to reset any saved data about their progress. This button will clear any activity the user has done in the lessons, achievements, any records/high scores and any customised settings.


## Built with
  - Dart  - The programming language used
  - Flutter packages:
    - Setting screen: settings_ui (version 2.0.2)
    - Achievements screen: percent_indicator (version 4.0.0)
    - Persistent storage of data: shared_preferences (version 2.0.13)
    - Theme changer: provider (version 6.0.2)
    - Notifications: flutter_local_notifications (version 9.3.2)
    - Getting local timezones: flutter_native_timezone (version 2.0.0)
    - Notifications: rxdart (version 0.27.3)
    - animated circular countdown: circular_countdown_timer (version 0.2.0)


## Authors
  - Aaron Gomes
  - Yingtong (Kiley) Hu
  - Nannaphat (Minnie) Keamanuchet
  - Kyal Patel
  - Janies Rosario
  - Pradeep Shah
  - Yusuf Yacoobali

## LICENSE
MIT License
