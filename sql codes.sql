
########## CODE for discharge deadline --->
## --> According to this discharge deadline COPS will monitor patient discharge and patient will be discharge wrt this discharge deadline

select category, Final_Mode_of_Payment, disease, Actual_room_admission_time, Actual_Date_of_discharge, Actual_OT_Start_Time,
concat(date(date_add(actual_room_admission_time, interval 1 day)), ' ', time(actual_room_admission_time)) as Time,
##############    LEVEL 0
### CASH CASES

case when actual_room_admission_time is not null and Final_Mode_of_Payment in ('Cash', 'CGHS - Cash') and 
((category='Aesthetics' and disease in ('Aesthetics-Others')) or (category='ENT' and disease in 
('Acute Rhinosinusitis','Acute Tonsillitis','Allergic Rhintis','Ear drums','Ear Packing','ENT-Others','Nasal Packing','Sinus','Thyroid')) OR 
(category='BPH' AND disease ='BPH Others') OR (category='General Gynaecology' and disease in ('Abnormal Uterine Bleeding', 'ANC','AUB',
'Heavy Bleeding','PCOD','Post MTP','Vaginal Cyst')) or (category='Gynaecology' and disease in ('Hymenoplasty', 'Vaginal Bleach', 'Vaginal warts'))
or (category='Kidney Stone' and disease in ('KIDNEY STONE', 'Kidney-Stone-Others')) or (category='Laparoscopy' and disease in ('Lap others')) or
(category='Orthopaedics' and disease in ('Orthopaedics-Others')))
 and cast(Actual_room_admission_time as Time) between '10:00:00' and '20:00:00'
 then
date_add(actual_room_admission_time, interval 1 day)
when actual_room_admission_time is not null and Final_Mode_of_Payment in ('Cash', 'CGHS - Cash') and 
((category='Aesthetics' and disease in ('Aesthetics-Others')) or (category='ENT' and disease in 
('Acute Rhinosinusitis','Acute Tonsillitis','Allergic Rhintis','Ear drums','Ear Packing','ENT-Others','Nasal Packing','Sinus','Thyroid')) OR 
(category='BPH' AND disease ='BPH Others') OR (category='General Gynaecology' and disease in ('Abnormal Uterine Bleeding', 'ANC','AUB',
'Heavy Bleeding','PCOD','Post MTP','Vaginal Cyst')) or (category='Gynaecology' and disease in ('Hymenoplasty', 'Vaginal Bleach', 'Vaginal warts'))
or (category='Kidney Stone' and disease in ('KIDNEY STONE', 'Kidney-Stone-Others')) or (category='Laparoscopy' and disease in ('Lap others')) or
(category='Orthopaedics' and disease in ('Orthopaedics-Others')))

 and (cast(Actual_room_admission_time as Time)>'20:00:00' or
cast(actual_room_admission_time as Time) <'10:00:00')
 then 
concat(date(date_add(actual_room_admission_time, interval 1 day)),' ' ,'10:00:00')
 
 ### CASHLESS CASES
 
 when actual_room_admission_time is not null and Final_Mode_of_Payment in ('Cashless', 'Copay - Cashless','CGHS - Cashless') and 
((category='Aesthetics' and disease in ('Aesthetics-Others')) or (category='ENT' and disease in 
('Acute Rhinosinusitis','Acute Tonsillitis','Allergic Rhintis','Ear drums','Ear Packing','ENT-Others','Nasal Packing','Sinus','Thyroid')) OR 
(category='BPH' AND disease ='BPH Others') OR (category='General Gynaecology' and disease in ('Abnormal Uterine Bleeding', 'ANC','AUB',
'Heavy Bleeding','PCOD','Post MTP','Vaginal Cyst')) or (category='Gynaecology' and disease in ('Hymenoplasty', 'Vaginal Bleach', 'Vaginal warts'))
or (category='Kidney Stone' and disease in ('KIDNEY STONE', 'Kidney-Stone-Others')) or (category='Laparoscopy' and disease in ('Lap others')) or
(category='Orthopaedics' and disease in ('Orthopaedics-Others')))
and
 cast(date_add(date_add(Actual_room_admission_time, interval 1 day), interval 6 hour) as Time) between '10:00:00' and '20:00:00'
 then
date_add(date_add(actual_room_admission_time, interval 1 day),interval 6 hour)
when actual_room_admission_time is not null and Final_Mode_of_Payment in ('Cashless', 'Copay - Cashless','CGHS - Cashless') and 
((category='Aesthetics' and disease in ('Aesthetics-Others')) or (category='ENT' and disease in 
('Acute Rhinosinusitis','Acute Tonsillitis','Allergic Rhintis','Ear drums','Ear Packing','ENT-Others','Nasal Packing','Sinus','Thyroid')) OR 
(category='BPH' AND disease ='BPH Others') OR (category='General Gynaecology' and disease in ('Abnormal Uterine Bleeding', 'ANC','AUB',
'Heavy Bleeding','PCOD','Post MTP','Vaginal Cyst')) or (category='Gynaecology' and disease in ('Hymenoplasty', 'Vaginal Bleach', 'Vaginal warts'))
or (category='Kidney Stone' and disease in ('KIDNEY STONE', 'Kidney-Stone-Others')) or (category='Laparoscopy' and disease in ('Lap others')) or
(category='Orthopaedics' and disease in ('Orthopaedics-Others')))
 and
( cast(date_add(date_add(Actual_room_admission_time, interval 1 day), interval 6 hour) as Time)>='20:00:00' or
cast(date_add(date_add(Actual_room_admission_time, interval 1 day), interval 6 hour) as Time) <='10:00:00')
 then 
concat(date(date_add(actual_room_admission_time, interval 2 day)), ' ', '10:00:00')
 
 ############## REIMB
 
 when actual_room_admission_time is not null and Final_Mode_of_Payment in ('Reimbursement','Copay - Reimbursement') and 
((category='Aesthetics' and disease in ('Aesthetics-Others')) or (category='ENT' and disease in 
('Acute Rhinosinusitis','Acute Tonsillitis','Allergic Rhintis','Ear drums','Ear Packing','ENT-Others','Nasal Packing','Sinus','Thyroid')) OR 
(category='BPH' AND disease ='BPH Others') OR (category='General Gynaecology' and disease in ('Abnormal Uterine Bleeding', 'ANC','AUB',
'Heavy Bleeding','PCOD','Post MTP','Vaginal Cyst')) or (category='Gynaecology' and disease in ('Hymenoplasty', 'Vaginal Bleach', 'Vaginal warts'))
or (category='Kidney Stone' and disease in ('KIDNEY STONE', 'Kidney-Stone-Others')) or (category='Laparoscopy' and disease in ('Lap others')) or
(category='Orthopaedics' and disease in ('Orthopaedics-Others')))
 and
 cast(date_add(date_add(Actual_room_admission_time, interval 1 day), interval 3 hour) as Time) between '10:00:00' and '20:00:00'
 then
date_add(date_add(actual_room_admission_time, interval 1 day),interval 3 hour)
when actual_room_admission_time is not null and Final_Mode_of_Payment in ('Reimbursement','Copay - Reimbursement') and 
((category='Aesthetics' and disease in ('Aesthetics-Others')) or (category='ENT' and disease in 
('Acute Rhinosinusitis','Acute Tonsillitis','Allergic Rhintis','Ear drums','Ear Packing','ENT-Others','Nasal Packing','Sinus','Thyroid')) OR 
(category='BPH' AND disease ='BPH Others') OR (category='General Gynaecology' and disease in ('Abnormal Uterine Bleeding', 'ANC','AUB',
'Heavy Bleeding','PCOD','Post MTP','Vaginal Cyst')) or (category='Gynaecology' and disease in ('Hymenoplasty', 'Vaginal Bleach', 'Vaginal warts'))
or (category='Kidney Stone' and disease in ('KIDNEY STONE', 'Kidney-Stone-Others')) or (category='Laparoscopy' and disease in ('Lap others')) or
(category='Orthopaedics' and disease in ('Orthopaedics-Others')))
 and
( cast(date_add(date_add(Actual_room_admission_time, interval 1 day), interval 3 hour) as Time)>='20:00:00' or
cast(date_add(date_add(Actual_room_admission_time, interval 1 day), interval 3 hour) as Time) <='10:00:00')
 then 
