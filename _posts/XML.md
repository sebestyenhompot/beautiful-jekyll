---
layout: post
title: Explaining the XML Assignment
---

(1/A) For creating the cleaned copies of the Perseus XML files, I took the following steps:  

1. Importing the RegEx module into Python: `import re`.  

2. To make things easier, defining the path of the folder used for this excercise: `folder_path = 'C:\\Users\\Siming\\Desktop\\siming\\AC_studies\\Tools and Techniques for Digital Humanities\\Perseus\\Perseus_XML\\'`.  

3. Importing the OS (Operation System) module and listing files in the folder with the 'listdir' function, followed by printing the full paths of the files to check the results:  
```python
import os
lof = os.listdir(folder_path)
for file in lof:
    print(folder_path+file)
```
    
4. I created a loop for opening and reading each file of the list, saved the results in data2, used the re.sub function, 
created a new dataset after removing the XML tags, named the new files by adding "_modified.xml" to the original filename 
and wrote the new files:
```python
for file in lof:
    with open(folder_path+file, "r", encoding="utf8") as f2:
        data2 = f2.read()
    dataNew2 = re.sub("<[^<]+>", "", data2)
    newFN = file + "_modified.xml"
    with open(newFN, "w", encoding="utf8") as f3:
        f3.write(dataNew2)
```

I could not, however, figure out how to set the target folder for the new files, therefore it was by default saved into my
`Documents` folder. Using 'date of creation' based listing, I selected the new files manually and moved them into a new folder
created for this assignment.
