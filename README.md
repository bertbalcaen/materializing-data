# Turning Data into Matter - ITP Camp 2014 workshop

### Step-by-step setup

* Download Processing 2
  * for OS X 16.8 Snow Leopard, use Processing 2.0.2: https://code.google.com/p/processing/downloads/list
  * for above OS X 16.8, download the latest Processing: https://processing.org/download/
* Download this code ("Download ZIP" button to the right)
* Open the data file (/data/2014/campers.csv) and replace the data with your own. 
  * Be careful to remove whitespaces around commas, and to wrap strings in double quotes ("Firstname Lastname").
* Run the sketch : /visualizations/campers_2014/campers_2014.pde
* Press 'p' to generate a PDF of the sketch.
* Put the PDF on a USB dongle and load it in the laser cutter (ask a councelor if necessary). Change the strokes 0.1 pt width.
* Laser cut your stuff!

### Going further

* EASY: [project](http://www.theworldneedsmoredreamers.net/personalized-medals-for-runners-v2/) about mapping running data to a medal with similar Processing code that creates a final laser-cut artefact.
* ADVANCED: And another [personal Processing project](http://www.theworldneedsmoredreamers.net/grenade-lamp/) that creates a 3D form instead, for 3D printing.

### Resources

* Books/Learning
  * [The Nature of Code](http://natureofcode.com/) : free online book about programming in Processing by Dan Shiffman, who teaches at ITP. Focuses on math occuring in nature which often applies to interactive data viz.
  * [The Nature of Code videos](http://vimeo.com/channels/natureofcode) : tons of free videos by Dan, basically a free online course!
  * [The Visual Display of Quantitative Information](http://www.amazon.com/The-Visual-Display-Quantitative-Information/dp/0961392142/ref=sr_1_1?ie=UTF8&qid=1402854902&sr=8-1&keywords=tufte) : the contemporary classic on principles of data visualization.
  * [Generative Design](http://www.amazon.com/Generative-Design-Visualize-Program-Processing/dp/1616890770/ref=sr_1_1?ie=UTF8&qid=1402639132&sr=8-1&keywords=generative+gestaltung) : a notable Processing book that shows examples of creative & artistic programming, with great sections on basic mathematical principles for programming graphs, etc.
  * [Interactive Data Visualization](http://alignedleft.com/work/d3-book) : classic O'Reilly book on D3.js. Free online version!
* Tools
  * Pre-compiled collection of [various tools here](http://selection.datavisualization.ch/)
  * Libraries:
    * [Hemesh](http://www.creativeapplications.net/processing/hemesh-and-hemeshgui-processing/): 3D mesh generator
    * [ga2csv](https://github.com/bertbalcaen/ga2csv): PHP script that translates Google Analytics data into CSV format. Was used in Bert's project to visualize GA data on a poster design.
    * [PHP Simple Html Dom Parser](http://simplehtmldom.sourceforge.net/): PHP script to scrapper HTML data from a website. It's already in this repo, and was used for scraping the camper data from last year's camp.
  * Other languages:
    * [Processing.js](http://processingjs.org/) : a port of Processing for the web. Allows to play Processing sketches in the browser. Doesn't likely support all of the features, but at least some.
    * [D3.js](http://d3js.org/): popular Javascript framework for building interactive dataviz projects. Used extensively by the New York Times.
    * [DimpleJS](http://dimplejs.org/) : an abstraction of D3.js for beginners. Never tried it but seems useful to get your feet wet.
  * Software/Apps
    * [Raw](http://app.raw.densitydesign.org/) : web app. Give it some data, and it will automagically produce embeddable charts for you. Chart types are limited but it's a good way to visualize your data quickly, to get a sense of it. Lacks basic chart types, oddly.
    * [Tableau Public](http://www.tableausoftware.com/public/) : desktop app used in workshops by Moritz Stefaner to quickly produce various types of charts of a dataset, to initially get a sense of the data. Never used it myself, but it is quite famous.
    * [OpenPaths](https://www.openpaths.cc/) : mobile app fmor the New York Times that tracks your GPS position so you can export the data and use it for visualizations.
    * [Repoter iOS app](http://www.reporter-app.com/) : iOS app by Nicholas Felton that helps track data about where you are, what you doing, etc. Useful to build a large dataset about your everyday comings & goings, but slightly annoying.
    * [Insta-Mapper](http://www.insta-mapper.com/) : another mobile app that tracks your GPS data constantly.
* Data resources
  * [NYC OpenData](https://nycopendata.socrata.com/) : bank of free data about NYC, from banks to government to housing.
  * [World Bank Open Data](http://data.worldbank.org/): bank of free data about innumerable topics of global development.
* History lesson
  * [Video lecture on the history of data visualization](http://hci.stanford.edu/courses/cs547/abstracts/08-09/090213-heer.html) : Jeff Heer is a major authority on the field and here is an early lecture of his on its history. Great stuff with hidden gems. PS: his students include Mike Bostock (who started D3.js with him) and notable others.
  * [Detailed historical list of physical visualization examples](http://www.aviz.fr/Research/PassivePhysicalVisualizations)
* Examples & artists
  * [Moritz Stefaner](http://moritz.stefaner.eu/) : important designer that gives workshops & lectures. His piece 'Selfie City' made a big splash.
  * [Giorgia Lupi](http://giorgialupi.net/) : important conference speaker, works at [Accurat](http://www.accurat.it/), a leading information design agency.
  * [Jonathan Harris](http://number27.org/work) : creator of the early seminal piece 'We Feel Fine' and many other great ones.
  * [Collection of the NYT's dataviz projects of 2013](http://www.nytimes.com/newsgraphics/2013/12/30/year-in-interactive-storytelling/#dataviz) : important examples of classic dataviz. Many are made by Mike Bostock, leader of D3.js.
  * [Infosthetics](http://infosthetics.com/) : nice blog collecting info design and dataviz projects.
  