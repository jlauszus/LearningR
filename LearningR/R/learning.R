# Loading packages ---------------------------------------------------------
library(tidyverse)
library(NHANES)

glimpse(NHANES)
str(NHANES)

# Select specific columns -------------------------------------------------
select(NHANES, Age, Weight, BMI)
select(NHANES, -HeadCirc)
select(NHANES, starts_with("BP"))
select(NHANES, ends_with("Day"))
select(NHANES, contains("Age"))

# Rename all columns ------------------------------------------------------
rename_with(NHANES, snakecase::to_snake_case)
# for at gemme ændringen i datasættet:
NHANES_small <- rename_with(NHANES, snakecase::to_snake_case)

# Renaming specific columns -----------------------------------------------

rename(NHANES_small, sex = gender)
NHANES_small <- rename(NHANES_small, sex = gender)
View(NHANES_small)
View(NHANES)

# Chaining the function with the pipe -------------------------------------

colnames(NHANES_small)
NHANES_small %>%
  colnames()

NHANES_small %>%
  select(phys_active) %>%
  rename(physically_active = phys_active)

# Exercise 7.8 ------------------------------------------------------------

NHANES_small %>%
  select(bp_sys_ave, education)

NHANES_small %>%
  rename(bp_sys = bp_sys_ave, bp_dia = bp_dia_ave)

select(NHANES_small, bmi, contains("age"))

NHANES_small %>%
  select(bmi, contains("age"))

NHANES_small %>%
  select(starts_with("bp_")) %>%
  rename(bp_systolic = bp_sys_ave)
