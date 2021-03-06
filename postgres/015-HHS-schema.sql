--
-- Info here:
--
-- * https://healthdata.gov/dataset/covid-19-reported-patient-impact-and-hospital-capacity-state-timeseries
-- * https://healthdata.gov/covid-19-reported-patient-impact-and-hospital-capacity-state-data-dictionary
--
CREATE TABLE hhs_state_history (
    state CHAR(2) NOT NULL,
    date DATE NOT NULL,
    critical_staffing_shortage_today_yes INTEGER,
    critical_staffing_shortage_today_no INTEGER,
    critical_staffing_shortage_today_not_reported INTEGER,
    critical_staffing_shortage_anticipated_within_week_yes INTEGER,
    critical_staffing_shortage_anticipated_within_week_no INTEGER,
    critical_staffing_shortage_anticipated_within_week_not_reported INTEGER,
    hospital_onset_covid INTEGER,
    hospital_onset_covid_coverage INTEGER,
    inpatient_beds INTEGER,
    inpatient_beds_coverage INTEGER,
    inpatient_beds_used INTEGER,
    inpatient_beds_used_coverage INTEGER,
    inpatient_beds_used_covid INTEGER,
    inpatient_beds_used_covid_coverage INTEGER,
    previous_day_admission_adult_covid_confirmed INTEGER,
    previous_day_admission_adult_covid_confirmed_coverage INTEGER,
    previous_day_admission_adult_covid_suspected INTEGER,
    previous_day_admission_adult_covid_suspected_coverage INTEGER,
    previous_day_admission_pediatric_covid_confirmed INTEGER,
    previous_day_admission_pediatric_covid_confirmed_coverage INTEGER,
    previous_day_admission_pediatric_covid_suspected INTEGER,
    previous_day_admission_pediatric_covid_suspected_coverage INTEGER,
    staffed_adult_icu_bed_occupancy INTEGER,
    staffed_adult_icu_bed_occupancy_coverage INTEGER,
    staffed_icu_adult_patients_confirmed_and_suspected_covid INTEGER,
    staffed_icu_adult_patients_confirmed_and_suspected_covid_coverage INTEGER,
    staffed_icu_adult_patients_confirmed_covid INTEGER,
    staffed_icu_adult_patients_confirmed_covid_coverage INTEGER,
    -- Original name: `total_adult_patients_hospitalized_confirmed_and_suspected_covid`
    total_adult_patients_hospitalized_covid INTEGER,
    -- Original name: `total_adult_patients_hospitalized_confirmed_and_suspected_covid_coverage`
    total_adult_patients_hospitalized_covid_coverage INTEGER,
    total_adult_patients_hospitalized_confirmed_covid INTEGER,
    total_adult_patients_hospitalized_confirmed_covid_coverage INTEGER,
    -- Original name: `total_pediatric_patients_hospitalized_confirmed_and_suspected_covid`
    total_pediatric_patients_hospitalized_covid INTEGER,
    -- Original name: `total_pediatric_patients_hospitalized_confirmed_and_suspected_covid_coverage`
    total_pediatric_patients_hospitalized_suspected_covid_coverage INTEGER,
    total_pediatric_patients_hospitalized_confirmed_covid INTEGER,
    total_pediatric_patients_hospitalized_confirmed_covid_coverage INTEGER,
    total_staffed_adult_icu_beds INTEGER,
    total_staffed_adult_icu_beds_coverage INTEGER,
    inpatient_beds_utilization DOUBLE PRECISION,
    inpatient_beds_utilization_coverage INTEGER,
    inpatient_beds_utilization_numerator INTEGER,
    inpatient_beds_utilization_denominator INTEGER,
    percent_of_inpatients_with_covid DOUBLE PRECISION,
    percent_of_inpatients_with_covid_coverage INTEGER,
    percent_of_inpatients_with_covid_numerator INTEGER,
    percent_of_inpatients_with_covid_denominator INTEGER,
    inpatient_bed_covid_utilization DOUBLE PRECISION,
    inpatient_bed_covid_utilization_coverage INTEGER,
    inpatient_bed_covid_utilization_numerator INTEGER,
    inpatient_bed_covid_utilization_denominator INTEGER,
    adult_icu_bed_covid_utilization DOUBLE PRECISION,
    adult_icu_bed_covid_utilization_coverage INTEGER,
    adult_icu_bed_covid_utilization_numerator INTEGER,
    adult_icu_bed_covid_utilization_denominator INTEGER,
    adult_icu_bed_utilization DOUBLE PRECISION,
    adult_icu_bed_utilization_coverage INTEGER,
    adult_icu_bed_utilization_numerator INTEGER,
    adult_icu_bed_utilization_denominator INTEGER,
    PRIMARY KEY (state, date)
);