concat(date(date_add(actual_room_admission_time, interval 2 day)),' ' ,'10:00:00')

######## end level 0

#### START LEVEL 1  #### CASH 
when ((category='Aesthetics' and disease in ('Gynecomastia','Lipoma','Lipoma Single','Mole Removal','Sebaceous Cyst','Skin Grafting'))
 or (category='ENT' and disease in 
('Adenoiditis','Chronic Otitis Media','Chronic Rhinosinusitis','Chronic Tonsillitis', 'DNS','Nasal Polyps','Septoplasty','Tympanoplasty (Ear)' ))
  OR
  (category='General Gynaecology' and disease in ('1st trimester mtp', '2nd trimester mtp','Abortion', 'D&E','DNC','MTP'))
 or
 (category='Gynaecology' and disease in ('Labiaplasty'))
or
 (category='IVF' and disease in ('Cyst Aspiration', 'Embryo transfer','Female Infertility','FET','FET (1st Cycle) + Blastocyst','FET (2nd Cycle)'
 ,'FET(1st Cycle)','IUI','IVF-Others','Male Infertility','Ovum Pickup','TESE'))
 or 
 (category='Kidney Stone' and disease in ('Cystolithotripsy','Cytoscopy','Dj stent removal','DJ Stenting','ESWL')) or
(category='Laparoscopy' and disease in ('Appendectomy','Cyst removal','ERCP','Gallstones','Hydrocele','Inguinal Hernia','Umbilical Hernia'))
or
(category='Ophthalmology' and disease in ('Brass Laser','C3R','Cataract Surgery','FEMTO Customised','FEMTO Standard','Foreign monofocal cataract',
'Foreign multifocal cataract','Glaucoma Surgery','ICL LASIK','ICL Toric','Indian monofocal cataract','Indian multifocal cataract','Intravitreal Injections',
'Laser Eye Surgery','Lasik','Monofocal Foreign Toric Cataract','Monofocal Indian Toric Cataract','Multifocal Foreign Toric Cataract',
'Multifocal Indian Toric Cataract','Non FEMTO Customised','Non FEMTO Standard/PRK','Ophthalmology-Others','PRK LASIK','Pterygium',
'Retinal Injections','Retinal Surgery','Single Eye lasik','SmileLasik','Squint','Squint Surgery','Trans PRK','Trifocal Foreign Cataract',
'Trifocal Foreign Toric Cataract','Trifocal Indian Cataract','Trifocal Indian Toric Cataract'))
 or
(category='Orthopaedics' and disease in ('Carpal Tunnel Syndrome'))
or
(category='Proctology' and disease in ('Anal Polyps', 'Abscess','Anal Fissure','Anal Polyps','Anal Warts','Fissure', 'Fissure & Fistula',
'Fistula','Piles' ,'Piles & Fissure','Piles & Fissure & Fistula','Piles & Fistula','Pilonidal Sinus','Pinonidal-Sinus_Others','Procto-others'))
or
(category='Urology' and disease in ('Balnitis', 'Frenuloplasty','Laser Circumcision','Paraphimosis','Phimosis','Vasectomy','ZSR Circumcision'))
or
(category='Vascular' and disease in ('AV Fistula for Dialysis','Diabetic foot ulcer','Foot Ulcer','Sclerotherapy','Varicose Veins','Varicose Veins-1 leg',
'Varicose Veins-2 leg'))) and actual_room_admission_time is not null and 
cast(Actual_room_admission_time as Time) between '10:00:00' and '20:00:00' AND  Final_Mode_of_Payment in ('Cash', 'CGHS - Cash')
THEN date_add(actual_room_admission_time, interval 1 day) 
when 
((category='Aesthetics' and disease in ('Gynecomastia','Lipoma','Lipoma Single','Mole Removal','Sebaceous Cyst','Skin Grafting'))
 or (category='ENT' and disease in 
('Adenoiditis','Chronic Otitis Media','Chronic Rhinosinusitis','Chronic Tonsillitis', 'DNS','Nasal Polyps','Septoplasty','Tympanoplasty (Ear)' ))
  OR
  (category='General Gynaecology' and disease in ('1st trimester mtp', '2nd trimester mtp','Abortion', 'D&E','DNC','MTP'))
 or
 (category='Gynaecology' and disease in ('Labiaplasty'))
or
 (category='IVF' and disease in ('Cyst Aspiration', 'Embryo transfer','Female Infertility','FET','FET (1st Cycle) + Blastocyst','FET (2nd Cycle)'
 ,'FET(1st Cycle)','IUI','IVF-Others','Male Infertility','Ovum Pickup','TESE'))
 or 
 (category='Kidney Stone' and disease in ('Cystolithotripsy','Cytoscopy','Dj stent removal','DJ Stenting','ESWL')) or
(category='Laparoscopy' and disease in ('Appendectomy','Cyst removal','ERCP','Gallstones','Hydrocele','Inguinal Hernia','Umbilical Hernia'))
or
(category='Ophthalmology' and disease in ('Brass Laser','C3R','Cataract Surgery','FEMTO Customised','FEMTO Standard','Foreign monofocal cataract',
'Foreign multifocal cataract','Glaucoma Surgery','ICL LASIK','ICL Toric','Indian monofocal cataract','Indian multifocal cataract','Intravitreal Injections',
'Laser Eye Surgery','Lasik','Monofocal Foreign Toric Cataract','Monofocal Indian Toric Cataract','Multifocal Foreign Toric Cataract',
'Multifocal Indian Toric Cataract','Non FEMTO Customised','Non FEMTO Standard/PRK','Ophthalmology-Others','PRK LASIK','Pterygium',
'Retinal Injections','Retinal Surgery','Single Eye lasik','SmileLasik','Squint','Squint Surgery','Trans PRK','Trifocal Foreign Cataract',
'Trifocal Foreign Toric Cataract','Trifocal Indian Cataract','Trifocal Indian Toric Cataract'))
 or
(category='Orthopaedics' and disease in ('Carpal Tunnel Syndrome'))
or
(category='Proctology' and disease in ('Anal Polyps', 'Abscess','Anal Fissure','Anal Polyps','Anal Warts','Fissure', 'Fissure & Fistula',
'Fistula','Piles' ,'Piles & Fissure','Piles & Fissure & Fistula','Piles & Fistula','Pilonidal Sinus','Pinonidal-Sinus_Others','Procto-others'))
or
(category='Urology' and disease in ('Balnitis', 'Frenuloplasty','Laser Circumcision','Paraphimosis','Phimosis','Vasectomy','ZSR Circumcision'))
or
(category='Vascular' and disease in ('AV Fistula for Dialysis','Diabetic foot ulcer','Foot Ulcer','Sclerotherapy','Varicose Veins','Varicose Veins-1 leg',
'Varicose Veins-2 leg'))) and actual_room_admission_time is not null  AND  Final_Mode_of_Payment in ('Cash', 'CGHS - Cash') 
 and (cast(Actual_room_admission_time as Time)>'20:00:00' or cast(actual_room_admission_time as Time) <'10:00:00') THEN 
 concat(date(date_add(actual_room_admission_time, interval 1 day)),' ' ,'10:00:00')


###################### REIMB

