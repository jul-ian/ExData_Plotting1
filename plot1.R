options(scipen=999)
hpc_data = read.table(
  '~/Github/ExData_Plotting1/data/household_power_consumption.txt',
  header=TRUE, sep=';', na.strings='?'
)

hpc_data$Date = as.Date(hpc_data$Date, format='%d/%m/%Y')
hpc_data = subset(hpc_data, Date %in% as.Date(c('2007-02-01', '2007-02-02')))

png('~/Github/ExData_Plotting1/plot1.png', )
with(hpc_data, 
     hist(Global_active_power, main='Global Active Power', 
          xlab='Global Active Power (kilowatts)', col='red')
  )
dev.off()
