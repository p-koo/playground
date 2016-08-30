# mini-project to improve self-diagnosis

This is a work-in-progress project to improve and streamline
self-diagnosis.  If you've ever been on WebMD, you know that
if you have a headache and a cough, then you either have
pneumonia or brain cancer.  The backend search is not very
sophisticated and annoying.  

So, this is a fun little project to scrape the conditions from
websites like WebMD and perform my own clustering to determine
a set of questions that asks the user if they have a particular
condition.  The system will adjust the space of possible condition 
after each answer and generate a new question based on what 
conditions remain.  The goal of an efficient algorithm will try 
to ask the condition that can split the condition in half.  

Cheers!
