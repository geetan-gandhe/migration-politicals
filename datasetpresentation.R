fram <- read.csv("dataset.csv")

str(fram)


library(ggplot2)
library(directlabels)
library(tidyverse)
library(viridis)
library(hrbrthemes)
library(gglight)

colnames(fram)
names(fram)[names(fram) == "X1995"] <- "1995"
names(fram)[names(fram) == "X2000"] <- "2000"
names(fram)[names(fram) == "X2005"] <- "2005"
names(fram)[names(fram) == "X2010"] <- "2010"
names(fram)[names(fram) == "X2015"] <- "2015"

data <-gather(fram, '1995', '2000', '2005', '2010', '2015', key = "year", value = "percent")


# ggplot(data, aes(x = year, y=percent, group = Country.Code, color = Country.Code)) +
#   ggtitle("International Migrant Stock, Percent of Population") +
#   labs(x = "Year", y = "Percent", colour = "Country") +
#   geom_point() + geom_line() +  geom_dl(aes(label=Country.Code), method="smart.grid") + theme_minimal() 
# 
# ggplot(data, aes(x = year, y=percent, group = Country.Code, color = Country.Code)) +
#   ggtitle("Migrant Stock, % of Population w/ Gov Migration Policy Objectives, 2005") +
#   labs(x = "Year", y = "Percent", colour = "Country") +
#   geom_point() + geom_line() +  geom_dl(aes(label=Country.Code), method="smart.grid") + 
#   theme_minimal() +   scale_color_manual(values = c("green2", "grey25", "grey25", "green2",
#   "grey25", "grey25", "brown", "grey25", "grey25", "brown", "brown", "brown", "grey25", "brown", 
#   "grey25", "grey25", "grey25", "grey25"))
#                                                                                                                                          
# ggplot(data, aes(x = year, y=percent, group = Country.Code, color = Country.Code)) +
#   ggtitle("Migrant Stock, % of Population w/Citizen Acquisition Provisions") +
#   labs(x = "Year", y = "Percent", colour = "Country") +
#   geom_point() + geom_line() +  geom_dl(aes(label=Country.Code), method="smart.grid") + 
#   theme_minimal() +   scale_color_manual(name = "Blue = Jus soli only\nRed = Jus sanguinis", values = c("royalblue", "tomato", "royalblue", "royalblue",
#                                                     "tomato", "royalblue", "tomato", "royalblue", "tomato", "royalblue", "royalblue", "tomato", "tomato", "tomato", 
#                                                     "tomato", "tomato", "tomato", "royalblue")) + theme(legend.title = element_text(size=8))

ggplot(data,
       aes(
         x = year,
         y = percent,
         group = Country.Code,
         color = Country.Code
       )) +
  geom_line() + geom_point() +
  scale_fill_viridis() +
  labs(x = "Year", y = "Percent", colour = "Country") +
  theme(legend.position = "none") +
  ggtitle("International Migrant Stock, Percent of Population")  + theme_minimal() +
  theme(
    legend.position = "none",
    strip.text.x = element_text(size = 10),
    strip.text.y = element_text(size = 10),
    strip.background = element_blank(),
    plot.title = element_text(size = 14)
  ) +
  facet_wrap( ~ Country.Code, scales = "fixed", ncol = 3)  + gghighlight::gghighlight(use_direct_label = FALSE)

ggplot(data,
       aes(
         x = year,
         y = percent,
         group = Country.Code,
         color = Country.Code
       )) +
  ggtitle("Migrant Stock, % of Population w/Govt. Migration Policy Objectives, 2005") +
  labs(x = "Year", y = "Percent", colour = "Country") +
  geom_point() + geom_line() +
  theme_minimal() +   scale_color_manual(
    values = c(
      "green2",
      "grey25",
      "grey25",
      "green2",
      "grey25",
      "grey25",
      "brown",
      "grey25",
      "grey25",
      "brown",
      "brown",
      "brown",
      "grey25",
      "brown",
      "grey25",
      "grey25",
      "grey25",
      "grey25"
    )
  ) +
  theme(legend.position = "none") +  theme(
    legend.position = "none",
    strip.text.x = element_text(size = 10),
    strip.text.y = element_text(size = 10),
    strip.background = element_blank(),
    plot.title = element_text(size = 14)
  ) +
  facet_wrap( ~ Country.Code, scales = "fixed", ncol = 3) + gghighlight::gghighlight(use_direct_label = FALSE)

ggplot(data,
       aes(
         x = year,
         y = percent,
         group = Country.Code,
         color = Country.Code
       )) +
  ggtitle("Migrant Stock, % of Population w/Citizen Acquisition Provisions") +
  labs(x = "Year", y = "Percent", colour = "Country") +
  geom_point() + geom_line() +
  theme_minimal() +   scale_color_manual(
    values = c(
      "royalblue",
      "tomato",
      "royalblue",
      "royalblue",
      "tomato",
      "royalblue",
      "tomato",
      "royalblue",
      "tomato",
      "royalblue",
      "royalblue",
      "tomato",
      "tomato",
      "tomato",
      "tomato",
      "tomato",
      "tomato",
      "royalblue"
    )
  ) + theme(legend.title = element_text(size = 8)) +
  theme(
    legend.position = "none",
    strip.text.x = element_text(size = 10),
    strip.text.y = element_text(size = 10),
    strip.background = element_blank(),
    plot.title = element_text(size = 14)
  ) +
  facet_wrap( ~ Country.Code, scales = "fixed", ncol = 3) + gghighlight::gghighlight(use_direct_label = FALSE) 


