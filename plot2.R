options(scipen=999)
hpc_data = read.table(
  '~/Github/ExData_Plotting1/data/household_power_consumption.txt',
  header=TRUE, sep=';', na.strings='?'
)

hpc_data = transform(
  hpc_data, Time=strptime(paste(Date, Time), format='%d/%m/%Y %H:%M:%S')
)
hpc_data$Date = as.Date(hpc_data$Date, format='%d/%m/%Y')
hpc_data = subset(hpc_data, Date %in% as.Date(c('2007-02-01', '2007-02-02')))

png('~/Github/ExData_Plotting1/plot2.png')
with(hpc_data, 
     plot(Time, Global_active_power, type='l', xaxt='n',
          ylab='Global Active Power (kilowatts)', xlab='')
  )
date_ticks = as.POSIXct(c("2007-02-01 00:00:00", 
                          "2007-02-02 00:00:00", 
                          "2007-02-02 23:59:59"), format='%Y-%m-%d %H:%M:%S')
axis(1, at=date_ticks, labels=c('Thu', 'Fri', 'Sat'))
dev.off()