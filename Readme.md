# FP4-proposal

**do not fork this** there are different directions

## tl;dr

1. Create a repository in [our organization][oplorg] for your project; add your teammate(s) as collaborators
2. Copy-paste this [template file](template.md) as the `README.md` file in your new repo; edit to become project plan
3. Make 3-slide slide show to be presented in class; insert into [class desk][martinslides]
4. Enter project details into a new [Google form][projform]
5. Make a 0.1 release of your project (tagging `@fgmart`)

## Due Date
* Sun Apr 2, 2017 at 11p

## Instructions

Teams will submit a single proposal, with sections that each member has done individually detailing their proposed contributions. The submission will be the `README.md` file in your brand-new project repository, which you'll make. 

You must start using GitHub collaboratively from this point forward. 

Instructions: 

1. Create a new repository for your project as part of [our organization][oplorg]
  * Give it a name that you like—it may be your real names, usernames, or project name
  * Add your teammates as collaborators (Settings > Collaborators & Teams > Add Collaborator)
2. Copy the content from the [template file](template.md) into your `README.md`
  * Click the “Raw” button on the `template.md` file and then copy-paste into your repo's `README.md` edit view
  * Save it
  * *Then start editing it to become your actual proposal*
3. Everyone on the team contributes their sections to your `README.md` file.
  * Use GitHub's collaboration features to make sure that each team member contributes meaningful content to the file
  * At the absolute minimum, respective team members must have commits that show they have authored the section describing their planned contributions
4. Create a [github Release](https://help.github.com/articles/creating-releases/) of your repository. 
 * Version: v0.1
 * Title: Proposal
 * Description: tag `@fgmart`

And now some detail on what to write _in_ the report.

**Overall guidance:** *You should be proposing something that you have high confidence that you can achieve, and the proposal should project that confidence.*

The proposal should be no longer than necessary, but long enough to include critical detail. Diagrams are welcome. 

Remember, you can do some neat [formatting things with Markdown.][markdown]

In case you missed it, here again is the [template file](template.md)

## In-Class Presentation 
Teams will each deliver an in-class presentation. Your team will have two minutes to present.

The presentation shall have exactly three slides:

1. Title
  * project title (10 words or fewer)
  * your real names
  * each real name followed by GitHub username
  * a relevant image of some sort (optional)
2. Overview
  * a few short phrases describing the project
  * a different relevant image (optional)
3. Architecture Diagram 
  * visual diagram showing the major components of the project
  * include external things that your project will connect to
  * include arrows showing flow of information
  * internal components annotated with Racket libraries that they will use
  * _important:_ annotate each block with the GH username of the person who is primarily responsible for its creation

Make the slides in [Google Slides][gslides].

Then, import your deck into the [slide deck][martinslides]. You have write privileges based on your membership in the class forum.

You and your teammates will give the presentation in class the day that this assignment is due.

## Fill out Project Information Form

Enter project details into a new [Google form][projform].

**This is absolutely necessary so I can keep track of all of the projects.**

## Grading
The proposal must be submitted on time to receive credit. Late submissions will not be accepted for credit.

You personally must be present in class (and participate in the presentation when it is your turn) to receive credit for the presentation. If your teammates are there and you are not, they will receive presentation credit and you will not.

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


## Schedule
Explain how you will go from proposal to finished product. 

There are three deliverable milestones to explicitly define, below.

The nature of deliverables depend on your project, but may include things like processed data ready for import, core algorithms implemented, interface design prototyped, etc. 

You will be expected to turn in code, documentation, and data (as appropriate) at each of these stages.

Write concrete steps for your schedule to move from concept to working system. 

### First Milestone (Sun Apr 9)
Which portion of the work will be completed (and committed to Github) by this day? 

### Second Milestone (Sun Apr 16)
Which portion of the work will be completed (and committed to Github) by this day?  

### Public Presentation (Mon Apr 24, Wed Apr 26, or Fri Apr 28 [your date to be determined later])
What additionally will be completed before the public presentation?

## Group Responsibilities
Here each group member gets a section where they, as an individual, detail what they are responsible for in this project. Each group member writes their own Responsibility section. Include the milestones and final deliverable.

Please use Github properly: each individual must make the edits to this file representing their own section of work.

**Additional instructions for teams of three:** 
* Remember that you must have prior written permission to work in groups of three (specifically, an approved `FP3` team declaration submission).
* The team must nominate a lead. This person is primarily responsible for code integration. This work may be shared, but the team lead has default responsibility.
* The team lead has full partner implementation responsibilities also.
* Identify who is team lead.

In the headings below, replace the silly names and GitHub handles with your actual ones.

### Susan Scheme @susanscheme
will write the....

### Leonard Lambda @lennylambda
will work on...

### Frank Funktions @frankiefunk 
Frank is team lead. Additionally, Frank will work on...   

<!-- Links -->
[forum]: https://groups.google.com/forum/#!forum/uml-opl-spr17
[markdown]: https://help.github.com/articles/markdown-basics/
[gslides]:https://slides.google.com
[martinslides]:https://docs.google.com/presentation/d/1fzNX4nV4z6IkLiVBMB0YD4CctlJxR9pWXSbYTOFcQvc
[projform]:https://goo.gl/forms/Gfh9hWBgvg323j6M2
[oplorg]:https://github.com/oplS17projects/
