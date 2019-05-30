---
layout: post
title: Text-to-Map Assignment
---

For this week's assignment, I used the codes of the [next lesson](https://univie-tnt-2019.github.io/11/) as an aid:
```python
import re, os
source = "C:\\Users\\Siming\\Desktop\\siming\\AC_studies\\Tools and Techniques for Digital Humanities\\Perseus\\Perseus_XML\\"
target = "C:\\Users\\Siming\\Desktop\\siming\\AC_studies\\Tools and Techniques for Digital Humanities\\Class10_Text_to_map\\homework\\"
topoDict = {}

def updateDic(dic, key):
    if key in dic:
        dic[key] += 1
    else:
        dic[key]  = 1
    
def collectTaggedToponyms(xmlText, dic):
    xmlText = re.sub("\s+", " ", xmlText)
    #date = re.search(r'<date value="([\d-]+)"', xmlText).group(1) (This was not necessary for this assignment)
    count1, count2 = 0,0
    for t in re.findall(r"<placeName[^<]+</placeName>", xmlText):
        t = t.lower()
        if 'tgn,' in t:
            if re.search(r'reg="([^"]+)"', t):
                reg = re.search(r'reg="([^"]+)"', t).group(1)
            else:
                #print(t)
                reg = 0

            if re.search(r'key="([^"]+)"', t):
                key = re.search(r'key="([^"]+)"', t).group(1)
            else:
                #print(t)
                key = 0

            if reg == 0 or key == 0:
                count1 += 1
            else:
                count2 += 1
                keyNew = reg+"\t"+key
                updateDic(topoDict, keyNew)
##    if count1 >= 0:
##        print("%s: %d out of %d toponyms misstagged." % (date, count1, count2))


def collectRawToponyms(source):
    lof = os.listdir(source)
    lof = sorted(lof, reverse=False)
    counter = 0
        
    for f in lof:
        if f.startswith("dltext"): # fileName test        
            with open(source + f, "r", encoding="utf8") as f1:
                text = f1.read()                
                collectTaggedToponyms(text, topoDict)

    freqList = []
    thresh = 100
    for k,v in topoDict.items():
        if v >= thresh:
            freqList.append("%09d\t%s" % (v,k))
    print("Number of unique items with freq at least %d: %d" % (thresh, len(freqList)))

    # Number of unique items with freq at least 1: 9246
    # Number of unique items with freq at least 2: 5388
    # Number of unique items with freq at least 3: 4062
    # Number of unique items with freq at least 4: 3344
    # Number of unique items with freq at least 5: 2932

    freqList = "\n".join(sorted(freqList, reverse=True))
    with open(target + "freqList.csv", "w", encoding="utf8") as f9:
        f9.write(freqList)
        

collectRawToponyms(source)
```
So far everything was clear, and the frequency list was successfully created. The abbreviation 'tgn' stands for the ['Getty' Thesaurus
of Geographic Names](https://www.getty.edu/research/tools/vocabularies/tgn/) ID of the given location as I figured out.
I substituted "\t" for " >> " for easier readability:  

![](/img/text_to_map1.png)  

The second round (to add coordinates to the place names) starts like this:
```python
import re, os

def loadGeoData(fileName):
    dic = {}

    with open(fileName, "r", encoding="utf8") as f1:
        data = f1.read().split("\n")
        
        for d in data:
            d1 = d.split("\t")

            if len(d1) == 19:

                val = "\t".join([d1[1]+", "+d1[10], d1[4], d1[5]])
                test = d1[1].lower()

                if test in dic:
                    dic[test].append(val)
                else:
                    dic[test] = [val]
                
    return(dic)

geoDataFile = "./US/US.csv"
geoData = loadGeoData(geoDataFile)
```
So far it was all clear, after checking out the readme.txt downloaded from [Geonames.org](http://download.geonames.org/export/dump/),
it was clear that the indeces of `d1` refer to the columns in the US.zip database downloaded from the same source (featuring altogether
18 columns).
The second part of the code looks like this:
```python
def processResults(fileName):
    with open(fileName, "r", encoding="utf8") as f1:
        data = f1.read().split("\n")

        newData = []

        noResult = "\t".join(["NA", "NA", "NA"])

        for d in data:
            d1 = d.split("\t")

            if "," in d1[1]:
                test = d1[1].split(",")[0]
            else:
                test = d1[1]

            if test in geoData:
                for i in geoData[test]:
                    newData.append(d+"\t"+i)
            else:
                newData.append(d+"\t"+noResult)
            
    with open("matchedResults.csv", "w", encoding="utf8") as f9:
        f9.write("\n".join(newData))

processResults("freqList.csv")
```
However, this returned the following error message and I could not figure out why splitting `d` into the list `d1` was unsuccessfull:
![](/img/text_to_map2.png)  

Following this, representing the data on map would have involved the steps discussed during the class on [Georeferencing](https://univie-tnt-2019.github.io/05/) ("Adding Delimited Text Layer") and data-based styling of the layer (for which I found a description [here](http://learngis.uk/proportional-symbol-map-qgis-2-18/)).



