## GRINFISH project

# ts

### Preparing metadata.

## Loading

source("boot.R")
commerSamps <- c("Kuummiut", "Nuuk", "Qaanaaq", "Narsaq")
survSamps <-
  c(
    "Davis Strait",
    "Greenland Southeast",
    "Baffin Bay",
    "Disko Bay",
    "Uummannaq",
    "Upernavik"
  )
variables <-
  c(
    "Year",
    "Month",
    "ID_sampling",
    "ID_lab",
    "Length",
    "Sex",
    "Depth",
    "Temperature",
    "Longitude",
    "Latitude",
    "Location",
    "LocAcronym"
  )

### NON RE-RUN CODE. DO NOT RE-RUN THE CODE ON THIS SECTION ###

## Loading location dataframes

#Qaanaaq 2020
# qaq2020 <- read_csv("10-19 Data/10 Raw-data/10.01 Ind-metadata/20220315-GINR-QAQ-FebMarch-2020.csv", col_names = T) %>% 
#   mutate(GRI_ID = paste("Gri-Qaq2020", IdNr, sep = "-"), .before = 2)
# 
# group_by(qaq2020, Sex) %>% 
#   summarise(count = n())
# 
# qtm_sel <- filter(qaq2020, Sex == "M", !IdNr %in% c(92,94))
# qtf_sel <- filter(qaq2020, Sex == "F", IdNr %in% c(1:29))
# qaq2020 <- rbind(qtm_sel, qtf_sel)
# 
# #Upernavik 2020
# upk2020 <- read_csv("10-19 Data/10 Raw-data/10.01 Ind-metadata/20220315-GINR-UPK-Aug-2020.csv", col_names = T) %>% 
#   mutate(GIR_ID = paste("Gri-Upk2020", id, sep = "-"), .before = 2) %>% 
#   dplyr::select(-unq_id)
# 
# group_by(upk2020, sex) %>% 
#   summarise(count = n())
# 
# uptm_sel <- filter(upk2020, sex == "M", id %in% c(729, 730, 763, 679, 703, 715, 623, 373, 469,
#                                                   336, 276, 317, 226, 245, 197, 209, 180, 184,
#                                                   185, 191, 193, 169, 172, 173, 175))
# uptf_sel <- filter(upk2020, sex == "F", id %in% c(717, 720, 682, 700, 622, 649, 661, 673, 406,
#                                                   470, 528, 318, 320, 322, 327, 246, 311, 314, 
#                                                   218, 225, 244, 194, 213, 214, 171))
# 
# upk2020 <- rbind(uptm_sel, uptf_sel)
# 
# ## File. GRINFISH-Qaq20Upk20-metadata.csv
# 
# file <- rbind(qaq2020)
# write_csv()
# 
# # -------------------------------------------------------------------------
# 
# # Uummannaq 2022
# load("10-19 Data/10 Raw-data/10.01 Ind-metadata/20220901_GINR-UMQ-Sep-2020.Rda")
# 
# umq2022 <- merge(umq2022, umqStation[c("Station", "PosN1", "PosN1Decimal", "PosW1", "PosW1Decimal", "PosN2", "PosN2Decimal", "PosW2", "PosW2Decimal", "Depth1", "Depth2")], by = "Station") %>% 
#   distinct(IndividualNumber, .keep_all = TRUE)
# # The 6 individuals that are not shared were cod samples
# 
# m_sel <- filter(umq2022, Sex == "M", IndividualNumber %in% c(30806, 30775, 30811, 31338, 30579, 30546, 32239, 30553, 30562, 30567,
#                                                32007, 30572, 30957, 31146, 31970, 30582, 31104, 31174, 31390, 31157,
#                                                30776, 30952, 30558, 32222, 30573))
# f_sel <- filter(umq2022, Sex == "F", IndividualNumber %in% c(31353, 30557, 31396, 31158, 30629, 30965, 31264, 31283, 31116, 31265,
#                                                32243, 30765, 32250, 30800, 30954, 30809, 30964, 30556, 31403, 31280,
#                                                30550, 30646, 32203, 31208, 30942))
# umq2022 <- rbind(m_sel, f_sel)
# 
# # Disko Bay 2022
# 
# # The following indicate which stations from survey no 2, 2022, are in Disko Bay
# # library(RODBC)
# # dta <- odbcConnectAccess2007("DW-5.02.accdb")
# # bridge <- RODBC::sqlFetch(dta, "DwStationList")
# # close(dta)
# # tmp <- bridge %>% 
# #   filter(Year == 2022, Ship = "TA", Trip %in% c(1,2)) %>% 
# #   select(Trip, Station, PosN1Decimal, PosW1Decimal) %>% 
# #   rename(lat = PosN1Decimal, lon = PosW1Decimal) %>% 
# #   filter(lat < 70 & lat > 68.5, lon < -50 & lon > -55)
# 
# load("1_data/raw/metadata/disko2022_tarajoq1-2.Rda")
# 
# dkb2022 <- merge(t1_2_2022, diskobridge_2022[c("Station", "PosN1", "PosN1Decimal", "PosW1", "PosW1Decimal", "PosN2", "PosN2Decimal", "PosW2", "PosW2Decimal", "Depth1", "Depth2")], by = "Station") %>% 
#   distinct(IndividualNumber, .keep_all = TRUE)
# 
# m_sel <- filter(dkb2022, Sex == "M", IndividualNumber %in% c(27097, 28754, 33408, 33409, 27081, 33414, 33468, 27241, 28905, 27239,
#                                                28696, 33449, 31272, 33413, 33403, 33422, 33412, 33947, 28862, 27243,
#                                                33425, 27258, 33457, 33402, 28921))
# f_sel <- filter(dkb2022, Sex == "F", IndividualNumber %in% c(28841, 27246, 27114, 27110, 27100, 33946, 33445, 27259, 33454, 33407,
#                                                33421, 33470, 27252, 27096, 33404, 33401, 28234, 28784, 33417, 27242,
#                                                27245, 27240, 33462, 29084, 27098))
# dkb2022 <- rbind(m_sel, f_sel)
# 
# ### Random sampling for sequencing
# 
# ID_map <- read_excel("10-19_Data/10_Raw-data/10.01_Ind-metadata/ID_map.xlsx", col_names = T)
# 
# offshore_50 <- filter(ID_map, Sample == "dvs-2022" | Sample == "gse-2022")
# offshore_50 <- group_by(offshore_50, Sex, Sample) %>% 
#   sample_n(size = 25, replace = F) %>% 
#   arrange(Sample)
# 
# inshore_30 <- filter(ID_map, Sample != "dvs-2022" & Sample != "gse-2022" & Sample != "nrq-2020")
# inshore_30 <- group_by(inshore_30, Sex, Sample) %>% 
#   sample_n(size = 15, replace = F) %>% 
#   arrange(Sample)
# 
# selected_samples <- list(Dvs_Gse = offshore_50s, Inshore = inshore_30)
# 
# save(selected_samples, file = "10-19_Data/10_Raw-data/10.01_Ind-metadata/selected_samples.rda")
# load("10-19_Data/10_Raw-data/10.01_Ind-metadata/selected_samples.rda")
# 
# nrq_selected <- data.frame(
#   ID = c(5,9,17,18,27,29,36,38,46,3,32,19,44,37,23,48,7,40,49,4,30,14,34,8,26,21,25,12,45,16),
#   Sex = c(rep("M", 9), rep("F", 21)),
#   Sample = "nrq-2020"
# )
# 
# selected_samples[["nrq_selected"]] <- nrq_selected
# selected_samples <- lapply(selected_samples, function(df) { mutate(df, ID = as.character(ID))} )
# 
# selected_samples <- do.call(rbind, selected_samples)
# 
# write_csv(x = selected_samples, file = "10-19_Data/10_Raw-data/10.01_Ind-metadata/selected_samples.csv")
# 
# ## Substract available samples
# 
# selected <- read_excel("10-19_Data/10_Raw-data/10.01_Ind-metadata/ID_map.xlsx", sheet = 1)
# allSamp <- read_excel("10-19_Data/10_Raw-data/10.01_Ind-metadata/ID_map.xlsx", sheet = 2)
# 
# available <- anti_join(allSamp, selected, by = c("ID_sampling", "Location"))
# write_csv(available, file = "10-19_Data/10_Raw-data/10.01_Ind-metadata/non-processed.csv")

