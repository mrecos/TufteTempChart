# TufteTempChart
A ggplot2 implementation of Tufte and Olson's city temperature charts

![alt tag](https://github.com/mrecos/TufteTempChart/blob/master/PHL_JPG.jpeg)


##### Added: code example to do the same with geom_linerange instead of geom_rect, but I perfer the control of fill and outline color of using geom_rect

Here is my attempt to use ggplot2 to recreate Randy Olson's (@randal_olson), recreation of the famous Tufte New York City Weather chart.

The original Tufte chart is here:
http://www.edwardtufte.com/bboard/q-and-a-fetch-msg?msg_id=00014g

Randy Olson recreated this chart for a post on 538 (http://fivethirtyeight.com/) linked here:
http://fivethirtyeight.com/features/what-12-months-of-record-setting-temperatures-looks-like-across-the-u-s/?ex_cid=538twitter

and Randy posted his data and Python code here:
https://github.com/mrecos/data/tree/master/us-weather-history

This is a ggplot implementation of Randy's basic design, but without the top and right side axis and legend.  I think the legend in Randy's plot may be added in Illustrator or the like.

The only real hard-coding (aside from .csv location) here is the y-axis labels that show the data is from July '14 to June '15, this will still work for any of the data files from the 538 github repo, but if you have new data with a different date range, you will need to adjust this.

this was done as a quick learning example so sloppy coding and other errors may be expected.
If you find it enjoyable, please let me know! @md_harris


