imports <- c('rio','rvest')
invisible(lapply(imports, require, character.only = T))

url = 'craigslist _ sites.html'

search_querystring <- 'search/mar?format=rss&query=-canvas%2A%20-coordinator%2A%20-appointment%2A%20-sales%2A%20-intern%2A%20-telemarketing%2A%20-agency%2A%20-outdoor%2A%20-%22phone%20pros%22%2A%20-%22talk%2C%20talk%2C%20talk%22%2A%20-talkers%2A%20-representative%2A%20-ambassador%2A%20-mentor%2A'

search_querystring2 <- 'search/mar?query=-canvas%2A%20-coordinator%2A%20-appointment%2A%20-sales%2A%20-intern%2A%20-telemarketing%2A%20-agency%2A%20-outdoor%2A%20-%22phone%20pros%22%2A%20-%22talk%2C%20talk%2C%20talk%22%2A%20-talkers%2A%20-representative%2A%20-ambassador%2A%20-mentor%2A'


webpage = read_html(url)
webpage

box1 <- html_nodes(webpage, 'body > article > section > div:nth-child(4) > div.box.box_1 a') %>% html_attr('href')
box1_names <- html_nodes(webpage, 'body > article > section > div:nth-child(4) > div.box.box_1 a') %>% html_text()


box2 <- html_nodes(webpage, 'body > article > section > div:nth-child(4) > div.box.box_2 a') %>% html_attr('href')
box2_names <- html_nodes(webpage, 'body > article > section > div:nth-child(4) > div.box.box_2 a') %>% html_text()

box3 <- html_nodes(webpage, 'body > article > section > div:nth-child(4) > div.box.box_3 a') %>% html_attr('href')
box3_names <- html_nodes(webpage, 'body > article > section > div:nth-child(4) > div.box.box_3 a') %>% html_text()


box4 <- html_nodes(webpage, 'body > article > section > div:nth-child(4) > div.box.box_4 a') %>% html_attr('href')
box4_names <- html_nodes(webpage, 'body > article > section > div:nth-child(4) > div.box.box_4 a') %>% html_text()

urls <- c(box1, box2, box3, box4)
names <- c(box1_names, box2_names, box3_names, box4_names)
rss <- paste0(urls,search_querystring)
webpages <- paste0(urls,search_querystring2)


craigslist_boards <- data.frame(names, urls, webpages, rss)

export(craigslist_boards, "craigslist_us_boards_rss.csv")