--
-- Data dictionary here:
--
-- * https://healthdata.gov/covid-19-reported-patient-impact-and-hospital-capacity-facility-data-dictionary
--
CREATE TABLE hhs_hospital_history (
    -- Postgres has a maximum column name length of 63, but some of the
    -- field names in the CSV exceed that. So we've changed the names.
    "hospital_pk" TEXT NOT NULL,
    "collection_week" DATE NOT NULL,
    "state" CHAR(2) NOT NULL,
    "ccn" CHAR(6),
    "hospital_name" TEXT NOT NULL,
    "address" TEXT,
    "city" TEXT,
    "zip" CHAR(5) NOT NULL,
    "hospital_subtype" TEXT,
    "fips_code" CHAR(5),
    "is_metro_micro" BOOLEAN NOT NULL,
    "total_beds_7_day_avg" DOUBLE PRECISION NOT NULL,
    "all_adult_hospital_beds_7_day_avg" DOUBLE PRECISION NOT NULL,
    "all_adult_hospital_inpatient_beds_7_day_avg" DOUBLE PRECISION NOT NULL,
    "inpatient_beds_used_7_day_avg" DOUBLE PRECISION NOT NULL,
    "all_adult_hospital_inpatient_bed_occupied_7_day_avg" DOUBLE PRECISION NOT NULL,
    -- Original name: "total_adult_patients_hospitalized_confirmed_and_suspected_covid_7_day_avg"
    "total_adult_patients_hospitalized_covid_7_day_avg" DOUBLE PRECISION,
    "total_adult_patients_hospitalized_confirmed_covid_7_day_avg" DOUBLE PRECISION,
    -- Original name: "total_pediatric_patients_hospitalized_confirmed_and_suspected_covid_7_day_avg"
    "total_pediatric_patients_hospitalized_covid_7_day_avg" DOUBLE PRECISION,
    "total_pediatric_patients_hospitalized_confirmed_covid_7_day_avg" DOUBLE PRECISION,
    "inpatient_beds_7_day_avg" DOUBLE PRECISION,
    "total_icu_beds_7_day_avg" DOUBLE PRECISION,
    "total_staffed_adult_icu_beds_7_day_avg" DOUBLE PRECISION,
    "icu_beds_used_7_day_avg" DOUBLE PRECISION,
    "staffed_adult_icu_bed_occupancy_7_day_avg" DOUBLE PRECISION,
    -- Original name: "staffed_icu_adult_patients_confirmed_and_suspected_covid_7_day_avg"
    "staffed_icu_adult_patients_covid_7_day_avg" DOUBLE PRECISION,
    "staffed_icu_adult_patients_confirmed_covid_7_day_avg" DOUBLE PRECISION,
    "total_patients_hospitalized_confirmed_influenza_7_day_avg" DOUBLE PRECISION,
    "icu_patients_confirmed_influenza_7_day_avg" DOUBLE PRECISION,
    -- Original name: "total_patients_hospitalized_confirmed_influenza_and_covid_7_day_avg"
    "total_patients_hospitalized_confirmed_both_7_day_avg" DOUBLE PRECISION,
    "total_beds_7_day_sum" INTEGER,
    "all_adult_hospital_beds_7_day_sum" INTEGER,
    "all_adult_hospital_inpatient_beds_7_day_sum" INTEGER,
    "inpatient_beds_used_7_day_sum" INTEGER,
    "all_adult_hospital_inpatient_bed_occupied_7_day_sum" INTEGER,
    -- Original name: "total_adult_patients_hospitalized_confirmed_and_suspected_covid_7_day_sum"
    "total_adult_patients_hospitalized_covid_7_day_sum" INTEGER,
    "total_adult_patients_hospitalized_confirmed_covid_7_day_sum" INTEGER,
    -- Original name: "total_pediatric_patients_hospitalized_confirmed_and_suspected_covid_7_day_sum"
    "total_pediatric_patients_hospitalized_covid_7_day_sum" INTEGER,
    "total_pediatric_patients_hospitalized_confirmed_covid_7_day_sum" INTEGER,
    "inpatient_beds_7_day_sum" INTEGER,
    "total_icu_beds_7_day_sum" INTEGER,
    "total_staffed_adult_icu_beds_7_day_sum" INTEGER,
    "icu_beds_used_7_day_sum" INTEGER,
    "staffed_adult_icu_bed_occupancy_7_day_sum" INTEGER,
    -- Original name: "staffed_icu_adult_patients_confirmed_and_suspected_covid_7_day_sum"
    "staffed_icu_adult_patients_covid_7_day_sum" INTEGER,
    "staffed_icu_adult_patients_confirmed_covid_7_day_sum" INTEGER,
    "total_patients_hospitalized_confirmed_influenza_7_day_sum" INTEGER,
    "icu_patients_confirmed_influenza_7_day_sum" INTEGER,
    -- Original name: "total_patients_hospitalized_confirmed_influenza_and_covid_7_day_sum"
    "total_patients_hospitalized_confirmed_both_7_day_sum" INTEGER,
    "total_beds_7_day_coverage" INTEGER,
    "all_adult_hospital_beds_7_day_coverage" INTEGER,
    "all_adult_hospital_inpatient_beds_7_day_coverage" INTEGER,
    "inpatient_beds_used_7_day_coverage" INTEGER,
    "all_adult_hospital_inpatient_bed_occupied_7_day_coverage" INTEGER,
    -- Original name: "total_adult_patients_hospitalized_confirmed_and_suspected_covid_7_day_coverage"
    "total_adult_patients_hospitalized_covid_7_day_coverage" INTEGER,
    "total_adult_patients_hospitalized_confirmed_covid_7_day_coverage" INTEGER,
    -- Original name: "total_pediatric_patients_hospitalized_confirmed_and_suspected_covid_7_day_coverage"
    "total_pediatric_patients_hospitalized_covid_7_day_coverage" INTEGER,
    "total_pediatric_patients_hospitalized_confirmed_covid_7_day_coverage" INTEGER,
    "inpatient_beds_7_day_coverage" INTEGER,
    "total_icu_beds_7_day_coverage" INTEGER,
    "total_staffed_adult_icu_beds_7_day_coverage" INTEGER,
    "icu_beds_used_7_day_coverage" INTEGER,
    "staffed_adult_icu_bed_occupancy_7_day_coverage" INTEGER,
    -- Original name: staffed_icu_adult_patients_confirmed_and_suspected_covid_7_day_coverage
    "staffed_icu_adult_patients_covid_7_day_coverage" INTEGER,
    "staffed_icu_adult_patients_confirmed_covid_7_day_coverage" INTEGER,
    "total_patients_hospitalized_confirmed_influenza_7_day_coverage" INTEGER,
    "icu_patients_confirmed_influenza_7_day_coverage" INTEGER,
    -- Original name: "total_patients_hospitalized_confirmed_influenza_and_covid_7_day_coverage"
    "total_patients_hospitalized_confirmed_both_7_day_coverage" INTEGER,
    "previous_day_admission_adult_covid_confirmed_7_day_sum" INTEGER,
    "previous_day_admission_adult_covid_confirmed_18-19_7_day_sum" INTEGER,
    "previous_day_admission_adult_covid_confirmed_20-29_7_day_sum" INTEGER,
    "previous_day_admission_adult_covid_confirmed_30-39_7_day_sum" INTEGER,
    "previous_day_admission_adult_covid_confirmed_40-49_7_day_sum" INTEGER,
    "previous_day_admission_adult_covid_confirmed_50-59_7_day_sum" INTEGER,
    "previous_day_admission_adult_covid_confirmed_60-69_7_day_sum" INTEGER,
    "previous_day_admission_adult_covid_confirmed_70-79_7_day_sum" INTEGER,
    "previous_day_admission_adult_covid_confirmed_80+_7_day_sum" INTEGER,
    "previous_day_admission_adult_covid_confirmed_unknown_7_day_sum" INTEGER,
    "previous_day_admission_pediatric_covid_confirmed_7_day_sum" INTEGER,
    "previous_day_covid_ED_visits_7_day_sum" INTEGER,
    "previous_day_admission_adult_covid_suspected_7_day_sum" INTEGER,
    "previous_day_admission_adult_covid_suspected_18-19_7_day_sum" INTEGER,
    "previous_day_admission_adult_covid_suspected_20-29_7_day_sum" INTEGER,
    "previous_day_admission_adult_covid_suspected_30-39_7_day_sum" INTEGER,
    "previous_day_admission_adult_covid_suspected_40-49_7_day_sum" INTEGER,
    "previous_day_admission_adult_covid_suspected_50-59_7_day_sum" INTEGER,
    "previous_day_admission_adult_covid_suspected_60-69_7_day_sum" INTEGER,
    "previous_day_admission_adult_covid_suspected_70-79_7_day_sum" INTEGER,
    "previous_day_admission_adult_covid_suspected_80+_7_day_sum" INTEGER,
    "previous_day_admission_adult_covid_suspected_unknown_7_day_sum" INTEGER,
    "previous_day_admission_pediatric_covid_suspected_7_day_sum" INTEGER,
    "previous_day_total_ED_visits_7_day_sum" INTEGER,
    "previous_day_admission_influenza_confirmed_7_day_sum" INTEGER,
    PRIMARY KEY ("hospital_pk", "collection_week")
);


