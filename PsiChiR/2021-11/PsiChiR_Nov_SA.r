
R version 4.1.1 (2021-08-10) -- "Kick Things"
Copyright (C) 2021 The R Foundation for Statistical Computing
Platform: x86_64-apple-darwin17.0 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[R.app GUI 1.77 (7985) x86_64-apple-darwin17.0]

[Workspace restored from /Users/salmaabusamrah/.RData]
[History restored from /Users/salmaabusamrah/.Rapp.history]

> install.packages("rio")
--- Please select a CRAN mirror for use in this session ---
trying URL 'https://mirror.las.iastate.edu/CRAN/bin/macosx/contrib/4.1/rio_0.5.27.tgz'
Content type 'application/x-gzip' length 533163 bytes (520 KB)
==================================================
downloaded 520 KB


The downloaded binary packages are in
	/var/folders/ns/4vw4qg350f76xc84clgnpqhh0000gn/T//Rtmpnnxcug/downloaded_packages
> library(rio)
The following rio suggested packages are not installed: ‘arrow’, ‘feather’, ‘fst’, ‘hexView’, ‘jsonlite’, ‘pzfx’, ‘readODS’, ‘rmarkdown’, ‘rmatio’, ‘xml2’, ‘yaml’
Use 'install_formats()' to install them
> data_name<-import(file="Hookup Culture Final Data 2.9.21.sav")
> hookup<-import(file="Hookup Culture Final Data 2.9.21.sav")
> install.packages("dplyr")
trying URL 'https://mirror.las.iastate.edu/CRAN/bin/macosx/contrib/4.1/dplyr_1.0.7.tgz'
Content type 'application/x-gzip' length 1263555 bytes (1.2 MB)
==================================================
downloaded 1.2 MB


The downloaded binary packages are in
	/var/folders/ns/4vw4qg350f76xc84clgnpqhh0000gn/T//Rtmpnnxcug/downloaded_packages
> library("dplyr")

Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:

    filter, lag

The following objects are masked from ‘package:base’:

    intersect, setdiff, setequal, union

> hookup<-subset(hookup, select=-AttendService)
> ##code above removed people who attend services
> table(hookup$Year)

 1  2  3  4 
37 27 21 34 
> ##code above shows frequencies for "year"
> hist(hookup$HCTotal)
> ##code above creates a histogram of hctotal
> hctotal.test<-t.test(x=hookup$hctotal,mu=0)
> hctotal.test

	One Sample t-test

data:  hookup$hctotal
t = 34.511, df = 114, p-value < 2.2e-16
alternative hypothesis: true mean is not equal to 0
95 percent confidence interval:
 48.63809 54.56191
sample estimates:
mean of x 
     51.6 

> ##level 4