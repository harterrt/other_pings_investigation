require(ggplot2)

getData <- function() {
  out <- read.csv("Other_Ping_2016_10_28.csv")
  out$date <- as.Date(substr(out$submission, 1, 10))
  out$is_esr_ping <- out$channel == "esr"

  out
}

plotInc <- function(dd = getData()) {
  ggplot(data=dd, aes(x=date, weight=count, fill=is_esr_ping)) +
    geom_bar() +
    theme(axis.text.x = element_text(angle = 270, hjust = 1)) +
    ylab("Count of 'Other' Pings in 1% Sample") +
    xlab("Submission Date")
}

pp <- plotInc(getData())
ggsave("other_pings_investigation.png", pp)
