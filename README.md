# TufteTempChart
A ggplot2 implementation of Tufte and Olson's city temperature charts

![alt tag](https://github.com/mrecos/TufteTempChart/blob/master/PHL_JPG.jpeg)


##### Update 07/25/15: 
Added new versions with geom_linerange and different date handling.  The original version (TufteOlsonChart_geom_rect.R) uses the geom_rect as the main geometry for displaying the data.  I like this because it gives full control of fill and outline color as well as better width control.  There is also a version that uses geom_linerange to achieve a very similar look, but not quite right (TufteOlsonChart_geom_linerange.R).  Both of these use an approximation of days in each month to place the month labels on the x-axis.  Given that the intent of this chart is to show trends in temperature and points out the records with a year, the exact placement of month labels is not critical.  However hard-coded as such, it means that you would have to adjust this if your data was not 365 days from July to June.  As suggested by @AndriyGazin, I made another version of with geom_rect that converts the character dates into actual Dates and uses scale_x_date() to place the dates at the correct location.  The visual effect is negligable, but it is better able to handle data that is of various date ranges (TufteOlsonChart_rect_dates.R).  It would be simple to extent the geom_linerange to the same, but I had just not done it yet.  The big downside of actual dates is that I was unable to figure out how to have the year portion of the date appear only for July and January; any ideas would be appreciated. Thanks!



Here is my attempt to use ggplot2 to recreate Randy Olson's (@randal_olson), recreation of the famous Tufte New York City Weather chart.

The original Tufte chart is here:
http://www.edwardtufte.com/bboard/q-and-a-fetch-msg?msg_id=00014g

Randy Olson recreated this chart for a post on 538 (http://fivethirtyeight.com/) linked here:
http://fivethirtyeight.com/features/what-12-months-of-record-setting-temperatures-looks-like-across-the-u-s/?ex_cid=538twitter

and Randy posted his data and Python code here:
https://github.com/mrecos/data/tree/master/us-weather-history

This is a ggplot implementation of Randy's basic design, but without the top and right side axis and legend.  I think the legend in Randy's plot may be added in Illustrator or the like.

Explained in Update above. ~~The only real hard-coding (aside from .csv location) here is the y-axis labels that show the data is from July '14 to June '15, this will still work for any of the data files from the 538 github repo, but if you have new data with a different date range, you will need to adjust this.  Alternatively, you can convert the date field to actual dates and use scale_x_date instead of days numbered 1 to 365.  I was doing this quickly and dealing with date data types is a time suck for me.~~

this was done as a quick learning example so sloppy coding and other errors may be expected.
If you find it enjoyable, please let me know! @md_harris


