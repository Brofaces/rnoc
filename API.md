# API Documentation

## Pages

### create

POST /pages

     title string
     enabled boolean (true|false) (optional: defaults to true)
     order integer (optional: defaults to next integer value)

     { "title": "My Swet Page",
       "enabled": "true",
       "order": "5",
     }

### delete

DELETE /pages/page-id

## PageBoxes

## create

POST /pages/page-id/pageboxes

     title string
     content string
     
     { "title": "My killer pagebox",
       "content": "http://killer-charts.bz/requests-per-hour.png",
     }

## delete

DELETE /pages/page-id/pageboxes/pagebox-id
