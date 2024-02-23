select 
a.id,r.reason,Absenteeism_time_in_hours,Month_of_absence,Body_mass_index,
case when Body_mass_index < 18.5 then 'Under Weight'
	 when Body_mass_index between 18.5 and 25 then 'Healthy Weight'
	 when Body_mass_index between 25 and 30 then 'Overweight'
	 when Body_mass_index > 30 then 'Obese'
	 else 'unkown' end as BMI_Category,
case when Month_of_absence in (12,1,2) then 'Winter'
	 when Month_of_absence in (3,4,5) then 'Spring'
	 when Month_of_absence in (6,7,8) then 'Summer'
	 when Month_of_absence in (9,10,11) then 'Fall'
	 ELSE 'Unkown' END AS Season_Names,
Seasons,Day_of_the_week,
Transportation_expense,Education,Son,
Social_drinker,Social_smoker,Pet,
Disciplinary_failure,Age,Work_load_Average_day
from Absenteeism_at_work a
left join compensation c
on a.ID = c.ID
left join Reasons r
on a.Reason_for_absence = r.Number