#### Gather metadata

# Get ID map
ID_map <-
  read_excel("10-19_Data/10_Raw-data/10.01_Ind-metadata/ID_map.xlsx",
             sheet = 1)

# Get survey data- This must be merged with bridge info to retrieve coordinates, Depth, temperature and so on
load("10-19_Data/10_Raw-data/10.01_Ind-metadata/GINRcollection.rda")

bridge <- filter(bridge, Year >= 2020) %>%
  filter(Ship != "HM")
inds <- filter(inds, Year >= 2020) %>%
  filter(Ship != "HM")

##----------------------------------------------------------------------------##
##----------------------------------------------------------------------------##
##----------------------------------------------------------------------------##

# Baffin Bay
TA1_2_2022 <-
  filter(inds, Ship == "TA", Year == "2022", Trip == 1 | Trip == 2)

tmp1 <- filter(ID_map, Location == "Baffin Bay")
tmp2 <- filter(TA1_2_2022, IndividualNumber %in% tmp1$ID_sampling)
baf <- tmp2[!duplicated(tmp2$IndividualNumber),] %>%
  rename(ID_sampling = IndividualNumber)
baf <-
  merge(x = baf, y = tmp1[, c("ID_sampling", "ID_lab", "Location")], by = "ID_sampling")

baf <- merge(baf, bridge)

