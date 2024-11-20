
# https://stackoverflow.com/questions/tagged/ibrokers?tab=Votes
# https://interactivebrokers.github.io/tws-api/historical_bars.html

pacman::p_load(IBrokers, dplyr)

tws <- twsConnect(port = 7496)
stopifnot(
  'IB connect failure' = isConnected(tws))
twsConnectionTime(tws)
reqCurrentTime(tws)
serverVersion(tws)

# https://rdrr.io/github/algoquant/IBrokers2/src/vignettes/IBrokers.R

twsFuture("YM","ECBOT","200809")
reqContractDetails(tws, twsEquity("QQQ"))
# internal
# IBrokers:::.reqMktData.vignette(tws, twsEquity("QQQ"))
# reqContractDetails(tws, twsEquity("VUAG", exch = "LSE"))

library(IBrokers)
contract <-
VOD_intraday = IBrokers::reqHistoricalData(tws,
  Contract = contract,
  endDateTime = "",
  barSize = "1 min",
  duration = "1 D")
glimpse(VOD_intraday)
# NB: you need realtime subscription to get SAME DAY data
VOD_intraday = IBrokers::reqHistoricalData(tws,
  Contract = twsEquity('VOD','SMART'),
  endDateTime = "", # endDateTime = "20210408 13:24:28"
  barSize = "1 min",
  duration = "1 D")
glimpse(VOD_intraday)

# https://stackoverflow.com/questions/10777885/error-getting-the-eur-usd-historical-data-using-r-on-ibrokers
# https://i.sstatic.net/jcgQj.png
# https://i.sstatic.net/w8sWq.png
(whatToShow = c('TRADES', 'HISTORICCAL_VOLATILITY', 'OPTION_IMPLIED_VOLATILITY', 'MIDPOINT', 'BID', 'ASK', 'BID_ASK',
  'ADJUSTED_ASK')[3])
 dat <- reqHistoricalData(tws, twsEquity('VOD','SMART'),
  , whatToShow=whatToShow) # getContract("EUR.USD"))
str(dat)
dat |> as.data.frame() |> as_tibble()

# market data access to index data
# https://stackoverflow.com/questions/15538921/ibrokers-historical-index-data
reqHistoricalData(tws, twsIndex(symbol = "SPX", exch = "CBOE"))
reqContractDetails(tws, twsIndex(symbol = "SPX", exch = "CBOE"))

# Delayed market data is available.QQQ NASDAQ.NMS/TOP/ALL


security = twsSTK("AAPL")
is.twsContract(security)
security = twsSTK("VUAG")
is.twsContract(security)
security_copy= twsEquity('AAPL')
reqMktData(tws,security)
reqMktDataType(tws, mktDataType = 2)



reqMktData(tws, twsEquity("SBUX"), CALLBACK=NULL, file="SBUX.dat")
twsp <- twsConnect(filename="SBUX.dat")

contract <- twsEquity("VUAG", exch = "LSE", currency = "GBP"))
# No security definition has been found for the request
reqHistory(tws, contract)

contract <- twsEquity("APPL", exch = "NYSE", currency = "INR"))
security <- twsSTK("VUAG", exch = "LSEETF")

# No security definition has been found for the request
reqHistoricalData(tws, security)

reqMktData(tws, security)


# 2 2147483647 321 Error validating request.-'bk' : cause - Invalid account code '1'.
# reqAccountUpdates(tws)

twsDisconnect(tws)
