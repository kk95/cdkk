# Stock Alert

### Statement
As we grow older, we get money, and we should invest that money. What are we supposed to invest in? Well, there are Savings accounts. Those are nice, but they only get like 3% a year. What if you want double that??

Our simple solution allows individuals to somewhat intelligently find out different analytics about various stock symbols.

### Analysis
We can use data Abstraction to make classes of stocks with methods and values.

We will use filtering for several of the options. This includes stocks that have gone up recently, or stocks that are between certain values. We will use foldr for averaging over certain periods of time.

We will have methods that are procedures inside the objects.

We will use an expression evaluator to interpret different commands.

We'll use state modification to change the stock values and states.

### External Technologies
Our system will connect to a stock API in order to retrieve values and other useful information.

### Data Sets or other Source Materials
We'll get our data from Yahoo Stock API. We have confirmed that the data is returned by a request to a URL: finance.yahoo.com/webservice/v1/symbols

### Deliverable and Demonstration
Our program will send notifications of your portfolio once an hour or send updates to something when a stock goes up by 1, 5, or 10% based on your settings.

It will run on live data produced by Yahoo Finance.

### Evaluation of Results
We will be successful if we are given responses at the appropriate times. Because the data will be in the actual messages, we will have excellent indicators of success.

## Architecture Diagram
![test image](/Architecture.png?raw=true "test image")

### First Milestone (Sun Apr 9)
We will be able to access stock values and print them in Racket. We will also be able to send text messages from Racket.

On time we were able to access stock values and also are almost able to send text messages.
There is a login procedure with Google that isn't built in to Racket's SMTP methods.

### Second Milestone (Sun Apr 16)
We will be able to send stock values, and all objects will be designed. Our command interpreter will be complete at this time as well.

### Public Presentation (Mon Apr 24, Wed Apr 26, or Fri Apr 28 [your date to be determined later])
All other mentioned implementation details.

## Group Responsibilities
Here each group member gets a section where they, as an individual, detail what they are responsible for in this project. Each group member writes their own Responsibility section. Include the milestones and final deliverable.

Please use Github properly: each individual must make the edits to this file representing their own section of work.

**Additional instructions for teams of three:** 
* Remember that you must have prior written permission to work in groups of three (specifically, an approved `FP3` team declaration submission).
* The team must nominate a lead. This person is primarily responsible for code integration. This work may be shared, but the team lead has default responsibility.
* The team lead has full partner implementation responsibilities also.
* Identify who is team lead.

In the headings below, replace the silly names and GitHub handles with your actual ones.

### Christian Dumas @christianrdumas
I will handle gathering stock values from Yahoo!

### Kshitij Karke @kk95
I will parse xml files of he portfolio and have them get sent to your mobile phone. This could also include screetshots of charts sending them as an MMS. 


<!-- Links -->
[forum]: https://groups.google.com/forum/#!forum/uml-opl-spr17
[markdown]: https://help.github.com/articles/markdown-basics/
[gslides]:https://slides.google.com
[martinslides]:https://docs.google.com/presentation/d/1fzNX4nV4z6IkLiVBMB0YD4CctlJxR9pWXSbYTOFcQvc
[projform]:https://goo.gl/forms/Gfh9hWBgvg323j6M2
[oplorg]:https://github.com/oplS17projects/