when ((category='Aesthetics' and disease in ('Gynecomastia','Lipoma','Lipoma Single','Mole Removal','Sebaceous Cyst','Skin Grafting'))
 or (category='ENT' and disease in 
('Adenoiditis','Chronic Otitis Media','Chronic Rhinosinusitis','Chronic Tonsillitis', 'DNS','Nasal Polyps','Septoplasty','Tympanoplasty (Ear)' ))
  OR
  (category='General Gynaecology' and disease in ('1st trimester mtp', '2nd trimester mtp','Abortion', 'D&E','DNC','MTP'))
 or
 (category='Gynaecology' and disease in ('Labiaplasty'))
or
 (category='IVF' and disease in ('Cyst Aspiration', 'Embryo transfer','Female Infertility','FET','FET (1st Cycle) + Blastocyst','FET (2nd Cycle)'
 ,'FET(1st Cycle)','IUI','IVF-Others','Male Infertility','Ovum Pickup','TESE'))
 or 
 (category='Kidney Stone' and disease in ('Cystolithotripsy','Cytoscopy','Dj stent removal','DJ Stenting','ESWL')) or
(category='Laparoscopy' and disease in ('Appendectomy','Cyst removal','ERCP','Gallstones','Hydrocele','Inguinal Hernia','Umbilical Hernia'))
or
(category='Ophthalmology' and disease in ('Brass Laser','C3R','Cataract Surgery','FEMTO Customised','FEMTO Standard','Foreign monofocal cataract',
'Foreign multifocal cataract','Glaucoma Surgery','ICL LASIK','ICL Toric','Indian monofocal cataract','Indian multifocal cataract','Intravitreal Injections',
'Laser Eye Surgery','Lasik','Monofocal Foreign Toric Cataract','Monofocal Indian Toric Cataract','Multifocal Foreign Toric Cataract',
'Multifocal Indian Toric Cataract','Non FEMTO Customised','Non FEMTO Standard/PRK','Ophthalmology-Others','PRK LASIK','Pterygium',
'Retinal Injections','Retinal Surgery','Single Eye lasik','SmileLasik','Squint','Squint Surgery','Trans PRK','Trifocal Foreign Cataract',
'Trifocal Foreign Toric Cataract','Trifocal Indian Cataract','Trifocal Indian Toric Cataract'))
 or
(category='Orthopaedics' and disease in ('Carpal Tunnel Syndrome'))
or
(category='Proctology' and disease in ('Anal Polyps', 'Abscess','Anal Fissure','Anal Polyps','Anal Warts','Fissure', 'Fissure & Fistula',
'Fistula','Piles' ,'Piles & Fissure','Piles & Fissure & Fistula','Piles & Fistula','Pilonidal Sinus','Pinonidal-Sinus_Others','Procto-others'))
or
(category='Urology' and disease in ('Balnitis', 'Frenuloplasty','Laser Circumcision','Paraphimosis','Phimosis','Vasectomy','ZSR Circumcision'))
or
(category='Vascular' and disease in ('AV Fistula for Dialysis','Diabetic foot ulcer','Foot Ulcer','Sclerotherapy','Varicose Veins','Varicose Veins-1 leg',
'Varicose Veins-2 leg'))) and actual_room_admission_time is not null and 
cast(date_add(date_add(actual_room_admission_time, interval 1 day), interval 3 hour) as Time) between '10:00:00' and '20:00:00' AND  
Final_Mode_of_Payment in ('Reimbursement','Copay - Reimbursement')
THEN date_add(date_add(actual_room_admission_time, interval 1 day), interval 3 hour)
when 
((category='Aesthetics' and disease in ('Gynecomastia','Lipoma','Lipoma Single','Mole Removal','Sebaceous Cyst','Skin Grafting'))
 or (category='ENT' and disease in 
('Adenoiditis','Chronic Otitis Media','Chronic Rhinosinusitis','Chronic Tonsillitis', 'DNS','Nasal Polyps','Septoplasty','Tympanoplasty (Ear)' ))
  OR
  (category='General Gynaecology' and disease in ('1st trimester mtp', '2nd trimester mtp','Abortion', 'D&E','DNC','MTP'))
 or
 (category='Gynaecology' and disease in ('Labiaplasty'))
or
 (category='IVF' and disease in ('Cyst Aspiration', 'Embryo transfer','Female Infertility','FET','FET (1st Cycle) + Blastocyst','FET (2nd Cycle)'
 ,'FET(1st Cycle)','IUI','IVF-Others','Male Infertility','Ovum Pickup','TESE'))
 or 
 (category='Kidney Stone' and disease in ('Cystolithotripsy','Cytoscopy','Dj stent removal','DJ Stenting','ESWL')) or
(category='Laparoscopy' and disease in ('Appendectomy','Cyst removal','ERCP','Gallstones','Hydrocele','Inguinal Hernia','Umbilical Hernia'))
or
(category='Ophthalmology' and disease in ('Brass Laser','C3R','Cataract Surgery','FEMTO Customised','FEMTO Standard','Foreign monofocal cataract',
'Foreign multifocal cataract','Glaucoma Surgery','ICL LASIK','ICL Toric','Indian monofocal cataract','Indian multifocal cataract','Intravitreal Injections',
'Laser Eye Surgery','Lasik','Monofocal Foreign Toric Cataract','Monofocal Indian Toric Cataract','Multifocal Foreign Toric Cataract',
'Multifocal Indian Toric Cataract','Non FEMTO Customised','Non FEMTO Standard/PRK','Ophthalmology-Others','PRK LASIK','Pterygium',
'Retinal Injections','Retinal Surgery','Single Eye lasik','SmileLasik','Squint','Squint Surgery','Trans PRK','Trifocal Foreign Cataract',
'Trifocal Foreign Toric Cataract','Trifocal Indian Cataract','Trifocal Indian Toric Cataract'))
 or
(category='Orthopaedics' and disease in ('Carpal Tunnel Syndrome'))
or
(category='Proctology' and disease in ('Anal Polyps', 'Abscess','Anal Fissure','Anal Polyps','Anal Warts','Fissure', 'Fissure & Fistula',
'Fistula','Piles' ,'Piles & Fissure','Piles & Fissure & Fistula','Piles & Fistula','Pilonidal Sinus','Pinonidal-Sinus_Others','Procto-others'))
or
(category='Urology' and disease in ('Balnitis', 'Frenuloplasty','Laser Circumcision','Paraphimosis','Phimosis','Vasectomy','ZSR Circumcision'))
or
(category='Vascular' and disease in ('AV Fistula for Dialysis','Diabetic foot ulcer','Foot Ulcer','Sclerotherapy','Varicose Veins','Varicose Veins-1 leg',
'Varicose Veins-2 leg'))) and actual_room_admission_time is not null  AND  Final_Mode_of_Payment in ('Reimbursement','Copay - Reimbursement') 
 and (cast(date_add(date_add(actual_room_admission_time, interval 1 day), interval 3 hour) as Time)>'20:00:00' or 
 cast(date_add(date_add(actual_room_admission_time, interval 1 day), interval 3 hour) as Time)<'10:00:00') THEN 
 concat(date(date_add(actual_room_admission_time, interval 1 day)),' ' ,'10:00:00')
 
###################### cashless

when ((category='Aesthetics' and disease in ('Gynecomastia','Lipoma','Lipoma Single','Mole Removal','Sebaceous Cyst','Skin Grafting'))
 or (category='ENT' and disease in 
('Adenoiditis','Chronic Otitis Media','Chronic Rhinosinusitis','Chronic Tonsillitis', 'DNS','Nasal Polyps','Septoplasty','Tympanoplasty (Ear)' ))
  OR
  (category='General Gynaecology' and disease in ('1st trimester mtp', '2nd trimester mtp','Abortion', 'D&E','DNC','MTP'))
 or
 (category='Gynaecology' and disease in ('Labiaplasty'))
or
 (category='IVF' and disease in ('Cyst Aspiration', 'Embryo transfer','Female Infertility','FET','FET (1st Cycle) + Blastocyst','FET (2nd Cycle)'
 ,'FET(1st Cycle)','IUI','IVF-Others','Male Infertility','Ovum Pickup','TESE'))
 or 
 (category='Kidney Stone' and disease in ('Cystolithotripsy','Cytoscopy','Dj stent removal','DJ Stenting','ESWL')) or
(category='Laparoscopy' and disease in ('Appendectomy','Cyst removal','ERCP','Gallstones','Hydrocele','Inguinal Hernia','Umbilical Hernia'))
or
(category='Ophthalmology' and disease in ('Brass Laser','C3R','Cataract Surgery','FEMTO Customised','FEMTO Standard','Foreign monofocal cataract',
'Foreign multifocal cataract','Glaucoma Surgery','ICL LASIK','ICL Toric','Indian monofocal cataract','Indian multifocal cataract','Intravitreal Injections',
'Laser Eye Surgery','Lasik','Monofocal Foreign Toric Cataract','Monofocal Indian Toric Cataract','Multifocal Foreign Toric Cataract',
'Multifocal Indian Toric Cataract','Non FEMTO Customised','Non FEMTO Standard/PRK','Ophthalmology-Others','PRK LASIK','Pterygium',
'Retinal Injections','Retinal Surgery','Single Eye lasik','SmileLasik','Squint','Squint Surgery','Trans PRK','Trifocal Foreign Cataract',
'Trifocal Foreign Toric Cataract','Trifocal Indian Cataract','Trifocal Indian Toric Cataract'))
 or
(category='Orthopaedics' and disease in ('Carpal Tunnel Syndrome'))
or
(category='Proctology' and disease in ('Anal Polyps', 'Abscess','Anal Fissure','Anal Polyps','Anal Warts','Fissure', 'Fissure & Fistula',
'Fistula','Piles' ,'Piles & Fissure','Piles & Fissure & Fistula','Piles & Fistula','Pilonidal Sinus','Pinonidal-Sinus_Others','Procto-others'))
or
(category='Urology' and disease in ('Balnitis', 'Frenuloplasty','Laser Circumcision','Paraphimosis','Phimosis','Vasectomy','ZSR Circumcision'))
or
(category='Vascular' and disease in ('AV Fistula for Dialysis','Diabetic foot ulcer','Foot Ulcer','Sclerotherapy','Varicose Veins','Varicose Veins-1 leg',
'Varicose Veins-2 leg'))) and actual_room_admission_time is not null and 
cast(date_add(date_add(actual_room_admission_time, interval 1 day), interval 6 hour) as Time) between '10:00:00' and '20:00:00' AND 
 Final_Mode_of_Payment in ('Cashless', 'Copay - Cashless','CGHS - Cashless')