--
-- For privacy reasons, the HHS data set puts -999999 for values
-- that are less than four, but still reports zeroes as zeroes.
-- They do this superficially for the `*_7_day_avg` columns as for
-- the `*_7_day_sum`, which means that you can get more precise
-- averages by not using `*_7_day_avg` at all and instead dividing
-- the `*_7_day_sum` by the `*_7_day_coverage` (number of days the
-- facility reported in that week).
--
-- By imputing 0.0 and 4.0 respectively we can also obtain a lower
-- and upper bound for omitted sums, and we provide functions for
-- that as well.
--
CREATE FUNCTION hhs_avg(sum INTEGER, coverage INTEGER)
RETURNS DOUBLE PRECISION AS $$
    SELECT nullif(sum, -999999) :: DOUBLE PRECISION / coverage;
$$ LANGUAGE SQL;

CREATE FUNCTION hhs_lo(sum INTEGER, coverage INTEGER)
RETURNS DOUBLE PRECISION AS $$
    SELECT CASE WHEN sum = -999999
            THEN 0.0
            ELSE sum :: DOUBLE PRECISION / coverage
           END;
$$ LANGUAGE SQL;

CREATE FUNCTION hhs_hi(sum INTEGER, coverage INTEGER)
RETURNS DOUBLE PRECISION AS $$
    SELECT CASE WHEN sum = -999999
            THEN 4.0
            ELSE sum :: DOUBLE PRECISION / coverage
           END;
