---
layout: post
title: Progress with the data structuring assignment
---

I tried using the following method: First collecting all the articles into one text file and removing the #ID tag and data, the other 
#... tags, and substituting those tags with tabs. Then I split the new text file into elements along the tabs. However, I did not manage
to write the items of the list onto a single line by every fourth element in order to create the TSV file.

```python
import re, os

source = "C:\\Users\\Siming\\Desktop\\siming\\AC_studies\\Tools and Techniques for Digital Humanities\\Perseus\\Perseus_articles\\"
target = "C:\\Users\\Siming\\Desktop\\siming\\AC_studies\\Tools and Techniques for Digital Humanities\\Perseus\\Perseus_articles_data\\"

lof = os.listdir(source)

with open(target+'alltext.txt', 'w', encoding="utf8") as outfile:
    for fname in lof:
        with open(source+fname, 'r', encoding="utf8") as infile:
            outfile.write(infile.read())
        
#Remove: "#.+?:\s" 
#Replace /#[A-Z]+:\s/ with \t
        
with open(target+'alltext.txt', 'r', encoding="utf8") as f1:
    text = f1.read()
    text = re.sub("#ID:.+[^#]","", text)
    text = re.sub("#.+?:\s","\t",text)
with open(target+'alltext_mod.txt', 'w', encoding="utf8") as f2:
    f2.write(text)
    
with open(target+'alltext_mod.txt', 'r', encoding="utf8") as f3:
    split = f3.read()
    split = re.split("\t", split)
```
