---
layout: post
title: Class 4 Pandoc Assignment Completed
---

After creating the Markdown version of the assigned TXT file, I converted it using the following commands:

pandoc -f markdown -t latex -o main.pdf --filter pandoc-citeproc main.md  

pandoc -f markdown -t html -o main.html --filter pandoc-citeproc main.md  

pandoc -f markdown -t docx -o main.docx --filter pandoc-citeproc main.md  

See the resulting files here:  
[McCarty PDF](/img/pandoc.pdf)  
[McCarty HTML](/img/pandoc.html)  
[McCarty DOCX](/img/pandoc.docx)  

