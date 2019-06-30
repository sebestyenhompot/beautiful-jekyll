---
layout: post
title: Class 5 Georeferencing Assignment - Forty cities you would not think are located (also) in the U.S.
---

For the georeferencing assignment I used two old maps (one dated to 1843, the other not dated) of the United States.
I found it exciting that **many cities in the U.S. are actually named after cities in other countries**.  

For obvious historical reasons, British cities play prominently (Liverpool and Manchester apparently have several twins on the other side of the Atlantic) but
there are also many city names of Greek background (Athens, Ithaca, at least two Spartas) and others with origins from countries as diverse as India,
Poland and Saudi Arabia (Delhi, at least three Warsaws, Medina). **Vienna** also has its twin city located in [Illinois](https://en.wikipedia.org/wiki/Vienna,_Illinois).  

It is also worth mentioning that some cities appearing on these 19th century maps are not inhabited anymore, such as this ghost-town version of [Belgrade](https://en.wikipedia.org/wiki/Belgrade,_Texas) in Texas, destroyed during the Civil War.

I hereby submit the screenshots and CSV texts of my assignment:  

![](/img/georeferencing_us_cities1.png)  
city,state,lon,lat,lon1,lat1  
Alexandria, Louisiana, -92.710,30.810,-92.710,30.810  
Athens, Ohio, -82.250,38.394,-82.250,38.394  
Belfast, Maine, -68.406,44.285,-68.406,44.285  
Chester, New Hampshire, -70.648,42.808,-70.648,42.808  
Carthage, New York, -75.398,43.183,-75.398,43.183  
Dover, New Hampshire, -70.359,43.050,-70.359,43.050  
Glasgow, Kentucky, -85.914,36.041,-85.914,36.041  
Hanover, Vermont, -71.750,43.308,-71.750,43.308  
Ithaca, New York, -76.367,41.738,-76.367,41.738  
Lancaster, New Hampshire, -71.093,44.092,-71.093,44.092  
Oxford, North Carolina, -78.703,35.738,-78.703,35.738  
Paris, Maine, -69.960,43.916,-69.960,43.916  
Plymouth, Massachusetts, -69.992,41.840,-69.992,41.840  
Plymouth, New Hampshire, -71.226,43.402,-71.226,43.402  
Portsmouth, New Hampshire, -70.187,42.957,-70.187,42.957  
Sparta, Alabama, -87.335,30.812,-87.335,30.812  
Sparta, Tenessee, -85.531,35.047,-85.531,35.047  
Troy, New York, -73.179,42.172,-73.179,42.172  
Vienna, Illinois, -88.718,36.390,-88.718,36.390  
Windsor, New Hampshire, -71.937,43.027,-71.937,43.027  
  
![](/img/georeferencing_us_cities2.png)  
city,state,lon,lat,lon1,lat1  
Belgrade, Texas, -95.476,29.178,-95.476,29.178  
Delhi, New York, -74.824,42.302,-74.824,42.302  
Dover, Missouri, -94.275,39.166,-94.275,39.166  
Dresden, Illinois, -88.627,41.406,-88.627,41.406  
Dresden, Tennessee, -88.907,36.245,-88.907,36.245  
Florence, Georgia, -85.144,32.025,-85.144,32.025  
Lima, Indiana, -85.616,41.682,-85.616,41.682  
Liverpool, Mississippi, -90.383,32.592,-90.383,32.592  
Liverpool, Texas, -95.476,29.178,-95.476,29.178  
Manchester, Kentucky, -83.717,37.211,-83.717,37.211  
Manchester, Virginia, -77.459,37.470,-77.459,37.470  
Medina, Ohio, -81.869,41.169,-81.869,41.169  
Montpelier, Indiana, -85.462,40.581,-85.462,40.581  
Singapore, Michigan, -86.307,42.683,-86.307,42.683  
Sparta, Georgia, -83.188,33.181,-83.188,33.181  
Strasburg, Pennsylvania, -76.553,39.716,-76.553,39.716  
Versailles, Missouri, -93.195,38.428,-93.195,38.428  
Warsaw, Illinois, -91.726,40.328,-91.726,40.328  
Warsaw, Indiana, -85.462,40.581,-85.462,40.581  
Warsaw, Missouri, -93.686,38.221,-93.686,38.221  

Meanwhile, I would also like to point out some issues I came across during completing the assignment.
Since both maps have coordinate systems I did the georeferncing by the manual input of the coordinates in their four corners.
Therefore, a certain degree of inaccuracy can be expected, although based on some double-checking on Google Maps, I do not think it is
beyond 1 degree.  
Longitudes on the second map are based on the position of Washington D.C. After checking out the city's position on Google Maps, I
concluded that the map's 0° longitude is equal to -77° (West) of the international standard (based on Greenwich, UK). I did the input of
the corner coordinates according to this.  
One of the difficulties was that when I added the Google Maps and OpenStreetMaps layers in QGIS, it apparently displays incorrect
coordinates for me. For example, [the coordinates of New York City](https://www.latlong.net/place/new-york-city-ny-usa-1848.html) are apparently ca. "-74 West, 41 North" and not "-8234229.297 West, 4970380.761 North" as displayed in the Google Maps layer inside QGIS.
I would also like to note that when opening Google Maps in Chrome, it works with the correct coordinates.  
When I tried to connect the layer of the maps used for the project and the Google Maps layer (for using the "From Map Canvas" function
to add coordinates), QGIS displayed both the correct and incorrect coordinates on the left side (under 'Coordinate Capture', see attached image below): 
  
![](/img/georeferencing_issues1.png)    
  
However, upon clicking on the point I wished to add, it only captured the incorrect ones (see second image below):  
![](/img/georeferencing_issues2.png)  




