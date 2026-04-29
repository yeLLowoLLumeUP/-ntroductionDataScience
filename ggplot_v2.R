dataset <- read.csv("insurance.csv")

df <- read.csv ("insurance.csv")

library(tidyverse)

head(df)

glimpse(df)

summary(df)

df$sex[df$sex == "male"]
df[df$sex == "male"]

table(df$sex)

df[df$sex == "female",]
   
erkek <- df[df$sex == "male",]
kadin <- df[df$sex == "female",]

view(erkek)

wiew(kadin)

table(df$sex)

colSums(is.na(df))

install.packages("ggplot2")
library(ggplot2)

plot_age_hist <- ggplot(df, aes(x = age)) +
  geom_histogram(binwidth = 5,
                 fill = "#1f77b4",
                 color = "white",
                 alpha = 0.8) +
  labs(title = "Yaş Dağılımı",
       x = "Yaş",
       y = "Kişi Sayısı") +
  theme_light()

plot_yas_dagilim <- ggplot(df, aes(x = age)) +
  geom_histogram(binwidth = 5,
                 fill = "pink",
                 color = "white",
                 alpha = 0.8) +
  labs(title = "Yaş Dağılımı",
       x = "Yaş",
       y = "Kişi Sayısı") +
  theme_light()

plot_bmi_hist <- ggplot(df, aes(x = bmi)) +
  geom_histogram(binwidth = 5,
                 fill = "green",
                 color = "white",
                 alpha = 0.8) +
  labs(title = "Vücut Kitle İndex (VKİ) Dağılımı",
       x = "VKİ",
       y = "Kişi Sayısı") +
  theme_light()

plot_children_hist <- ggplot(df, aes(x = children)) +
  geom_bar(binwidth = 5,
                 fill = "red",
                 color = "white",
                 alpha = 0.8) +
  labs(title = "Number of Children Distrubution",
       x = "Number Of Children",
       y = "Kişi") +
  theme_dark()

plot_expenses_hist <- ggplot(df, aes(x = expenses)) +
  geom_histogram(binwidth = 5000,
           fill = "brown",
           color = "white",
           alpha = 0.8) +
  labs(title = "Maliyet Dağılımı",
       x = "Maliyetler($)", y = "Kişi Sayısı") +
  theme_dark()

install.packages("patchwork")
library(patchwork)

(plot_yas_dagilim + plot_bmi_hist) /
  (plot_children_hist + plot_expenses_hist)



plot_sex_bar <- ggplot(df, aes (x = sex, fill = sex)) +
  geom_bar() + 
  labs(title = "Cinsiyet Dağılımı", x = "Cinsiyet", y = "Kişi Sayısı") +
  theme_light() +
  theme(legend.position = "none")



plot_smoker_bar <- ggplot(df, aes(x = smoker, fill = smoker)) +
  geom_bar() +
  scale_fill_manual(values = c(
    "no" = "green",
    "yes" = "red")) +
  labs(title = "Sigara içme Durumu",
       x = "Sigara içiyor mu?", y = "Kişi Sayısı") +
       theme_light() +
         theme(legend.position = "none")

  Sys.setlocale("LC_ALL", "tr_TR.UTF-8")
  
  plot_region_bar <- ggplot(df, aes (x = region, fill = region )) +
  geom_bar() +
  scale_fill_manual(values = c(
    "southwest" = "red",
    "southeast" = "purple",
    "northwest" = "green",
    "northeast" = "yellow"
  )) +
  labs(title = "Bölgelere Göre Dağılım", x = "Bölge", y = "Kişi Sayısı") +
  theme_sub_strip() +
  theme(legend.position = "none")
  
plot_box_view <- ggplot(df, aes(x = smoker, y = expenses, fill = smoker)) +
    geom_boxplot(alpha = 0.8) +
  scale_fill_manual(values = c("red","green")) +
    labs(
      title = "Insurance Costs Based on Smoking Status",
      x = "Does he/she smoke?",
      y = "Costs($)"
    ) +
    theme_light() + 
    theme(legend.position = "none") +
    stat_summary(fun = mean,geom = "point", shape = 23,size = 4, fill = "white", color = "black")
  

  (plot_yas_dagilim + plot_bmi_hist) /
    (plot_children_hist + plot_expenses_hist) /
    (plot_sex_bar + plot_smoker_bar)  /
    (plot_region_bar + plot_box_view)