baf <- baf %>%
  mutate(
    Month = month(TimeStart, abbr = T, label = T),
    Longitude = -(PosW1Decimal + PosW2Decimal) / 2,
    Latitude = (PosN1Decimal + PosN2Decimal) / 2,
    Depth = (FishingDepth1 + FishingDepth2) / 2,
    Temperature = BottomTemperature,
    LocAcronym = "BAF"
  )
baf <- select(baf, all_of(variables))

##----------------------------------------------------------------------------##
##----------------------------------------------------------------------------##
##----------------------------------------------------------------------------##

# Davis Strait
TA8_2022 <- filter(inds, Ship == "TA", Year == "2022", Trip == 8)

tmp1 <- filter(ID_map, Location == "Davis Strait")
tmp2 <- filter(TA8_2022, IndividualNumber %in% tmp1$ID_sampling)
dvs <- tmp2[!duplicated(tmp2$IndividualNumber),] %>%
  rename(ID_sampling = IndividualNumber)
dvs <-
  merge(x = dvs, y = tmp1[, c("ID_sampling", "ID_lab", "Location")], by = "ID_sampling")

dvs <- merge(dvs, bridge)

dvs <- dvs %>%
  mutate(
    Month = month(TimeStart, abbr = T, label = T),
    Longitude = -(PosW1Decimal + PosW2Decimal) / 2,
    Latitude = (PosN1Decimal + PosN2Decimal) / 2,
    Depth = (FishingDepth1 + FishingDepth2) / 2,
    Temperature = BottomTemperature,
    LocAcronym = "DVS"
  )
dvs <- select(dvs, all_of(variables))

##----------------------------------------------------------------------------##
##----------------------------------------------------------------------------##
##----------------------------------------------------------------------------##

# Greenland southeast
TA5_7_2022 <-
  filter(inds, Ship == "TA", Year == "2022", Trip == 5 | Trip == 7)

tmp1 <- filter(ID_map, Location == "Greenland Southeast")
tmp2 <- filter(TA5_7_2022, IndividualNumber %in% tmp1$ID_sampling)
gse <- tmp2[!duplicated(tmp2$IndividualNumber),] %>%
  rename(ID_sampling = IndividualNumber)
gse <-
  merge(x = gse, y = tmp1[, c("ID_sampling", "ID_lab", "Location")], by = "ID_sampling")

gse <- merge(gse, bridge)

