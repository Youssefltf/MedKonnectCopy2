-- Mise à jour n° de version
-- 1. Clone the bdpm_specialites Table Structure
use medshakeehr;

-- Clone the bdpm_specialites Table Structure and create bdpm_specialites_tn table
CREATE TABLE IF NOT EXISTS bdpm_specialites_tn LIKE bdpm_specialites;

-- Change the codeCIS column in the bdpm_specialites_tn table to VARCHAR,
-- allowing it to store alphanumeric values to avoid invalid values coming from the column AMM of the csv file
-- and add a new column DCI to store the DCI of the tn medication
ALTER TABLE bdpm_specialites_tn
    MODIFY codeCIS VARCHAR(50) NOT NULL,
    ADD COLUMN DCI VARCHAR(500) NULL;
