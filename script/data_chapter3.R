#### Data for Chapter 3 Digitalization and the public sector workforce
## Secondary data

#### Install packages
library(tidyverse)
library(eurostat)
library(Rilostat)
library(shiny)
library(OECD)
library(WDI)
library(countrycode)



#### ILOSTAT
runExplorer()
ilostat_toc <- get_ilostat_toc() ## table of contents --> id
ilostat_dic <- get_ilostat_dic("indicator") ## dictionary
## Employment by sex and institutional sector - Annual
employment_sex_sector <- get_ilostat("EMP_TEMP_SEX_INS_NB_A")
## Public employment by sectors and sub-sectors of national acct
pub_emp_by_sector <- get_ilostat("PSE_TPSE_GOV_NB_A")
## Trade Union Density rate (%)
union_density <- get_ilostat("ILR_TUMT_NOC_RT_A")
union_density$REGION <- NA
union_density$EU28 <- NA

## adds region column
union_density$REGION <- countrycode(union_density$ref_area, 
                                  origin = "iso3c",
                                  destination = "region",
                                  warn = TRUE,
                                  nomatch = NA,
                                  custom_dict = NULL,
                                  custom_match = NULL,
                                  origin_regex = NULL)

## adds EU membership (before 2015 // EU28)
union_density$EU28 <- countrycode(union_density$ref_area, 
                                    origin = "iso3c",
                                    destination = "eu28",
                                    warn = TRUE,
                                    nomatch = NA,
                                    custom_dict = NULL,
                                    custom_match = NULL,
                                    origin_regex = NULL)

union_density_EU28 %>% filter(ref_area == "EST")


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