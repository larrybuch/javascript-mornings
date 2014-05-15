# Be the change you want to see in the world

[Tabletop.js](https://github.com/jsoma/tabletop) (by [jsoma of Brooklyn Brainery](https://github.com/jsoma)) converts any Google Spreadsheet to JSON. Super easy. Sick.

OK Ritchie's going through this example:
http://bl.ocks.org/ritchieking/8599125

Two key realizations leading to small multiples chart:

1. When you join data to an element, all the children also inherit that data.

2. Use nesting.

Shan Carter's Mr. Nester: http://bl.ocks.org/shancarter/raw/4748131/ (via [Kevin Quealy's SEO-friendly tweet lolol](https://twitter.com/KevinQ/status/300456477590712320))

Start off with, like,
```csv
Country,year,value,group
Benin,1962,90,low-income
Burkina Faso,1962,80,low-income
Burundi,1962,70,low-income
Cen. African Rep.,1962,80,low-income
Chad,1962,110,low-income
"Congo, Dem. Rep.",1962,230,low-income
Kenya,1962,100,low-income
```

End up with, like,
```json
{
  "Benin": [
    {
      "Country": "Benin",
      "year": "1962",
      "value": "90",
      "group": "low-income"
    },
    {
      "Country": "Benin",
      "year": "1963",
      "value": "100",
      "group": "low-income"
    },
    {
      "Country": "Benin",
      "year": "1964",
      "value": "110",
      "group": "low-income"
    },
```

`datum` just binds the data to whatever element without doing the whole enter-exit-data-join-selection thingy. most often used for making paths for line charts,cuz you want to bind a bunch of data to a single element

Then looking at this sweet sync'ed-hover sparkline thing: http://bl.ocks.org/ritchieking/8628654

`bisector` does, um, whatever. Cmd-F https://github.com/mbostock/d3/wiki/Arrays

Blocks search engine by API call: http://bl.ocksplorer.org/

Stalking Larry:
- https://openpaths.cc/data/larrybuch/map
- http://bl.ocks.org/larrybuch/7e23afbae007e0a87732

Now talking about abstraction layers atop D3.

ggplot2 has "faceting"......

Gistup creates gists from the command line. https://github.com/mbostock/gistup

RAW: mapping dimensions of the data to dimensions of the visualization
http://app.raw.densitydesign.org/

Bostock's "Towards Reusable Charts" offers a nice pattern. http://bost.ocks.org/mike/chart/
