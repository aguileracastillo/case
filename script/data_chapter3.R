#### Data for Chapter 3 Digitalization and the public sector workforce
## Secondary data

#### Install packages
library(Rilostat)
library(shiny)
library(OECD)
library(WDI)



#### ILOSTAT
runExplorer()
get_ilostat_toc()


#### OECDstat - Government at a Glance (error)
oecd_datasets <- get_datasets()
search_dataset("glance", data = oecd_datasets)
browse_metadata("GOV_2021")
get_data_structure("GOV_2021")
gov_at_glance2021_structure <- get_data_structure(gov_at_glance)
gov_at_glance2021 <- get_dataset("GOV_2021")

#### WDI World Development Indicators - World Bank
WDI <- WDIsearch(string = "government", field = "name", short = TRUE, cache = NULL)
WDI(country = "EE", indicator )