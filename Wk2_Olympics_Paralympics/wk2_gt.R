library(gt)
library(tidyverse)
library(gtExtras)
library(emo)

df <- read_csv('golds.csv')

df <- df %>% 
  select(Games:Gold_Share) %>% 
  mutate(Flag = c("https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/440px-Flag_of_the_United_States.svg.png",
                  "https://upload.wikimedia.org/wikipedia/en/thumb/a/ae/Flag_of_the_United_Kingdom.svg/440px-Flag_of_the_United_Kingdom.svg.png",
                  "https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/440px-Flag_of_the_United_States.svg.png",
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Norway.svg/440px-Flag_of_Norway.svg.png",
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Norway.svg/440px-Flag_of_Norway.svg.png",
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Flag_of_the_Soviet_Union.svg/440px-Flag_of_the_Soviet_Union.svg.png",
                  "https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/440px-Flag_of_the_United_States.svg.png",
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Flag_of_the_Soviet_Union.svg/440px-Flag_of_the_Soviet_Union.svg.png",
                  "https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/440px-Flag_of_the_United_States.svg.png",
                  "https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/440px-Flag_of_the_United_States.svg.png"),
         Logo = c("https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/1904summerolympicsposter.jpg/360px-1904summerolympicsposter.jpg",
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Olympic_games_1908_London.jpg/360px-Olympic_games_1908_London.jpg",
                  "https://upload.wikimedia.org/wikipedia/en/thumb/a/a5/1932_Winter_Olympics.svg/400px-1932_Winter_Olympics.svg.png",
                  "https://upload.wikimedia.org/wikipedia/en/c/c5/1928_Winter_Olympics_poster.jpg",
                  "https://upload.wikimedia.org/wikipedia/en/thumb/b/bf/1936_Winter_Olympics.svg/400px-1936_Winter_Olympics.svg.png",
                  "https://upload.wikimedia.org/wikipedia/en/thumb/c/c1/Emblem_of_the_1980_Summer_Olympics.svg/260px-Emblem_of_the_1980_Summer_Olympics.svg.png",
                  "https://upload.wikimedia.org/wikipedia/en/thumb/0/0c/1984_Summer_Olympics_logo.svg/500px-1984_Summer_Olympics_logo.svg.png",
                  "https://upload.wikimedia.org/wikipedia/en/thumb/4/44/1976_Winter_Olympics_logo.svg/400px-1976_Winter_Olympics_logo.svg.png",
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/1924_Summer_Olympics_logo.svg/500px-1924_Summer_Olympics_logo.svg.png",
                  "https://upload.wikimedia.org/wikipedia/en/thumb/0/0f/1932_Summer_Olympics_logo.svg/480px-1932_Summer_Olympics_logo.svg.png"),
         Icons = c(emo::ji('1st place medal'),
                  emo::ji('2nd place medal'),
                  emo::ji('3rd place medal'),
                  emo::ji('3rd place medal'),
                  '',
                  '',
                  '',
                  '',
                  '',
                  '')
         ) %>%
  mutate(Gold_Share2 = Gold_Share) %>% 
  select(Icons, Games, Logo, NOC, Flag, Medal_Gold, Event_Num, Gold_Share, Gold_Share2)

df %>% 
  gt() %>%
  opt_table_font(
    font = google_font("Chivo")
    ) %>%
  tab_style(
    style = cell_text(font = google_font("Fira Mono")),
    locations = cells_body(c(Gold_Share2))
  ) %>% 
  tab_style(
    style = cell_borders(sides = "left", color = "black", style = "dashed"),
    locations = cells_body(columns = c(Gold_Share))
  ) %>%
  cols_width(
    c(Gold_Share2) ~ px(50)
  ) %>% 
  tab_footnote(
    footnote = "Not counting mixed teams that won medals",
    locations = cells_column_labels(columns = c(Medal_Gold))
    ) %>% 
  tab_footnote(
    footnote = "Art events are included",
    locations = cells_column_labels(columns = c(Event_Num))
    ) %>% 
  tab_header(title = html(
    '<span style="font-size:28px; font-weight:bold;">
    Going for
    <span style="color: #f1c232; font-style:italic";>Gold</span>',
    web_image("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.pinclipart.com%2Fpicdir%2Fbig%2F565-5652007_olympic-lessons-for-better-health-transparent-background-olympic.png&f=1&nofb=1",height=24),
    '</span>'),
    subtitle = md('**Most Dominant Olympic Performances in Terms of Gold Medal Share**')
    ) %>%
  data_color(
    autocolor_text = FALSE,
    columns = c(Gold_Share2),
    colors = scales::col_numeric(palette = c("#fff7e2","#f1c232"), domain = c(20, 90))
  ) %>% 
  gt_plt_bar_pct(
    column = Gold_Share, scaled = TRUE,fill = "#f1c232", background = "#fff7e2"
    ) %>% 
  gt_img_rows(
    columns = Flag, height = 25
    ) %>% 
  gt_img_rows(
    columns = Logo, height = 40
    ) %>% 
  cols_align(
    "center", contains(c("Flag","Logo"))
    ) %>% 
  cols_label(
    NOC = "Country",
    Medal_Gold = "Golds",
    Event_Num = "Events",
    Gold_Share = 'Gold Share (%)',
    Icons = '',
    Flag = '',
    Logo = '',
    Gold_Share2 = ''
  ) %>% 
  cols_align(
    align = "center"
  ) %>% 
  tab_source_note(
    source_note = "Data: Kaggle | Figure: Max Bolger"
  ) %>% 
  tab_options(
    heading.align = "center",
    heading.border.bottom.color = 'black',
    table_body.border.bottom.color = 'black',
    table.border.bottom.color = 'black',
    table.border.top.width = 0,
    table.border.bottom.width = px(2),
    column_labels.border.top.width = px(2),
    column_labels.border.bottom.width = px(2),
    column_labels.border.bottom.color = "black",
    table_body.hlines.color = "black",
    table_body.hlines.style = "dashed",
    data_row.padding = px(2),
    footnotes.font.size = 10,
  ) %>% 
  gtsave('wk2_gt.png')