gse <- gse %>%
  mutate(
    Month = month(TimeStart, abbr = T, label = T),
    Longitude = -(PosW1Decimal + PosW2Decimal) / 2,
    Latitude = (PosN1Decimal + PosN2Decimal) / 2,
    Depth = (FishingDepth1 + FishingDepth2) / 2,
    Temperature = BottomTemperature,
    LocAcronym = "GSE"
  )
gse <- select(gse, all_of(variables))

##----------------------------------------------------------------------------##
##----------------------------------------------------------------------------##
##----------------------------------------------------------------------------##

# Disko Bay
TA1_2_2022 <-
  filter(inds, Ship == "TA", Year == "2022", Trip == 1 | Trip == 2)

tmp1 <- filter(ID_map, Location == "Disko Bay")
tmp2 <- filter(TA1_2_2022, IndividualNumber %in% tmp1$ID_sampling)
dkb <- tmp2[!duplicated(tmp2$IndividualNumber),] %>%
  rename(ID_sampling = IndividualNumber)
dkb <-
  merge(x = dkb, y = tmp1[, c("ID_sampling", "ID_lab", "Location")], by = "ID_sampling")

dkb <- merge(dkb, bridge)

dkb <- dkb %>%
  mutate(
    Month = month(TimeStart, abbr = T, label = T),
    Longitude = -(PosW1Decimal + PosW2Decimal) / 2,
    Latitude = (PosN1Decimal + PosN2Decimal) / 2,
    Depth = (FishingDepth1 + FishingDepth2) / 2,
    Temperature = BottomTemperature,
    LocAcronym = "DKB"
  )
dkb <- select(dkb, all_of(variables))

##----------------------------------------------------------------------------##
##----------------------------------------------------------------------------##
##----------------------------------------------------------------------------##

# Uummannaq
SA_2022 <- filter(inds, Ship == "SA", Year == 2022)

tmp1 <- filter(ID_map, Location == "Uummannaq")
tmp2 <- filter(SA_2022, IndividualNumber %in% tmp1$ID_sampling)
umq <- tmp2[!duplicated(tmp2$IndividualNumber),] %>%
  rename(ID_sampling = IndividualNumber)
umq <-
  merge(x = umq, y = tmp1[, c("ID_sampling", "ID_lab", "Location")], by = "ID_sampling")

umq <- merge(umq, bridge)
umq <- umq[!duplicated(umq$ID_sampling),]

umq <- umq %>%
  mutate(
    Month = month(TimeStart, abbr = T, label = T),
    Longitude = -(PosW1Decimal + PosW2Decimal) / 2,
    Latitude = (PosN1Decimal + PosN2Decimal) / 2,
    Depth = (FishingDepth1 + FishingDepth2) / 2,
    Temperature = BottomTemperature,
    LocAcronym = "UMQ"
  )
umq <- select(umq, all_of(variables))

##----------------------------------------------------------------------------##
##----------------------------------------------------------------------------##
##----------------------------------------------------------------------------##

# Upernavik
tmp1 <- filter(ID_map, Location == "Upernavik")
tmp2 <- filter(SA_2022, IndividualNumber %in% tmp1$ID_sampling)
upk <- tmp2[!duplicated(tmp2$IndividualNumber),] %>%
  rename(ID_sampling = IndividualNumber)
upk <-
  merge(x = upk, y = tmp1[, c("ID_sampling", "ID_lab", "Location")], by = "ID_sampling")

upk <- merge(upk, bridge)
upk <- upk[!duplicated(upk$ID_sampling),]

upk <- upk %>%
  mutate(
    Month = month(TimeStart, abbr = T, label = T),
    Longitude = -(PosW1Decimal + PosW2Decimal) / 2,
    Latitude = (PosN1Decimal + PosN2Decimal) / 2,
    Depth = (FishingDepth1 + FishingDepth2) / 2,
    Temperature = BottomTemperature,
    LocAcronym = "UPK"
  )
upk <- select(upk, all_of(variables))

##----------------------------------------------------------------------------##
##----------------------------------------------------------------------------##
##----------------------------------------------------------------------------##

# Qaanaaq
qaq <-
  read_csv("10-19_Data/10_Raw-data/10.01_Ind-metadata/GINR-QAQ-FebMarch-2020.csv")