$$ LANGUAGE SQL;

CREATE FUNCTION estimate_hi(x DOUBLE PRECISION, y DOUBLE PRECISION)
RETURNS DOUBLE PRECISION AS $$
    SELECT CASE WHEN x = -999999 THEN y ELSE x END;
$$ LANGUAGE SQL;


CREATE MATERIALIZED VIEW hhs_hospital_history_cube AS
SELECT
	collection_week since_date,
	collection_week + 6 until_date,
	cmn.region region,
	cmn."name" municipality,
	fips_code,
	hospital_name,
	hospital_pk,

	hhs_avg(all_adult_hospital_inpatient_beds_7_day_sum,
	        all_adult_hospital_inpatient_beds_7_day_coverage)
		AS all_adult_hospital_inpatient_beds_7_day_avg,
	hhs_lo(all_adult_hospital_inpatient_beds_7_day_sum,
	       all_adult_hospital_inpatient_beds_7_day_coverage)
		AS all_adult_hospital_inpatient_beds_7_day_lo,
	hhs_hi(all_adult_hospital_inpatient_beds_7_day_sum,
	       all_adult_hospital_inpatient_beds_7_day_coverage)
		AS all_adult_hospital_inpatient_beds_7_day_hi,

	hhs_avg(all_adult_hospital_inpatient_bed_occupied_7_day_sum,
	        all_adult_hospital_inpatient_bed_occupied_7_day_coverage)
		AS all_adult_hospital_inpatient_bed_occupied_7_day_avg,
	hhs_lo(all_adult_hospital_inpatient_bed_occupied_7_day_sum,
	       all_adult_hospital_inpatient_bed_occupied_7_day_coverage)
		AS all_adult_hospital_inpatient_bed_occupied_7_day_lo,
	hhs_hi(all_adult_hospital_inpatient_bed_occupied_7_day_sum,
	       all_adult_hospital_inpatient_bed_occupied_7_day_coverage)
		AS all_adult_hospital_inpatient_bed_occupied_7_day_hi,

	hhs_avg(total_adult_patients_hospitalized_covid_7_day_sum,
	        total_adult_patients_hospitalized_covid_7_day_coverage)
		AS total_adult_patients_hospitalized_covid_7_day_avg,
	hhs_lo(total_adult_patients_hospitalized_covid_7_day_sum,
	       total_adult_patients_hospitalized_covid_7_day_coverage)
		AS total_adult_patients_hospitalized_covid_7_day_lo,
	hhs_hi(total_adult_patients_hospitalized_covid_7_day_sum,
	       total_adult_patients_hospitalized_covid_7_day_coverage)
		AS total_adult_patients_hospitalized_covid_7_day_hi,

	hhs_avg(total_adult_patients_hospitalized_confirmed_covid_7_day_sum,
	        total_adult_patients_hospitalized_confirmed_covid_7_day_coverage)
		AS total_adult_patients_hospitalized_confirmed_covid_7_day_avg,
	hhs_lo(total_adult_patients_hospitalized_confirmed_covid_7_day_sum,
	       total_adult_patients_hospitalized_confirmed_covid_7_day_coverage)
		AS total_adult_patients_hospitalized_confirmed_covid_7_day_lo,
	hhs_hi(total_adult_patients_hospitalized_confirmed_covid_7_day_sum,
	       total_adult_patients_hospitalized_confirmed_covid_7_day_coverage)
		AS total_adult_patients_hospitalized_confirmed_covid_7_day_hi,

	hhs_avg(total_staffed_adult_icu_beds_7_day_sum,
	        total_staffed_adult_icu_beds_7_day_coverage)
		AS total_staffed_adult_icu_beds_7_day_avg,
	hhs_lo(total_staffed_adult_icu_beds_7_day_sum,
	       total_staffed_adult_icu_beds_7_day_coverage)
		AS total_staffed_adult_icu_beds_7_day_lo,
	hhs_hi(total_staffed_adult_icu_beds_7_day_sum,
	       total_staffed_adult_icu_beds_7_day_coverage)
		AS total_staffed_adult_icu_beds_7_day_hi,

	hhs_avg(staffed_adult_icu_bed_occupancy_7_day_sum,
	        staffed_adult_icu_bed_occupancy_7_day_coverage)
		AS staffed_adult_icu_bed_occupancy_7_day_avg,
	hhs_lo(staffed_adult_icu_bed_occupancy_7_day_sum,
	       staffed_adult_icu_bed_occupancy_7_day_coverage)
		AS staffed_adult_icu_bed_occupancy_7_day_lo,
	hhs_hi(staffed_adult_icu_bed_occupancy_7_day_sum,
	       staffed_adult_icu_bed_occupancy_7_day_coverage)
		AS staffed_adult_icu_bed_occupancy_7_day_hi,

	hhs_avg(staffed_icu_adult_patients_covid_7_day_sum,
	        staffed_icu_adult_patients_covid_7_day_coverage)
		AS staffed_icu_adult_patients_covid_7_day_avg,
	hhs_lo(staffed_icu_adult_patients_covid_7_day_sum,
	       staffed_icu_adult_patients_covid_7_day_coverage)
		AS staffed_icu_adult_patients_covid_7_day_lo,
	hhs_hi(staffed_icu_adult_patients_covid_7_day_sum,
	       staffed_icu_adult_patients_covid_7_day_coverage)
		AS staffed_icu_adult_patients_covid_7_day_hi,

	hhs_avg(staffed_icu_adult_patients_confirmed_covid_7_day_sum,
	        staffed_icu_adult_patients_confirmed_covid_7_day_coverage)
		AS staffed_icu_adult_patients_confirmed_covid_7_day_avg,
	hhs_lo(staffed_icu_adult_patients_confirmed_covid_7_day_sum,
	       staffed_icu_adult_patients_confirmed_covid_7_day_coverage)
		AS staffed_icu_adult_patients_confirmed_covid_7_day_lo,
	hhs_hi(staffed_icu_adult_patients_confirmed_covid_7_day_sum,
	       staffed_icu_adult_patients_confirmed_covid_7_day_coverage)
		AS staffed_icu_adult_patients_confirmed_covid_7_day_hi

