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

date_ticks = as.POSIXct(c("2007-02-01 00:00:00", 
                          "2007-02-02 00:00:00", 
                          "2007-02-02 23:59:59"), format='%Y-%m-%d %H:%M:%S')

png('~/Github/ExData_Plotting1/plot4.png')
par(mfrow=c(2, 2))

## Plot at 1, 1
with(hpc_data, 
     plot(Time, Global_active_power, type='l', xaxt='n',
          ylab='Global Active Power', xlab='')
)
axis(1, at=date_ticks, labels=c('Thu', 'Fri', 'Sat'))

## Plot at 1, 2
with(hpc_data, 
     plot(Time, Voltage, type='l', xaxt='n',
          ylab='Voltage', xlab='datetime')
)
axis(1, at=date_ticks, labels=c('Thu', 'Fri', 'Sat'))

## Plot at 2, 1
with(hpc_data, 
     plot(Time, Sub_metering_1, type='l', xaxt='n', xlab='', col='black',
          ylab='Energy sub metering')
)
with(hpc_data, lines(Time, Sub_metering_2, type='l', xaxt='n', xlab='', 
                     col='red'))
with(hpc_data, lines(Time, Sub_metering_3, type='l', xaxt='n', xlab='', 
                     col='blue'))


axis(1, at=date_ticks, labels=c('Thu', 'Fri', 'Sat'))

legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), lty='solid'
)

## Plot at 2, 2
with(hpc_data, 
     plot(Time, Global_reactive_power, type='l', xaxt='n',
          ylab='Global_reactive_power', xlab='datetime')
)
axis(1, at=date_ticks, labels=c('Thu', 'Fri', 'Sat'))

dev.off()