THEN date_add(date_add(actual_room_admission_time, interval 1 day), interval 6 hour)
 
 ################# end level 1
 ################################### START LEVEL 2 
 
 ############ CASH CASE
 when ((category='Aesthetics' and disease in ('Abdominoplasty','Axillary Breast Liposuction','Breast Augmentation/Mammoplasty','Breast Lump',
'Breast Reduction','Liposuction','Rhinoplasty'))
or (category='BPH' AND disease in ('ENLARGED PROSTATE (BPH)'))
 or (category='ENT' and disease in 
('Otosclerosis','Parotid','Stapedectomy','Thyroidectomy' ))
  OR
  (category='General Gynaecology' and disease in ("Bartholin's Cyst",'Ectopic pregnancy','Fibroids','Fibroids treatment','Hysteroscopy',
  'Ovarian Cyst','Polypectomy'))
 or
 (category='Gynaecology' and disease in ('Anterior Colporrhapy & Posterior Colpoperineorrhapy','Rectocele Cystocele','Vaginoplasty'))
 or 
 (category='Kidney Stone' and disease in ('PCNL','RIRS','URSL')) or
(category='Laparoscopy' and disease in ('Open Inguinal Hernia'))
or

(category='Orthopaedics' and disease in ('ACL','ACL Left knee','ACL Right knee','Knee Replacement','Ligament Knee','Shoulder Dislocation',
'Shoulder Replacement Surgery','Shoulder Tendon Repair','Trigger finger release'))
or
(category='Proctology' and disease in ('Rectal Prolapse'))
or
(category='Vascular' and disease in ('DVT','Varicocele'))) and actual_room_admission_time is not null and 
cast(Actual_room_admission_time as Time) between '10:00:00' and '20:00:00' AND  Final_Mode_of_Payment in ('Cash', 'CGHS - Cash')
THEN date_add(actual_room_admission_time, interval 2 day) 

when 
((category='Aesthetics' and disease in ('Abdominoplasty','Axillary Breast Liposuction','Breast Augmentation/Mammoplasty','Breast Lump',
'Breast Reduction','Liposuction','Rhinoplasty'))
or (category='BPH' AND disease in ('ENLARGED PROSTATE (BPH)'))
 or (category='ENT' and disease in 
('Otosclerosis','Parotid','Stapedectomy','Thyroidectomy' ))
  OR
  (category='General Gynaecology' and disease in ("Bartholin's Cyst",'Ectopic pregnancy','Fibroids','Fibroids treatment','Hysteroscopy',
  'Ovarian Cyst','Polypectomy'))
 or
 (category='Gynaecology' and disease in ('Anterior Colporrhapy & Posterior Colpoperineorrhapy','Rectocele Cystocele','Vaginoplasty'))
 or 
 (category='Kidney Stone' and disease in ('PCNL','RIRS','URSL')) or
(category='Laparoscopy' and disease in ('Open Inguinal Hernia'))
or

(category='Orthopaedics' and disease in ('ACL','ACL Left knee','ACL Right knee','Knee Replacement','Ligament Knee','Shoulder Dislocation',
'Shoulder Replacement Surgery','Shoulder Tendon Repair','Trigger finger release'))
or
(category='Proctology' and disease in ('Rectal Prolapse'))
or
(category='Vascular' and disease in ('DVT','Varicocele'))) and actual_room_admission_time is not null  AND  Final_Mode_of_Payment in 
('Cash', 'CGHS - Cash') 
 and (cast(Actual_room_admission_time as Time)>'20:00:00' or cast(actual_room_admission_time as Time) <'10:00:00') THEN 
 concat(date(date_add(actual_room_admission_time, interval 2 day)),' ' ,'10:00:00')

####################### cashless
 
when ((category='Aesthetics' and disease in ('Abdominoplasty','Axillary Breast Liposuction','Breast Augmentation/Mammoplasty','Breast Lump',
'Breast Reduction','Liposuction','Rhinoplasty'))
or (category='BPH' AND disease in ('ENLARGED PROSTATE (BPH)'))
 or (category='ENT' and disease in 
('Otosclerosis','Parotid','Stapedectomy','Thyroidectomy' ))
  OR
  (category='General Gynaecology' and disease in ("Bartholin's Cyst",'Ectopic pregnancy','Fibroids','Fibroids treatment','Hysteroscopy',
  'Ovarian Cyst','Polypectomy'))
 or
 (category='Gynaecology' and disease in ('Anterior Colporrhapy & Posterior Colpoperineorrhapy','Rectocele Cystocele','Vaginoplasty'))
 or 
 (category='Kidney Stone' and disease in ('PCNL','RIRS','URSL')) or
(category='Laparoscopy' and disease in ('Open Inguinal Hernia'))
or

(category='Orthopaedics' and disease in ('ACL','ACL Left knee','ACL Right knee','Knee Replacement','Ligament Knee','Shoulder Dislocation',
'Shoulder Replacement Surgery','Shoulder Tendon Repair','Trigger finger release'))
or
(category='Proctology' and disease in ('Rectal Prolapse'))
or
(category='Vascular' and disease in ('DVT','Varicocele'))) and actual_room_admission_time is not null and 
cast(date_add(date_add(actual_room_admission_time, interval 2 day), interval 6 hour) as Time) between '10:00:00' and '20:00:00' AND  
Final_Mode_of_Payment in ('Cashless', 'Copay - Cashless','CGHS - Cashless')
THEN date_add(date_add(actual_room_admission_time, interval 2 day), interval 6 hour)
when
 ((category='Aesthetics' and disease in ('Abdominoplasty','Axillary Breast Liposuction','Breast Augmentation/Mammoplasty','Breast Lump',
'Breast Reduction','Liposuction','Rhinoplasty'))
or (category='BPH' AND disease in ('ENLARGED PROSTATE (BPH)'))
 or (category='ENT' and disease in 
('Otosclerosis','Parotid','Stapedectomy','Thyroidectomy' ))
  OR
  (category='General Gynaecology' and disease in ("Bartholin's Cyst",'Ectopic pregnancy','Fibroids','Fibroids treatment','Hysteroscopy',
  'Ovarian Cyst','Polypectomy'))
 or
 (category='Gynaecology' and disease in ('Anterior Colporrhapy & Posterior Colpoperineorrhapy','Rectocele Cystocele','Vaginoplasty'))
 or 
 (category='Kidney Stone' and disease in ('PCNL','RIRS','URSL')) or
(category='Laparoscopy' and disease in ('Open Inguinal Hernia'))
or
(category='Orthopaedics' and disease in ('ACL','ACL Left knee','ACL Right knee','Knee Replacement','Ligament Knee','Shoulder Dislocation',
'Shoulder Replacement Surgery','Shoulder Tendon Repair','Trigger finger release'))
or
(category='Proctology' and disease in ('Rectal Prolapse'))
or
(category='Vascular' and disease in ('DVT','Varicocele'))) and actual_room_admission_time is not null  AND  Final_Mode_of_Payment in
 ('Cashless', 'Copay - Cashless','CGHS - Cashless')
 and (cast(date_add(date_add(actual_room_admission_time, interval 2 day), interval 6 hour) as Time)>'20:00:00' or 
 cast(date_add(date_add(actual_room_admission_time, interval 2 day), interval 6 hour) as Time)<'10:00:00') THEN 
 concat(date(date_add(actual_room_admission_time, interval 2 day)),' ' ,'10:00:00')
 
 ###################### REIMB
 
