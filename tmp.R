############################
## Rejected Code Snippets ##
############################

# ```{r visualize the data, include=TRUE, fig.width=11, fig.height=8}
#  # m1.qtr %>%
#  #  ggplot(data=data.frame(date=index(m1.qtr)), value = coredata(m1.qtr$value)+
#  #  aes(x = date, y = value)) +
#  #  ggtitle("M1 Money Supply")+
#  #  geom_line() +
#  #  theme_minimal() +
#  #  labs(x = "Year", y = "AU$, billions")+
#  #  theme_bw()
# 
# par(mfrow = c(3,3))
# plot(m1.qtr, main = "M1 Money Supply (logs)", xlab = "Date", ylab = "AU$, log billions", main.timespan = F)
# plot(cashrate.qtr, main = "RBA Target Cash Rate", xlab = "Date", ylab = "%", main.timespan = F)
# plot(usffr.qtr, main = "US FFR Max Target Rate", xlab = "Date", ylab = "%", main.timespan = F)
# plot(cpi.qtr, main = "% Change in CPI, yoy", xlab = "Date", ylab = "%", main.timespan = F)
# plot(consumption.qtr, main = "Aggregate Consumption (log)", xlab = "Date", ylab = "AU$, billions", main.timespan = F)
# plot(gdp.qtr, main = "Nominal GDP (log)", xlab = "Date", ylab = "AU$, billions", main.timespan = F)
# plot(homeloan.qtr, main = "Owner-occupied home loan rates", xlab = "Date", ylab = "%", main.timespan = F)
# plot(nhomes.qtr, main = "Quantity of homes", xlab = "Date", main.timespan = F)
# plot(homeprice.qtr, main = "House Price Index", xlab = "Date", main.timespan = F)
# ```



# Alternative code for the ADF tests
# <!-- ```{r integration order} -->
#   
#   <!-- adf = tseries::adf.test(m1.qtr, k = 4) -->
#     <!-- diff_adf = tseries::adf.test(na.omit(diff(m1.qtr)), k = 3) -->
#       <!-- FinTS::Acf(m1.qtr) -->
#       <!-- # please use the outputs to create a table reporting test statistic, p-value, the variable (and transformation), lag order. Write a conclusion regarding the integration order. -->
#       
#       <!-- ``` -->



## Plotly to make interactive graphs
```{r}
library(plotly)
var_names <- colnames(df)
date_range <- as.yearqtr(rownames(df), format = "%Y Q%q")

# Create an empty list to store plotly plots
plots <- list()

# Loop through each variable and create plotly plots
for (j in 1:ncol(df)) {
  p <- plot_ly() %>%
    add_lines(x = date_range, y = df[, j], name = var_names[j], line = list(color = "black")) %>%
    layout(title = var_names[j], showlegend = FALSE, xaxis = list(tickformat = "%Y Q%q"), margin = list(l = 2, r = 2, t = 2, b = 2))
  plots[[j]] <- p
}

# Combine the plots into a single subplot
subplot <- subplot(plotlist = plots, nrows = 3, shareX = TRUE, shareY = FALSE)

# Display the interactive subplot
subplot


```
