# API Documentation

## Pages

### create

POST /pages

     title string
     enabled boolean (true|false)
     order integer

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
