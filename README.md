# MasterProjectv1
Master thesis project
      Validation of Architectural Tactics to Improve the Development of Energy-efficient Mobile Apps applied to Occupancy Detection
                                                Umoru Aikwatiame Joseph
                                              Syddansk Universitet Odense

                                                      Abstract
Occupancy detection as the name implies, involves the ability to determine building occupancy in real time. In this thesis, 
iBeacons would be the tool of choice in occupancy detection, while turning the occupants mobile devices into sensors. 
This process involves the use of mobile devices, and their integrated sensors, to detect the Bluetooth signals from the iBeacons. 
However, mobile devices are plagued by certain challenges, with respect to software architecture. 
In the issue of mobile devices been battery powered, and the processing and collection of sensor data. 
These challenges, have given rise to various architectural tactics in the area of energy efficiency, and resource control. 
This thesis, aims to provide an empirical investigation, in the feasibility of the structured architectural tactics.

The mobile application was developed using swift 2.2

Installation of Mobile Application

The folder on the thumb drive consists of various files. However within the folder there exist a file called “MasterProjectv1.xcworkspace” double click this file in other to view the project in xcode. After which the you run the program in other to install the program onto an iOS device  
Launching the application

The mobile application is easy use and more less the application does all the heavy lifting itself. The application launched by simply tapping on the icon on the Home screen.
Using the App
Upon launching the app, you will be welcome by the image display below and as you move closer to any of the beacons associated to a specific location displayed on the screen it immediately turn grey and you can also see how close you are to the beacons on the top right corner of the screen.

![alt tag](https://s9.postimg.org/pjd3pz2sb/first.png)
 
Adding beacons
To add beacons simply tap on the beacon button on the top left corner of the screen. This first shows you a list of available beacons and Meta data for ranging by the mobile application. The next step is to tap on the “+” button on the top left corner of the screen which shows the web interface for interaction with web application where you can Add beacons, Edit and Delete beacons as desired

 

 

View Geo-fences set up
Just you followed the steps in adding the beacons you continue by tapping on the Map button on the top left corner of the screen. This displays a map view showing an annotated geo-fence. In which you have the ability to zoom in and out and also tap on the geo-fence pin to get information on the geo-fence. This includes the radius of the geo-fence and the trigger for action associated to the geo-fence i.e. if the mobile application enters or exits the geo-fence and to delete the geo-fence. Also on the lower right corner of the screen you would notice a current location icon button that immediately displays your current location on the map when tapped.

 

Adding Geo-fences
Just as you followed the step in viewing the Geo-fences you continue by tapping on the “+” button on the top left corner of the screen to view the Add Geotification view. This view consist of a small map in which you zoom in or out and also rotate in other to select a specific location you wish to insert a geo-fence using the stationary large pin on top of the Map. The next step after moving the map to a location of your choosing, is to type a name or note in the Note text field as an annotation for the geo-fence. The radius also MUST be added before the ADD button on the top left corner becomes active to add the geo-fence. However the moment the add button is tapped, it exit this view and returns to the previous map view to show all geo-fences available.

  