tmp1 <- filter(ID_map, Location == "Qaanaaq")
qaq <- filter(qaq, IdNr %in% tmp1$ID_sampling) %>%
  rename(ID_sampling = IdNr)
qaq <-
  merge(x = qaq, y = tmp1[, c("ID_sampling", "ID_lab", "Location")], by = "ID_sampling")

qaq <- qaq %>%
  mutate(
    Year = year(Date),
    Month = month(Date, label = T, abbr = T),
    Longitude = lon,
    Latitude = lat,
    Depth = 350,
    Temperature = temp,
    LocAcronym = "QAQ"
  ) %>%
  select(all_of(variables))

##----------------------------------------------------------------------------##
##----------------------------------------------------------------------------##
##----------------------------------------------------------------------------##

# Nuuk
nuk <-
  read_csv("10-19_Data/10_Raw-data/10.01_Ind-metadata/GINR_NUK_07_2020.csv")

tmp1 <- filter(ID_map, Location == "Nuuk")
nuk <- filter(nuk, IdNr %in% tmp1$ID_sampling) %>%
  rename(ID_sampling = IdNr)
nuk <-
  merge(x = nuk, y = tmp1[, c("ID_sampling", "ID_lab", "Location")], by = "ID_sampling")

nuk <- nuk %>%
  mutate(
    Year = year(Date),
    Month = month(Date, label = T, abbr = T),
    Longitude = lon,
    Latitude = lat,
    Depth = depth,
    Temperature = temp,
    LocAcronym = "NUK"
  ) %>%
  select(all_of(variables))

##----------------------------------------------------------------------------##
##----------------------------------------------------------------------------##
##----------------------------------------------------------------------------##

# Narsaq
nrq <-
  read_csv("10-19_Data/10_Raw-data/10.01_Ind-metadata/GINR_NAQ_01_2020.csv")

tmp1 <- filter(ID_map, Location == "Narsaq")
nrq <- filter(nrq, IdNr %in% tmp1$ID_sampling) %>%
  rename(ID_sampling = IdNr)
nrq <-
  merge(x = nrq, y = tmp1[, c("ID_sampling", "ID_lab", "Location")], by = "ID_sampling")

nrq <- nrq %>%
  mutate(
    Year = year(Date),
    Month = month(Date, label = T, abbr = T),
    Longitude = lon,
    Latitude = lat,
    Depth = depth,
    Temperature = temp,
    LocAcronym = "NRQ"
  ) %>%
  select(all_of(variables))

##----------------------------------------------------------------------------##
##----------------------------------------------------------------------------##
##----------------------------------------------------------------------------##

# Kuummiut
tmp <-
  read_csv("10-19_Data/10_Raw-data/10.01_Ind-metadata/GINR_commercialSamples2021.csv")
tmp <- filter(tmp, InnOff == "I", Species == "GHL")
tmp <-
  mutate(tmp, IdNr = ifelse(ShipPlace == "Sermiligaaq", sub("$", "s", IdNr), IdNr))

tmp1 <- filter(ID_map, Location == "Kuummiut")
kum <- filter(tmp, IdNr %in% tmp1$ID_sampling) %>%
  rename(ID_sampling = IdNr)
kum <-
  merge(x = kum, y = tmp1[, c("ID_sampling", "ID_lab", "Location")], by = "ID_sampling")

kum <- kum %>%
  mutate(
    Month = "Mar",
    Longitude = ifelse(ShipPlace == "Kuummiit", -37.0711, -36.4573),
    Latitude = ifelse(ShipPlace == "Kuummiit", 65.8587, 65.9145),
    Depth = NA,
    Temperature = NA,
    LocAcronym = "KUM"
  ) %>%
  select(all_of(variables))

##----------------------------------------------------------------------------##
##----------------------------------------------------------------------------##
##----------------------------------------------------------------------------##

metadata <- rbind(dvs, baf, gse, upk, umq, nuk, nrq, kum, dkb, qaq)
write_csv(metadata,
          "10-19_Data/10_Raw-data/10.01_Ind-metadata/GRINFISH-metadata.csv")