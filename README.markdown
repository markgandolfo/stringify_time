StringifyTime
=============

Simply converts strings into minutes and minutes into humanized time. 
I've pulled this out of scrumandcola.com, which is an agile (scrum) project management tool
as such, a day is 6 hours. This can be changed via a class variable in the script

Or you can create an initializer (e.g. stringify_time.rb)
and in that, add `StringifyTime.hours_per_day = 5`

Accepts days months and minutes in this format
"1d 2h 30m"
"1d 30m"
"9d 12h"
"12m"

etc. 

Updated with specs

Example
=======

Basic Example, convert a string to minutes and back to a string

>> "1d 12h 30m".minutes
=> 2190

>> 2190.humanize
=> "1d 12h 30m"

It can accept any variation of the above, its not limited by the 24/60 limitations set by standard time
>> "90h".minutes
=> 5400

But will return a string in a more readable format
>> 5400.humanize
=> "3d 18h"


Copyright
=========
Copyright (c) 2009 Mark Gandolfo, released under the MIT license

Follow me on twitter
http://twitter.com/markgandolfo
