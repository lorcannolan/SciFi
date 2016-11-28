# OOP Assignment 1
This GitHub repository is for an assignment from semester 1 of my Object-Oriented Programming module from my second year of college. For this assignment, I was required to make a Sci-Fi themed user-interface where it “should have lots of animation & interactivity”. A summary of instructions on how to use the programme follows at the end of this readme.

As part of my research for this project, I looked online for many images of different types of UI’s from movies and video-games. While searching, I discovered an image from the movie “The Martian” where the main character is sitting in front of multiple computers. This image was my main source of inspiration for my assignment as it gave me the idea of making a UI for an astronaut on board a space shuttle where all the key information is on display. I decided to brainstorm this idea and after making a rough design with pen and paper I was happy enough to follow through with my idea.

->Login Screen:

When my project is run, the first thing that appears is a login screen. Although appearing first, this was in fact one of the final things I did in this assignment. The reason for this was because after making the rest of the functionality and running it many times, I felt it appeared too quickly and that there needed to be an introductory screen for the user.

To make the login screen I had to import the “ControlP5” library from processing. From there I added a text field and a button or “bang” as it is called in the “ControlP5” library. Next I adjusted the size of the text area and the button which was used with login functionality. I also included an image of the NASA logo to give it some authenticity.

->Main Screen:

After logging in the user is brought to the main screen. The layout design of the screen was the first thing I began to work on. My idea was that there would be a menu box on the left-hand side of the screen, a status box along the bottom of the screen, a box in the bottom left corner where the user’s “login” name would be displayed and an active screen which would display content to relate to what menu option the user chose. To do this I made different variables in relation to the size of the screen and made lines at different locations around the screen to make my desired layout.

Next, I made the options for my menu box. The options include; Home, Crew, Status, and Logout. After logging in, the home option is automatically selected.

->Home:

When the home option is chosen from the menu or after the user has logged in, a lot of info will be displayed on the activity screen. Firstly, the name of the mission appears at the top of the screen (inspiration again from the Martian). The time to destination is displayed along with the mission phase status, distance travelled, distance to destination, speed, and maintenance statuses.

Then home screen also contains the current GMT time on earth and a gif of planet earth rotating. To include the gif, I had to import the “gifAnimation” library. I then made a shape and added a background to that shape where the gif could be placed.

->Crew:

After selecting the Crew option from the menu bar, images of the user’s fellow crew members are displayed. I did this by downloading images of astronauts and cropping them in photoshop before inserting them into a data folder. After placing them into the data folder I could format the images in the screen. For example, the images are tinted and once the mouse hovers over an image it brightens, a box is drawn around the image, and some info on that crew member appears below their picture.

When Crew member is selected, more info on them is displayed. This info was taken from a .tsv file I made which is then loaded to a table once the programme has run. The info is then take from the table depending on which crew member is chosen.

->Status:

When the status menu is chosen, a graphical view of information from the status box is displayed in the activity box. For each graph, brief instructions are provided on how to interact with them. Depending on how the user changes the values of the oxygen level, the temperature, or the fuel level the values in the status box will constantly correspond.

If the fuel level drops below 15% or the oxygen level drops below 14%, a warning box will display on the screen no matter what option the user has selected. These warnings don’t disappear until the problem has been resolved, i.e. the oxygen level or fuel level is increased.

->Logout:

The functionality of the logout menu option is simple. If pressed, the user is logged out and the program closes.

--Instructions--

-	To use the login screen, you must click on the text field and type in your name. Be sure to use shift if you are typing a capital letter rather than caps lock as it will display a space between letters.
-	After typing your name, click on the login button rather than pressing the enter key as this will not work.
-	Click on different options in the menu box on the left-hand side of the screen.
-	In the crew screen, hover over a crew member to brighten their picture and display a short bio below.
-	To view their full bio, click on their picture.
-	Return by clicking the crew members option again or choose a different option.
-	In the status screen increase oxygen level by clicking on the fill button, change the temperature by clicking and holding on the (+) or (-) buttons, or increase the fuel level by pressing the re-fuel button.
- If you are finished, click on the logout option to close the program.