when ((category='Aesthetics' and disease in ('Abdominoplasty','Axillary Breast Liposuction','Breast Augmentation/Mammoplasty','Breast Lump',
'Breast Reduction','Liposuction','Rhinoplasty'))
or (category='BPH' AND disease in ('ENLARGED PROSTATE (BPH)'))
 or (category='ENT' and disease in 
('Otosclerosis','Parotid','Stapedectomy','Thyroidectomy' ))
  OR
  (category='General Gynaecology' and disease in ("Bartholin's Cyst",'Ectopic pregnancy','Fibroids','Fibroids treatment','Hysteroscopy',
  'Ovarian Cyst','Polypectomy'))
 or
 (category='Gynaecology' and disease in ('Anterior Colporrhapy & Posterior Colpoperineorrhapy','Rectocele Cystocele','Vaginoplasty'))
 or 
 (category='Kidney Stone' and disease in ('PCNL','RIRS','URSL')) or
(category='Laparoscopy' and disease in ('Open Inguinal Hernia'))
or

(category='Orthopaedics' and disease in ('ACL','ACL Left knee','ACL Right knee','Knee Replacement','Ligament Knee','Shoulder Dislocation',
'Shoulder Replacement Surgery','Shoulder Tendon Repair','Trigger finger release'))
or
(category='Proctology' and disease in ('Rectal Prolapse'))
or
(category='Vascular' and disease in ('DVT','Varicocele'))) and actual_room_admission_time is not null and 
cast(date_add(date_add(actual_room_admission_time, interval 2 day), interval 3 hour) as Time) between '10:00:00' and '20:00:00' AND  
Final_Mode_of_Payment in ('Reimbursement','Copay - Reimbursement')
THEN date_add(date_add(actual_room_admission_time, interval 2 day), interval 3 hour)

when ((category='Aesthetics' and disease in ('Abdominoplasty','Axillary Breast Liposuction','Breast Augmentation/Mammoplasty','Breast Lump',
'Breast Reduction','Liposuction','Rhinoplasty'))
or (category='BPH' AND disease in ('ENLARGED PROSTATE (BPH)'))
 or (category='ENT' and disease in 
('Otosclerosis','Parotid','Stapedectomy','Thyroidectomy' ))
  OR
  (category='General Gynaecology' and disease in ("Bartholin's Cyst",'Ectopic pregnancy','Fibroids','Fibroids treatment','Hysteroscopy',
  'Ovarian Cyst','Polypectomy'))
 or
 (category='Gynaecology' and disease in ('Anterior Colporrhapy & Posterior Colpoperineorrhapy','Rectocele Cystocele','Vaginoplasty'))
 or 
 (category='Kidney Stone' and disease in ('PCNL','RIRS','URSL')) or
(category='Laparoscopy' and disease in ('Open Inguinal Hernia'))
or

(category='Orthopaedics' and disease in ('ACL','ACL Left knee','ACL Right knee','Knee Replacement','Ligament Knee','Shoulder Dislocation',
'Shoulder Replacement Surgery','Shoulder Tendon Repair','Trigger finger release'))
or
(category='Proctology' and disease in ('Rectal Prolapse'))
or
(category='Vascular' and disease in ('DVT','Varicocele'))) and actual_room_admission_time is not null  AND  Final_Mode_of_Payment in
 ('Reimbursement','Copay - Reimbursement')
 and (cast(date_add(date_add(actual_room_admission_time, interval 2 day), interval 3 hour) as Time)>'20:00:00' or 
 cast(date_add(date_add(actual_room_admission_time, interval 2 day), interval 3 hour) as Time)<'10:00:00') THEN 
 concat(date(date_add(actual_room_admission_time, interval 2 day)),' ' ,'10:00:00')


################### end level 2
############################################ START LEVEL 3

when 
  ((category='General Gynaecology' and disease in ('Hysterectomy', 'Delivery', 'Myomectomy','Ovarian Cyst','Polypectomy'))

 or 
(category='Laparoscopy' and disease in ('Appendectomy','Open Umbilical Hernia'))
or
(category='Orthopaedics' and disease in ('Spinal problem','Spine Surgery')))
and actual_room_admission_time is not null and 
cast(Actual_room_admission_time as Time) between '10:00:00' and '20:00:00' AND  Final_Mode_of_Payment in ('Cash', 'CGHS - Cash')
THEN date_add(actual_room_admission_time, interval 3 day) 
when
 
  ((category='General Gynaecology' and disease in ('Hysterectomy', 'Delivery', 'Myomectomy','Ovarian Cyst','Polypectomy'))

 or 
(category='Laparoscopy' and disease in ('Appendectomy','Open Umbilical Hernia'))
or
(category='Orthopaedics' and disease in ('Spinal problem','Spine Surgery')))
 and actual_room_admission_time is not null  AND  Final_Mode_of_Payment in 
('Cash', 'CGHS - Cash') 
 and (cast(Actual_room_admission_time as Time)>'20:00:00' or cast(actual_room_admission_time as Time) <'10:00:00') THEN 
 concat(date(date_add(actual_room_admission_time, interval 3 day)),' ' ,'10:00:00')

####################### cashless

when
((category='General Gynaecology' and disease in ('Hysterectomy', 'Delivery', 'Myomectomy','Ovarian Cyst','Polypectomy'))

 or 
(category='Laparoscopy' and disease in ('Appendectomy','Open Umbilical Hernia'))
or
(category='Orthopaedics' and disease in ('Spinal problem','Spine Surgery')))
 and actual_room_admission_time is not null and 
cast(date_add(date_add(actual_room_admission_time, interval 3 day), interval 6 hour) as Time) between '10:00:00' and '20:00:00' AND  
Final_Mode_of_Payment in ('Cashless', 'Copay - Cashless','CGHS - Cashless')
THEN date_add(date_add(actual_room_admission_time, interval 3 day), interval 6 hour)
when

  ((category='General Gynaecology' and disease in ('Hysterectomy', 'Delivery', 'Myomectomy','Ovarian Cyst','Polypectomy'))

 or 
(category='Laparoscopy' and disease in ('Appendectomy','Open Umbilical Hernia'))
or
(category='Orthopaedics' and disease in ('Spinal problem','Spine Surgery')))
 and actual_room_admission_time is not null  AND  Final_Mode_of_Payment in
 ('Cashless', 'Copay - Cashless','CGHS - Cashless')
 and (cast(date_add(date_add(actual_room_admission_time, interval 3 day), interval 6 hour) as Time)>'20:00:00' or 
 cast(date_add(date_add(actual_room_admission_time, interval 3 day), interval 6 hour) as Time)<'10:00:00') THEN 
 concat(date(date_add(actual_room_admission_time, interval 4 day)),' ' ,'10:00:00')
 
 ###################### REIMB
 
when 
  ((category='General Gynaecology' and disease in ('Hysterectomy', 'Delivery', 'Myomectomy','Ovarian Cyst','Polypectomy'))
 or 
(category='Laparoscopy' and disease in ('Appendectomy','Open Umbilical Hernia'))
or
(category='Orthopaedics' and disease in ('Spinal problem','Spine Surgery')))
 and actual_room_admission_time is not null and 
cast(date_add(date_add(actual_room_admission_time, interval 3 day), interval 3 hour) as Time) between '10:00:00' and '20:00:00' AND  
Final_Mode_of_Payment in ('Reimbursement','Copay - Reimbursement')
THEN date_add(date_add(actual_room_admission_time, interval 3 day), interval 3 hour)

