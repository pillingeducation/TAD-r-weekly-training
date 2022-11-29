SELECT LA_Code, count(LA_Code) as count_special
FROM [SWFC_Project].[SWFC].[School]
WHERE LA_code in ('330','350') AND SchoolPhase = 'Special'
GROUP BY LA_code