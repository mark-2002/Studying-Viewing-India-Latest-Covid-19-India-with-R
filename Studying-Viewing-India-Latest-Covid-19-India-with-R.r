df_india <- read.csv('Latest Covid-19 India Status.csv')
print(head(df_india))
rows <- nrow(df_india)#get number of rows in dataframe
columns <- ncol(df_india)#get number of columns in data fram
print(rows)
print(columns)

print(df_india[1])# list of states in india

#statistics for covid_19 in india
mean_india <- mean(df_india$Total.Cases)
lowest_state_india <- min(df_india$Total.Cases)
lowest <- df_india$State.UTs [1]
highest_state_india <- max(df_india$Total.Cases)
highest <- df_india$State.UTs[21]
average_discharged  <- mean(df_india$Discharged,trim=0.1)
average_death <- mean(df_india$Deaths,trim=0.1)
print(paste0("India has an average total covid-19 case of  ",mean_india))#use paste0 to print from variable on c
print(paste0("The state with the lowest case is  ", lowest))
print(paste0("The state with the highest case is  ", highest))
print(paste0("The average number of people who survive and recover from covid-19 is: ", average_discharged))
print(paste0("The average number of people who don't survive and die in india is: ", average_death))
#India"s maximum cases states
States <- df_india[df_india['Total.Cases'] >= mean_india ]
Total_Cases <- df_india$Total.Cases[df_india['Total.Cases'] >= mean_india]

#visualisation
#getting india's states as vectors
State <- df_india$State.UTs
#Getting active cases and vectors and putting them in tens of thousand
Active <- df_india$Active
Active <- Active/100
print(Active)
#Getting Total cases and vectors and putting them in tens of thousand
Total <- df_india$Total.Cases
Total <- Total/10000
#Getting discharged cases and vectors and putting them in tens of thousand
Discharge <- df_india$Discharged
Discharge <- Discharge/10000
#Getting discharged cases and vectors and putting them in tens of thousand
Death <- df_india$Deaths
Death <- Death/10000

library(ggplot2)
ggplot() + geom_bar(aes(x = reorder(State,Total),y = Total),stat = "identity",fill = Total) + theme(axis.text.x = element_text(angle=90,hjust=1)) + ggtitle("India's states with number of cases from highest to lowest") + ylab("Number of cases in ten thousands") + xlab("States") +coord_flip()+scale_fill_gradient(high="blue",low="red")
ggplot() + geom_bar(aes(x=reorder(State,Active),y=Active),stat="identity",fill = "red") + theme(axis.text.x = element_text(angle=90,hjust=1)) + xlab("States") + ylab("Number of active cases in hundreds")+coord_flip() + ggtitle("India's states with active cases")
ggplot() + geom_bar(aes(x=reorder(State,Discharge),y=Discharge),stat="identity",fill = "blue") + theme(axis.text.x = element_text(angle=90,hjust=1)) + xlab("States") + ylab("Number of discharged cases in hundreds")+coord_flip() + ggtitle("India's states with discharged cases")
ggplot() + geom_bar(aes(x=reorder(State,Death),y=Death),stat="identity",fill = "yellow") + theme(axis.text.x = element_text(angle=90,hjust=1)) + xlab("States") + ylab("Number of deaths cases in hundreds")+coord_flip() + ggtitle("India's states with death cases")

#Studying India"s capital New Delhi
print(df_india[9,])
delhi <- list(df_india[9,])
print(delhi)