when
  ((category='General Gynaecology' and disease in ('Hysterectomy', 'Delivery', 'Myomectomy','Ovarian Cyst','Polypectomy'))
 or 
(category='Laparoscopy' and disease in ('Appendectomy','Open Umbilical Hernia'))
or
(category='Orthopaedics' and disease in ('Spinal problem','Spine Surgery')))
 and actual_room_admission_time is not null  AND  Final_Mode_of_Payment in
 ('Reimbursement','Copay - Reimbursement')
 and (cast(date_add(date_add(actual_room_admission_time, interval 3 day), interval 3 hour) as Time)>'20:00:00' or 
 cast(date_add(date_add(actual_room_admission_time, interval 3 day), interval 3 hour) as Time)<'10:00:00') THEN 
 concat(date(date_add(actual_room_admission_time, interval 4 day)),' ' ,'10:00:00')
 
 ############## END LEVEL 4
 ################################# START LEVEL 5
 
 
############ CASH CASE
 when 
((category='Laparoscopy' and disease in ('Gallstones','Incisional Hernia')) or 
(category='Orthopaedics' and disease in ('TKR Bilateral','Trauma')))
and actual_room_admission_time is not null and 
cast(Actual_room_admission_time as Time) between '10:00:00' and '20:00:00' AND  Final_Mode_of_Payment in ('Cash', 'CGHS - Cash')
THEN date_add(actual_room_admission_time, interval 4 day) 
when
((category='Laparoscopy' and disease in ('Gallstones','Incisional Hernia')) or 
(category='Orthopaedics' and disease in ('TKR Bilateral','Trauma')))
 and actual_room_admission_time is not null  AND  Final_Mode_of_Payment in 
('Cash', 'CGHS - Cash') 
 and (cast(Actual_room_admission_time as Time)>'20:00:00' or cast(actual_room_admission_time as Time) <'10:00:00') THEN 
 concat(date(date_add(actual_room_admission_time, interval 5 day)),' ' ,'10:00:00')

####################### cashless

when
((category='Laparoscopy' and disease in ('Gallstones','Incisional Hernia')) or 
(category='Orthopaedics' and disease in ('TKR Bilateral','Trauma')))
 and actual_room_admission_time is not null and 
cast(date_add(date_add(actual_room_admission_time, interval 5 day), interval 6 hour) as Time) between '10:00:00' and '20:00:00' AND  
Final_Mode_of_Payment in ('Cashless', 'Copay - Cashless','CGHS - Cashless')
THEN date_add(date_add(actual_room_admission_time, interval 5 day), interval 6 hour)
when
((category='Laparoscopy' and disease in ('Gallstones','Incisional Hernia')) or 
(category='Orthopaedics' and disease in ('TKR Bilateral','Trauma')))
 and actual_room_admission_time is not null  AND  Final_Mode_of_Payment in
 ('Cashless', 'Copay - Cashless','CGHS - Cashless')
 and (cast(date_add(date_add(actual_room_admission_time, interval 5 day), interval 6 hour) as Time)>'20:00:00' or 
 cast(date_add(date_add(actual_room_admission_time, interval 5 day), interval 6 hour) as Time)<'10:00:00') THEN 
 concat(date(date_add(actual_room_admission_time, interval 6 day)),' ' ,'10:00:00')
 
 ###################### REIMB
 
when 
((category='Laparoscopy' and disease in ('Gallstones','Incisional Hernia')) or 
(category='Orthopaedics' and disease in ('TKR Bilateral','Trauma')))
 and actual_room_admission_time is not null and 
cast(date_add(date_add(actual_room_admission_time, interval 5 day), interval 3 hour) as Time) between '10:00:00' and '20:00:00' AND  
Final_Mode_of_Payment in ('Reimbursement','Copay - Reimbursement')
THEN date_add(date_add(actual_room_admission_time, interval 5 day), interval 3 hour)

when
((category='Laparoscopy' and disease in ('Gallstones','Incisional Hernia')) or 
(category='Orthopaedics' and disease in ('TKR Bilateral','Trauma')))
 and actual_room_admission_time is not null  AND  Final_Mode_of_Payment in
 ('Reimbursement','Copay - Reimbursement')
 and (cast(date_add(date_add(actual_room_admission_time, interval 5 day), interval 3 hour) as Time)>'20:00:00' or 
 cast(date_add(date_add(actual_room_admission_time, interval 5 day), interval 3 hour) as Time)<'10:00:00') THEN 
 concat(date(date_add(actual_room_admission_time, interval 6 day)),' ' ,'10:00:00')
 
 ################################# END LEVEL 5
 ################################################### START LEVEL 7
 
 when 
(category='Laparoscopy' and disease in ('Bariatrics','Open Incisional Hernia')) 

and actual_room_admission_time is not null and 
cast(Actual_room_admission_time as Time) between '10:00:00' and '20:00:00' AND  Final_Mode_of_Payment in ('Cash', 'CGHS - Cash')
THEN date_add(actual_room_admission_time, interval 7 day) 
when
(category='Laparoscopy' and disease in ('Bariatrics','Open Incisional Hernia')) 
 and actual_room_admission_time is not null  AND  Final_Mode_of_Payment in 
('Cash', 'CGHS - Cash') 
 and (cast(Actual_room_admission_time as Time)>'20:00:00' or cast(actual_room_admission_time as Time) <'10:00:00') THEN 
 concat(date(date_add(actual_room_admission_time, interval 7 day)),' ' ,'10:00:00')

####################### cashless

when
(category='Laparoscopy' and disease in ('Bariatrics','Open Incisional Hernia')) 
 and actual_room_admission_time is not null and 
cast(date_add(date_add(actual_room_admission_time, interval 7 day), interval 6 hour) as Time) between '10:00:00' and '20:00:00' AND  
Final_Mode_of_Payment in ('Cashless', 'Copay - Cashless','CGHS - Cashless')
THEN date_add(date_add(actual_room_admission_time, interval 7 day), interval 6 hour)
when
(category='Laparoscopy' and disease in ('Bariatrics','Open Incisional Hernia')) 
 and actual_room_admission_time is not null  AND  Final_Mode_of_Payment in
 ('Cashless', 'Copay - Cashless','CGHS - Cashless')
 and (cast(date_add(date_add(actual_room_admission_time, interval 7 day), interval 6 hour) as Time)>'20:00:00' or 
 cast(date_add(date_add(actual_room_admission_time, interval 7 day), interval 6 hour) as Time)<'10:00:00') THEN 
 concat(date(date_add(actual_room_admission_time, interval 8 day)),' ' ,'10:00:00')
 
 ###################### REIMB
 
when 
(category='Laparoscopy' and disease in ('Bariatrics','Open Incisional Hernia')) 
 and actual_room_admission_time is not null and 
cast(date_add(date_add(actual_room_admission_time, interval 7 day), interval 3 hour) as Time) between '10:00:00' and '20:00:00' AND  
Final_Mode_of_Payment in ('Reimbursement','Copay - Reimbursement')
THEN date_add(date_add(actual_room_admission_time, interval 7 day), interval 3 hour)

when
(category='Laparoscopy' and disease in ('Bariatrics','Open Incisional Hernia')) 
 and actual_room_admission_time is not null  AND  Final_Mode_of_Payment in
 ('Reimbursement','Copay - Reimbursement')
 and (cast(date_add(date_add(actual_room_admission_time, interval 7 day), interval 3 hour) as Time)>'20:00:00' or 
 cast(date_add(date_add(actual_room_admission_time, interval 7 day), interval 3 hour) as Time)<'10:00:00') THEN 
 concat(date(date_add(actual_room_admission_time, interval 8 day)),' ' ,'10:00:00')

 else 0 end as data1 from CentralData where date(actual_room_admission_time) between '2022-09-01' and 
 date_sub(current_date(), interval 1 day);






