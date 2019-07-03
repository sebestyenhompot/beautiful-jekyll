---
layout: post
title: Class 10 - Some issues with QGIS
---

A reoccurring problem while using QGIS was that when I was trying to add a delimited text layer to the Google Maps layer, it basically 
loaded all the points on a minimal scale around the 0 degree of the coordinate system (thus, not far from Sao Tome and Principe in the 
Gulf of Guinea). I used a TSV file in the following format created through the `match` function used in the text-to-map assignments:  

![](/img/coord_qgis.png)  

After adding it in QGIS, it first looked as if only one point would have been added to the 0 degree of the coordinate system:

![](/img/qgis_error1.png)  

However, after zooming in it becomes clear that all the points were added in proper position relative to each other, 
but in a much smaller scale than that of the Google Maps layer:

![](/img/qgis_error2.png)  

Adding other layers, such as the manually georeferenced raster layer (old U.S. map) used for the georeferencing assignment (class 5) shows the same problem.
The raster appears in the same position as the delimited text layer:  

![](/img/qgis_error3.png)  