FROM hhs_hospital_history hhh
INNER JOIN canonical_municipal_names cmn
	USING (fips_code)
ORDER BY collection_week DESC, region, cmn."name", hospital_name;


CREATE VIEW products.icus_by_hospital AS
SELECT
	until_date,
	hospital_name,
	municipality,
	total_staffed_adult_icu_beds_7_day_lo,
	-- Occupied ICU beds can't be more than staffed ones:
	LEAST(staffed_adult_icu_bed_occupancy_7_day_hi,
		  total_staffed_adult_icu_beds_7_day_lo)
		AS staffed_adult_icu_bed_occupancy_7_day_hi,
	-- ICU COVID patients can't be more than either occupied
	-- or staffed beds:
	LEAST(staffed_icu_adult_patients_covid_7_day_hi,
		  staffed_adult_icu_bed_occupancy_7_day_hi,
		  total_staffed_adult_icu_beds_7_day_lo)
	  AS staffed_icu_adult_patients_covid_7_day_hi
FROM hhs_hospital_history_cube
ORDER BY until_date DESC, hospital_name;


CREATE VIEW products.icus_by_region AS
SELECT
	until_date,
	region,
	sum(total_staffed_adult_icu_beds_7_day_lo)
		AS total_staffed_adult_icu_beds_7_day_lo,
	sum(LEAST(staffed_adult_icu_bed_occupancy_7_day_hi,
		 	  total_staffed_adult_icu_beds_7_day_lo))
		AS staffed_adult_icu_bed_occupancy_7_day_hi,
	sum(LEAST(staffed_icu_adult_patients_covid_7_day_hi,
		      staffed_adult_icu_bed_occupancy_7_day_hi,
		      total_staffed_adult_icu_beds_7_day_lo))
	  AS staffed_icu_adult_patients_covid_7_day_hi
FROM hhs_hospital_history_cube
GROUP BY until_date, region
ORDER BY until_date DESC, region;

CREATE VIEW products.icus_by_state AS
SELECT
	date,
	total_staffed_adult_icu_beds,
	staffed_adult_icu_bed_occupancy,
	staffed_icu_adult_patients_confirmed_and_suspected_covid,
	staffed_icu_adult_patients_confirmed_covid
FROM hhs_state_history
-- Rows before this date are largely nulls or zeroes for ICU fields
WHERE date >= DATE '2020-07-28'
ORDER BY date DESC;