######################  D-1 billing project---->
##### In this project we are tracking those hospitals where we can send final bill before discharge  patients on Daily basis  ####


 select patient_name, hospital_name, doctor_name, category, disease,city, appointmentid, proposed_ot_date, OT_Date_and_Time_Central_OPS,actual_ot_end_time,ot_notes, 
 Provisional_Discharge_Summary, Provisional_Bill from (select *,
 case when category='Aesthetics' and disease in ('Gynecomastia','Lipoma','Lipoma Single','Mole Removal','Sebaceous Cyst','Skin Grafting') 
 and Final_Mode_of_Payment in ('Cashless','Copay - Cashless', 'CGHS - Cashless')  and
 hospital_name in 
 ('Moolchand Hospital', 'Shubham Hospital','IPSC Hospital','Triton Hospital','Irene Hospital', 'GKM Hospital', 'MMRV Hospital Private Limited', 'Anjhakha Hospital',
 'CFC Multispeciality Hospital - Kilpauk', 'Padmini Nursing Home', 'Sri Srinivasa Hospital','Surana Chembur', 'MGM Hospital - Belapur','Aditi Hospital - Mulund','MPCT Hospital', 
 'Surana Malad', 'Apex Multispeciality  Borivali East','Apex Super Speciality Hospital','Apex Hospital- Mulund' ,'Kapadia Multispeciality Hospital - Malad',
 'Shree Hospital & ICU','Mallika Hospital','Shah Lifeline Hospital','Beams Hospital - Chembur',
 'Sun Hospital','Platinum Hospital - Mulund','Parakh Hospital','ONP Prime Hospital','Chellaram Hospital','Deccan multispeciality Hardikar hospital','Vishwaraj Hospital - Hadapsar',
 'Prime Multispeciality Hospital', 'Morya Hospital - Viman Nagar','Fortune Hospital - Pimpri', 'Hosmat Hospital', 'Aveksha Hospital','Manipal Hospital- JP Nagar',
 'Manipal Hospital- Sarjapur', 'ARV Hospital','Krishna Hospital - Kochi', 'Shree Sudheendra Medical', 'Anand Hospital - Meerut', 'Fortune Hospital - Kanpur', 
 'Nova/Ford Hospital','Medwin Hospital','Preethi Hospital - Coimbatore', 'Mukat Hospital','DP Bora Super Specility Hospital','SM Hospital - Meerut', 
 'Saravana Multispeciality Hospital', 'Santhya Speciality Hospitals', 'Healing  Hospital', 'Trinetra Advanced Eye Care Centre', 'PVS Hospital - Kozhikode', 
 'Capital Hospital - Vijayawada', 'Fenn Hospital - Madurai' )
 then 'yes' 
 when category='ENT' and  disease in ('Chronic Rhinosinusitis','Chronic Tonsillitis', 'DNS','Nasal Polyps','Septoplasty') and 
 Final_Mode_of_Payment in ('Cashless','Copay - Cashless', 'CGHS - Cashless')
 and hospital_name in 
 ('Moolchand Hospital', 'Shubham Hospital','IPSC Hospital','Triton Hospital','Irene Hospital', 'GKM Hospital', 'MMRV Hospital Private Limited', 'Anjhakha Hospital',
 'CFC Multispeciality Hospital - Kilpauk', 'Padmini Nursing Home', 'Sri Srinivasa Hospital','Surana Chembur', 'MGM Hospital - Belapur','Aditi Hospital - Mulund','MPCT Hospital', 
 'Surana Malad', 'Apex Multispeciality  Borivali East','Apex Super Speciality Hospital','Apex Hospital- Mulund' ,'Kapadia Multispeciality Hospital - Malad',
 'Shree Hospital & ICU','Mallika Hospital','Shah Lifeline Hospital','Beams Hospital - Chembur',
 'Sun Hospital','Platinum Hospital - Mulund','Parakh Hospital','ONP Prime Hospital','Chellaram Hospital','Deccan multispeciality Hardikar hospital','Vishwaraj Hospital - Hadapsar',
 'Prime Multispeciality Hospital', 'Morya Hospital - Viman Nagar','Fortune Hospital - Pimpri', 'Hosmat Hospital', 'Aveksha Hospital','Manipal Hospital- JP Nagar',
 'Manipal Hospital- Sarjapur', 'ARV Hospital','Krishna Hospital - Kochi', 'Shree Sudheendra Medical', 'Anand Hospital - Meerut', 'Fortune Hospital - Kanpur', 
 'Nova/Ford Hospital','Medwin Hospital','Preethi Hospital - Coimbatore', 'Mukat Hospital','DP Bora Super Specility Hospital','SM Hospital - Meerut', 
 'Saravana Multispeciality Hospital', 'Santhya Speciality Hospitals', 'Healing  Hospital', 'Trinetra Advanced Eye Care Centre', 'PVS Hospital - Kozhikode', 
 'Capital Hospital - Vijayawada', 'Fenn Hospital - Madurai' ) then 'yes' 
 when category='Kidney Stone' and disease in ('Cystolithotripsy','Cytoscopy','DJ Stenting') and 
 Final_Mode_of_Payment in ('Cashless','Copay - Cashless', 'CGHS - Cashless')  and
 hospital_name in
 ('Moolchand Hospital', 'Shubham Hospital','IPSC Hospital','Triton Hospital','Irene Hospital', 'GKM Hospital', 'MMRV Hospital Private Limited', 'Anjhakha Hospital',
 'CFC Multispeciality Hospital - Kilpauk', 'Padmini Nursing Home', 'Sri Srinivasa Hospital','Surana Chembur', 'MGM Hospital - Belapur','Aditi Hospital - Mulund','MPCT Hospital', 
 'Surana Malad', 'Apex Multispeciality  Borivali East','Apex Super Speciality Hospital','Apex Hospital- Mulund' ,'Kapadia Multispeciality Hospital - Malad',
 'Shree Hospital & ICU','Mallika Hospital','Shah Lifeline Hospital','Beams Hospital - Chembur',
 'Sun Hospital','Platinum Hospital - Mulund','Parakh Hospital','ONP Prime Hospital','Chellaram Hospital','Deccan multispeciality Hardikar hospital','Vishwaraj Hospital - Hadapsar',
 'Prime Multispeciality Hospital', 'Morya Hospital - Viman Nagar','Fortune Hospital - Pimpri', 'Hosmat Hospital', 'Aveksha Hospital','Manipal Hospital- JP Nagar',
 'Manipal Hospital- Sarjapur', 'ARV Hospital','Krishna Hospital - Kochi', 'Shree Sudheendra Medical', 'Anand Hospital - Meerut', 'Fortune Hospital - Kanpur', 
 'Nova/Ford Hospital','Medwin Hospital','Preethi Hospital - Coimbatore', 'Mukat Hospital','DP Bora Super Specility Hospital','SM Hospital - Meerut', 
 'Saravana Multispeciality Hospital', 'Santhya Speciality Hospitals', 'Healing  Hospital', 'Trinetra Advanced Eye Care Centre', 'PVS Hospital - Kozhikode', 
 'Capital Hospital - Vijayawada', 'Fenn Hospital - Madurai' ) then 'yes' 
 when category='Laparoscopy' and disease in ('Cyst removal','ERCP','Hydrocele') and 
 Final_Mode_of_Payment in ('Cashless','Copay - Cashless', 'CGHS - Cashless')  and
 hospital_name in 
 ('Moolchand Hospital', 'Shubham Hospital','IPSC Hospital','Triton Hospital','Irene Hospital','GKM Hospital', 'MMRV Hospital Private Limited', 'Anjhakha Hospital',
 'CFC Multispeciality Hospital - Kilpauk', 'Padmini Nursing Home', 'Sri Srinivasa Hospital','Surana Chembur', 'MGM Hospital - Belapur','Aditi Hospital - Mulund','MPCT Hospital', 
 'Surana Malad', 'Apex Multispeciality  Borivali East','Apex Super Speciality Hospital','Apex Hospital- Mulund' ,'Kapadia Multispeciality Hospital - Malad',
 'Shree Hospital & ICU','Mallika Hospital','Shah Lifeline Hospital','Beams Hospital - Chembur',
 'Sun Hospital','Platinum Hospital - Mulund','Parakh Hospital','ONP Prime Hospital','Chellaram Hospital','Deccan multispeciality Hardikar hospital','Vishwaraj Hospital - Hadapsar',
 'Prime Multispeciality Hospital', 'Morya Hospital - Viman Nagar','Fortune Hospital - Pimpri', 'Hosmat Hospital', 'Aveksha Hospital','Manipal Hospital- JP Nagar',
 'Manipal Hospital- Sarjapur', 'ARV Hospital','Krishna Hospital - Kochi', 'Shree Sudheendra Medical', 'Anand Hospital - Meerut', 'Fortune Hospital - Kanpur', 
 'Nova/Ford Hospital','Medwin Hospital','Preethi Hospital - Coimbatore', 'Mukat Hospital','DP Bora Super Specility Hospital','SM Hospital - Meerut', 
 'Saravana Multispeciality Hospital', 'Santhya Speciality Hospitals', 'Healing  Hospital', 'Trinetra Advanced Eye Care Centre', 'PVS Hospital - Kozhikode', 
 'Capital Hospital - Vijayawada', 'Fenn Hospital - Madurai' ) then 'yes'
 when category='Proctology' and disease in ('Anal Polyps', 'Abscess','Anal Fissure','Anal Polyps','Anal Warts','Fissure', 'Fissure & Fistula','Fistula','Piles' ,'Piles & Fissure',
 'Piles & Fissure & Fistula','Piles & Fistula','Pilonidal Sinus','Pinonidal-Sinus_Others','Procto-others') and 
 Final_Mode_of_Payment in ('Cashless','Copay - Cashless', 'CGHS - Cashless')  and
 
 hospital_name in ('Moolchand Hospital', 'Shubham Hospital','IPSC Hospital','Triton Hospital','Irene Hospital','GKM Hospital', 'MMRV Hospital Private Limited', 'Anjhakha Hospital',
 'CFC Multispeciality Hospital - Kilpauk', 'Padmini Nursing Home', 'Sri Srinivasa Hospital','Surana Chembur', 'MGM Hospital - Belapur','Aditi Hospital - Mulund','MPCT Hospital', 
 'Surana Malad', 'Apex Multispeciality  Borivali East','Apex Super Speciality Hospital','Apex Hospital- Mulund' ,'Kapadia Multispeciality Hospital - Malad',
 'Shree Hospital & ICU','Mallika Hospital','Shah Lifeline Hospital','Beams Hospital - Chembur',
 'Sun Hospital','Platinum Hospital - Mulund','Parakh Hospital','ONP Prime Hospital','Chellaram Hospital','Deccan multispeciality Hardikar hospital','Vishwaraj Hospital - Hadapsar',
 'Prime Multispeciality Hospital', 'Morya Hospital - Viman Nagar','Fortune Hospital - Pimpri', 'Hosmat Hospital', 'Aveksha Hospital','Manipal Hospital- JP Nagar',
 'Manipal Hospital- Sarjapur', 'ARV Hospital','Krishna Hospital - Kochi', 'Shree Sudheendra Medical', 'Anand Hospital - Meerut', 'Fortune Hospital - Kanpur', 
 'Nova/Ford Hospital','Medwin Hospital','Preethi Hospital - Coimbatore', 'Mukat Hospital','DP Bora Super Specility Hospital','SM Hospital - Meerut', 
 'Saravana Multispeciality Hospital', 'Santhya Speciality Hospitals', 'Healing  Hospital', 'Trinetra Advanced Eye Care Centre', 'PVS Hospital - Kozhikode', 
 'Capital Hospital - Vijayawada', 'Fenn Hospital - Madurai' ) then 'yes' 
 
 when category='Vascular' and disease in
 ('AV Fistula for Dialysis','Diabetic foot ulcer','Foot Ulcer','Sclerotherapy','Varicose Veins','Varicose Veins-1 leg','Varicose Veins-2 leg') and
 Final_Mode_of_Payment in ('Cashless','Copay - Cashless', 'CGHS - Cashless')  and 
 hospital_name in ('Moolchand Hospital', 'Shubham Hospital','IPSC Hospital','Triton Hospital','Irene Hospital', 'GKM Hospital', 'MMRV Hospital Private Limited', 'Anjhakha Hospital',
 'CFC Multispeciality Hospital - Kilpauk', 'Padmini Nursing Home', 'Sri Srinivasa Hospital','Surana Chembur', 'MGM Hospital - Belapur','Aditi Hospital - Mulund','MPCT Hospital', 
 'Surana Malad', 'Apex Multispeciality  Borivali East','Apex Super Speciality Hospital','Apex Hospital- Mulund' ,'Kapadia Multispeciality Hospital - Malad',
 'Shree Hospital & ICU','Mallika Hospital','Shah Lifeline Hospital','Beams Hospital - Chembur',
 'Sun Hospital','Platinum Hospital - Mulund','Parakh Hospital','ONP Prime Hospital','Chellaram Hospital','Deccan multispeciality Hardikar hospital','Vishwaraj Hospital - Hadapsar',
 'Prime Multispeciality Hospital', 'Morya Hospital - Viman Nagar','Fortune Hospital - Pimpri', 'Hosmat Hospital', 'Aveksha Hospital','Manipal Hospital- JP Nagar',
 'Manipal Hospital- Sarjapur', 'ARV Hospital','Krishna Hospital - Kochi', 'Shree Sudheendra Medical', 'Anand Hospital - Meerut', 'Fortune Hospital - Kanpur', 
 'Nova/Ford Hospital','Medwin Hospital','Preethi Hospital - Coimbatore', 'Mukat Hospital','DP Bora Super Specility Hospital','SM Hospital - Meerut', 
 'Saravana Multispeciality Hospital', 'Santhya Speciality Hospitals', 'Healing  Hospital', 'Trinetra Advanced Eye Care Centre', 'PVS Hospital - Kozhikode', 
 'Capital Hospital - Vijayawada', 'Fenn Hospital - Madurai' ) then 'yes' end as Applicable from CentralData )
 t1 
 where proposed_ot_date = date_sub(current_date(), interval 0 day) and appointment_status='Active'  and
 applicable is not null and AppointmentType='IPD' order by proposed_ot_date asc;
 
 
 
 
 
 
 ########################### Direct cases ------>
 #### we are tracking those patients who ipd post after 8pm and coming next day or ipd post and patient will came same day
 
 select  patient_name, hospital_name, city, patientid, appointmentid, category,disease, ipd_posted_at, proposed_date_of_admission,  patient_actual_arrival_time, appointment_status from (
select  patient_name, hospital_name, city, patientid, appointmentid, category,disease, ipd_posted_at,proposed_date_of_admission,  patient_actual_arrival_time, appointment_status,
case when date(ipd_posted_at) = date_sub(current_date(), interval 1 day) and  cast(ipd_posted_at as Time)>='20:00:00' and proposed_date_of_admission= current_date()
 then 'YES'
 when date(ipd_posted_at) = current_date() and  date(ipd_posted_at)=proposed_date_of_admission
 then 'YES' end as data1
 from CentralData)t1 where
 data1 is not null and category='Ophthalmology' order by ipd_posted_at asc;
 
 
############################  Advance cash collection ----->
####  How much cash cities have received from the patient before surgery and what are the percentage of advance cash collection of the cities

select New_city, sum(collectible_amount), sum(Collected_Amount), sum(Collected_Amount)/sum(collectible_amount) from 
(select *,
 case when
 150000>Proposed_Package_Amount_Cash_cases>60000 and  category in ('Aesthetics', 'Vascular') then (Proposed_Package_Amount_Cash_cases/2)
 when Proposed_Package_Amount_Cash_cases>=150000 and  category in ('Aesthetics', 'Vascular') then 75000
 when Proposed_Package_Amount_Cash_cases>80000 and category='Laparoscopy' then (Proposed_Package_Amount_Cash_cases/2)
 when category='Orthopaedics' then 75000 else Proposed_Package_Amount_Cash_cases end as Collectible_Amount,
 
 case when Appointment_Status='Active' and mode_of_payment='Cash' and Payment_Type_For_Cash_cases='Non EMI' then 
 (ifnull(Advance_Collected_at_GHV,0)+ ifnull(Amount_collected_at_Admission_for_cash_cases,0)) else 0 end  as Collected_Amount,
  case when city not in ('mumbai', 'delhi', 'pune', 'bangalore', 'chennai', 'hyderabad') then 'Tertiary' else city end as New_city
from CentralData )t1 
where 
Appointment_Status='Active' and final_mode_of_payment='Cash' and Payment_Type_For_Cash_cases='Non EMI' and date(Actual_room_admission_time)
between '2023-01-01' and date_sub(curdate(), interval 1 day);





