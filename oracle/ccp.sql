# MySQL dump 6.0
#
# Host: localhost    Database: ccp
#--------------------------------------------------------
# Server version	3.22.25-log

#
# Table structure for table 'description'
#
CREATE TABLE description (
  id char(5),
  cctopic char(1),
  name char(50)
);

#
# Dumping data for table 'description'
#

INSERT INTO description VALUES ('ACS',NULL,'American Cancer Society');
INSERT INTO description VALUES ('CDC','C','CDC Comprehensive Cancer Control Network');
INSERT INTO description VALUES ('CIS',NULL,'NCI Cancer Information Service');
INSERT INTO description VALUES ('CDC','T','CDC Tobacco Control Network');
INSERT INTO description VALUES ('CDC','P','CDC Physical Activity Network');

#
# Table structure for table 'partners'
#
CREATE TABLE partners (
  region char(2),
  partner char(5),
  topic char(1),
  type char(1),
  contact char(1),
  name char(100),
  degree char(20),
  title char(100),
  org1 char(100),
  org2 char(100),
  orgurl char(200),
  address1 char(100),
  address2 char(100),
  city char(50),
  state char(3),
  zip char(15),
  phone char(50),
  fax char(50),
  cell char(50),
  email char(100)
);

#
# Dumping data for table 'partners'
#

INSERT INTO partners VALUES ('AK','ACS','','R','','Patti Migliore','MPA','Regional Manager, Cancer Control Planning','','','','PO Box 19140','2120 First Avenue North','Seattle','WA','98109','(206) 283-1152','(206) 285-3469','','patricia.migliore@cancer.org');
INSERT INTO partners VALUES ('AK','CDC','C','S','','Jayne Andreen','','Community Health & EMS','Alaska Dept. of Health & Social Services','','http://health.hss.state.ak.us/dph/','P.O. Box 110616','','Juneau','AK','99811-0616','(907) 465-5729','','','jayne_andreen@health.state.ak.us');
INSERT INTO partners VALUES ('AK','CDC','T','S','','','','','','','http://health.hss.state.ak.us/dph/chems/tobacco/default.htm','','','','','','','','','');
INSERT INTO partners VALUES ('AK','CDC','P','S','','Russell Stevens','','Physical Activity Specialist','Dept. of Health and Social Services, State of Alaska','CHEMS - Cardiovascular Health Program, Division of Public Health','www.chems.alaska.gov/takeheart/default.htm','P.O. Box 110616','','Juneau','AK','99811-0616','(907) 465-8541','(907) 465-2770','','Russ_Stevens@health.state.ak.us');
INSERT INTO partners VALUES ('AK','CIS','','R','','Katherine J. Briant','MPH, CHES','Partnership Program Manager','Fred Hutchinson Cancer Research Center','Cancer Information Service - Pacific Region','','1100 Fairview Ave North, J2-400','PO Box 19024','Seattle','WA','98109-1024','(203) 667-1137','(206) 667-7792','','kbriant@fhcrc.org');
INSERT INTO partners VALUES ('AL','ACS','','R','','Kristina Jennings-Wait','M.Ed.','Senior Director, Strategic Planning','American Cancer Society','','','709 Boscobel Street','','Nashville','TN','37206','(615) 254-9268','(615) 254-9267','','kristina.wait@cancer.org');
INSERT INTO partners VALUES ('AL','CDC','C','S','','Viki Brant','MPA','Director, Cancer Prevention','Alabama Department of Public Health','','www.adph.org','201 Monroe Street, Suite 900','RSA Tower','Montgomery','AL','36130-3017','(334) 206-5547','(334) 206-5324','','vbrant@adph.state.al.us');
INSERT INTO partners VALUES ('AL','CDC','T','S','','','','','','','http://www.adph.org/tobacco/','','','','','','','','','');
INSERT INTO partners VALUES ('AL','CDC','P','S','','Anita Sanford','','Physical Activity Specialist','Chronic Disease Prevention Division','Alabama Department of Public Health','www.adph.org/physicalactivity','The RSA Tower, Suite 1010','201 Monroe Street','Montgomery','AL','36104','(334) 206-5656','(334) 206-5663','','asanford@adph.state.al.us');
INSERT INTO partners VALUES ('AL','CIS','','R','','Tami Kelder','','Partnership Program Manager','UK Markey Cancer Center','','','2365 Harrodsburg Road','Suite A230','Lexington','KY','40504','(859) 219-9063','(859) 219-2276','','tkelder@cis.uky.edu');
INSERT INTO partners VALUES ('AR','ACS','','R','','Kristina Jennings-Wait','M.Ed.','Senior Director, Strategic Planning','American Cancer Society','','','709 Boscobel Street','','Nashville','TN','37206','(615) 254-9268','(615) 254-9267','','kristina.wait@cancer.org');
INSERT INTO partners VALUES ('AR','CDC','C','S','P','Barbara Hager','','CCC/BCCCP Team Leader','Arkansas Department of Health','Division of Chronic Disease and Disability Prevention','www.healthyarkansas.com','4815 West Markham Street','Slot 3','Little Rock','AR','72205','(501) 661-2495','','','bhager@healthyarkansas.com');
INSERT INTO partners VALUES ('AR','CDC','C','S','S','Tina Gill','','Coordinator, Comprehensive Cancer Control','','','','27 W. Township','','Fayetteville','AR','72703','(501) 444-7700','','','tgill@mail.doh.state.ar.us');
INSERT INTO partners VALUES ('AR','CDC','T','S','','','','','','','www.healthyarkansas.com','','','','','','','','','');
INSERT INTO partners VALUES ('AR','CDC','P','S','','Debbie Campbell','','Coordinator, Governor\'s Council on Fitness','Health Education and Promotion Division','Arkansas Department of Health','www.healthyarkansas.com','4815 West Markham Street, Slot 36','','Little Rock','AR','72205-3867','(501) 661-2797','(501) 661-2044','','ddcampbell@HealthyArkansas.com');
INSERT INTO partners VALUES ('AR','CIS','','R','','Tami Kelder','','Partnership Program Manager','UK Markey Cancer Center','','','2365 Harrodsburg Road','Suite A230','Lexington','KY','40504','(859) 219-9063','(859) 219-2276','','tkelder@cis.uky.edu');
INSERT INTO partners VALUES ('AS','CDC','C','T','','Tele Frost-Hill','RN','','LBJ Tropical Medical Center','American Samoa','www.asg-gov.com/departments/doh.asg.htm','PO Box E','','Pago Pago','AS','96799','(684) 633-2697','(684) 688-2014','','us-pubhealth@geocities.com');
INSERT INTO partners VALUES ('AS','CDC','T','T','','','','','','','www.asg-gov.com/departments/doh.asg.htm','','','','','','','','','');
INSERT INTO partners VALUES ('AS','CIS','','R','','Paula Higuchi','','Partnership Program Manager','Uh-Cancer Research Center of Hawaii','Cancer Information Service - 5th Floor','','1236 Lauhala Street','','Honolulu','HI','96813','(808) 564-5921','(808) 586-3009','','paulah@crch.hawaii.edu');
INSERT INTO partners VALUES ('AZ','ACS','','R','','A. Veronica Perez','MPH','Regional Manager, Cancer Control Planning','','','','2929 East Thomas Road','','Phoenix','AZ','85016','(602) 224-0524','(602) 381-3096','','veronica.perez@cancer.org');
INSERT INTO partners VALUES ('AZ','CDC','C','S','','Margaret Tate','RD, MS','Chief, Office of Nutrition and Chronic Disease Prevention Services','Arizona Department of Health Services','','http://www.hs.state.az.us/','2927 N. 35th Ave, Suite 400','','Phoenix','AZ','85017','(602) 542-2829','(602) 542-1890','','mtate@hs.state.az.us');
INSERT INTO partners VALUES ('AZ','CDC','T','S','','','','','','','http://www.tepp.org/','','','','','','','','','');
INSERT INTO partners VALUES ('AZ','CDC','P','S','','Tammy Vehige','','Program Manager','Bureau of Community and Family Health Services','Arizona State Health Department','www.hs.state.az.us','2700 North 3rd Street, Suite 4050','','Phoenix','AZ','85004','(602) 364-2401','(602) 542-7351','','tvehige@hs.state.az.us');
INSERT INTO partners VALUES ('AZ','CIS','','R','','Barbara Baldwin','','Partnership Program Manager','Centura Health','Penrose-St. Francis Health Services','','PO Box 7021','','Colorado Springs','CO','80933','(719) 776-3150','(719) 776-3132','','barbarabaldwin@centura.org');
INSERT INTO partners VALUES ('CA','ACS','','R','','Monica D. Allen','MPH','Regional Manager, Cancer Control Planning','American Cancer Society','','','1710 Webster Street','','Oakland','CA','94612','(510) 893.7900, x197','(510) 874-7161','(415) 713-7322','monica.allen@cancer.org');
INSERT INTO partners VALUES ('CA','CDC','C','S','','Dileep G. Bal','MD','Chief, Cancer Control Branch','California Department of Health Services','','http://www.dhs.ca.gov/ps/cdic/cdicindex.htm#ccb','601 North 7th Street, MS 662','Mail PO Box 942732','Sacramento','CA','94234-7320','(916) 322-4787','(916) 445-5940','','dbal@dhs.ca.gov');
INSERT INTO partners VALUES ('CA','CDC','T','S','','','','','','','http://www.dhs.ca.gov/ps/cdic/ccb/TCS/index.htm','','','','','','','','','');
INSERT INTO partners VALUES ('CA','CDC','P','S','','Steven P. Hooker','','Chief, Physical Activity and Health Initiative','California Department of Health Services','','www.dhs.ca.gov','601 North 7th Street, MS 675','P.O. Box 942732','Sacramento','CA','94234-7320','916) 324-7758','(916) 324-7764','','shooker@dhs.ca.gov');
INSERT INTO partners VALUES ('CA','CIS','','R','','Michelle Axel Moseley','','Partnership Program Manager','Northern California Cancer Center','','','32960 Alvarado-Niles Road','','Union City','CA','94587','(510) 429-2500','(510) 475-1496','','mmoseley@nccc.org');
INSERT INTO partners VALUES ('CO','ACS','','R','','Alacey Berumen','MNM','Regional Manager, Cancer Control Planning','','','','2255 Oneida','','Denver','CO','80224','(303) 758-2030, x446','','','alacey.berumen@cancer.org');
INSERT INTO partners VALUES ('CO','CDC','C','S','','Sara E. Miller','MPA','Program Coordinator, Comprehensive Cancer Prevention and Control Program','Colorado Department of Public Health and Environment','','http://www.cdphe.state.co.us/pp/ccpc/ccpchom.asp','4300 Cherry Creek Drive South','','Denver','CO','80246-1530','(303) 692-2519','(303) 782-0095','','sara.miller@state.co.us');
INSERT INTO partners VALUES ('CO','CDC','T','S','','','','','','','http://www.cdphe.state.co.us/pp/tobacco/tobaccohom.asp','','','','','','','','','');
INSERT INTO partners VALUES ('CO','CDC','P','S','','Patrick Barnett','','Program Manager, Chronic Disease','Colorado Department of Public Health and Environment','','www.colorado-fitness.org/','4300 Cherry Creek Drive South','EMSPD-A5','Denver','CO','80246-1530','(303) 692-2562','(303) 691-7721','','pat.barnett@state.co.us');
INSERT INTO partners VALUES ('CO','CIS','','R','','Barbara Baldwin','','Partnership Program Manager','Centura Health','Penrose-St. Francis Health Services','','PO Box 7021','','Colorado Springs','CO','80933','(719) 776-3150','(719) 776-3132','','barbarabaldwin@centura.org');
INSERT INTO partners VALUES ('CT','ACS','','R','','Judith Meinhardt','','Cancer Control Associate','American Cancer Society','New England Division','','30 Speen Street','','Framingham','MA','01701','(508) 270-4661','(508) 270-4921','','');
INSERT INTO partners VALUES ('CT','CDC','C','S','','Christine Parker','MPH','Breast & Cervical Cancer Coordinator','State of Connecticut Department of Public Health','','www.dph.state.ct.us','410 Capitol Avenue, MS 11-HLS','PO Box 340308','Hartford','CT','06134-0308','(860) 509-7803','(860) 509-7854','','nancy.berger@po.state.ct.us');
INSERT INTO partners VALUES ('CT','CDC','T','S','','','','','','','http://66.216.69.80/','','','','','','','','','christine.parker@po.state.ct.us');
INSERT INTO partners VALUES ('CT','CDC','P','S','','Gary St. Amand','','Health Program Associate','Connecticut State Department of Public Health','Division of Health Education and Intervention','http://www.ctahperd.org/','410 Capitol Avenue, MS#11HLS','P.O. Box 340308','Hartford','CT','06134-0308','(860) 509-7802','(860) 509-7854','','gary.stamand@po.state.ct.us');
INSERT INTO partners VALUES ('CT','CIS','','R','','Russell Leshne','','Partnership Program Manager','Dana-Farber Cancer Institute','','','44 Binney Street, Smith 233','','Boston','MA','02115','(617) 632-3155','(617) 632-2661','','russell_leshne@dfci.harvard.edu');
INSERT INTO partners VALUES ('DC','ACS','','R','','Kathleen Wall','MSW','Regional Manager, Cancer Control Planning','','','','6 Staten Drive','','Hockessin','DE','17920','(302) 239-9769','(302) 239-9768','','kathleen.wall@cancer.org');
INSERT INTO partners VALUES ('DC','CDC','C','S','','P. Francisco Semiao','BA','Public Health Analyst','Preventive Health Services Administration','District of Columbia Department of Health','','825 North Capitol Street, NE','Rm. 3168','Washington','DC','20002','(202) 442-9380','(202) 442-4824','','fsemiao@dchealth.com');
INSERT INTO partners VALUES ('DC','CDC','T','S','','','','','','','http://dchealth.dc.gov/services/administration_offices/phsa/tobacco/index.shtm','','','','','','','','','');
INSERT INTO partners VALUES ('DC','CIS','','R','','Becky Hartt Minor','','Partnership Program Manager','Massey Cancer Center','','','401 College Street','Box 37','Richmond','VA','23298-0037','(804) 828-3998','(804) 828-8453','','bhminor@hsc.vcu.edu');
INSERT INTO partners VALUES ('DE','ACS','','R','','Kathleen Wall','MSW','Regional Manager, Cancer Control Planning','','','','6 Staten Drive','','Hockessin','DE','17920','(302) 239-9769','(302) 239-9768','','kathleen.wall@cancer.org');
INSERT INTO partners VALUES ('DE','CDC','C','S','','Paul R. Silverman','DrPH','Chief, Health Monitoring and Program Consultation Section','Delaware Division of Public Health','','http://www.state.de.us/dhss/dhss.htm','PO Box 637','','Dover','DE','19904','(302) 739-3033','(302) 739-6617','','psilverman@state.de.us');
INSERT INTO partners VALUES ('DE','CDC','T','S','','','','','','','http://www.state.de.us/dhss/index.html','','','','','','','','','');
INSERT INTO partners VALUES ('DE','CDC','P','S','','Fred Breukelman','','Director of Health Education','Delaware Division of Public Health','Chronic Disease Prevention and Health Promotion','www.state.de.us/dhss/dsaapd/health.htm','Jesse Cooper Building','P.O. Box 637','Dover','DE','19903','(302) 739-4724','(302) 739-3839','','fbreukelman@state.de.us');
INSERT INTO partners VALUES ('DE','CIS','','R','','Evelyn Gonzalez','','Partnership Program Manager','Fox Chase Cancer Center','','','510 Township Line Road','','Cheltenham','PA','19012','(215) 728-3600','(215) 379-1369','','em_gonzalez@fccc.edu');
INSERT INTO partners VALUES ('FL','ACS','','R','','Michael Franklin','','Regional Manager, Cancer Control Planning','','','','3709 West Jetton Avenue','','Tampa','FL','33629-5146','(813) 253-0541, x402','(813) 254-5857','','michael.franklin@cancer.org');
INSERT INTO partners VALUES ('FL','CDC','C','S','','Deborah Glotzbach','','Program Administrator','Comprehensive Cancer Control Program','Bureau of Chronic Disease Prevention','','4052 Bald Cypress Way, BIN A-18','','Tallahassee','FL','32399-1744','(850) 245-4444, x3808','(850) 414-7497','','Deborah_Glotzbach@doh.state.fl.us');
INSERT INTO partners VALUES ('FL','CDC','T','S','','','','','','','http://www9.myflorida.com/family/tobacco/index.html','','','','','','','','','');
INSERT INTO partners VALUES ('FL','CDC','P','S','','Shannon Hughes','','Physical Activity Promotion Program','Bureau of Chronic Disease Prevention','Florida Department of Health','www.doh.state.fl.us/','4052 Bald Cypress Way, Bin A18','','Tallahassee','FL','32399-1744','850) 245-4444, x2839','(850) 414-6625','','shannon_hughes@doh.state.fl.us');
INSERT INTO partners VALUES ('FL','CIS','','R','','Islara Souto','','Partnership Program Manager','Sylvester Cancer Center','','','1150 NW 14 Street','Suite 207','Miami','FL','33136','(305) 243-4821','(305) 243-6678','','isouto@med.miami.edu');
INSERT INTO partners VALUES ('GA','ACS','','R','','Glennis Foster','MSPH','Regional Manager, Cancer Control Planning','','','','2200 Lake Boulevard','','Atlanta','GA','30319','(404) 816-7800, x321','(404) 816-9443','','glennis.foster@cancer.org');
INSERT INTO partners VALUES ('GA','ACS','','N','','Bruce Black','PhD','Director, Cancer Control Planning','','','','1599 Clifton Road','','Atlanta','GA','30339','(404) 329-7716','(404) 325-2548','','Bruce.Black@cancer.org');
INSERT INTO partners VALUES ('GA','ACS','','N','','Lori Belle-Isle','MPH','Director, Cancer Control Planning','','','','1599 Clifton Road','','Atlanta','GA','30339','(404) 929-6986','(404) 325-2548','(678) 596-6378','Lori.Belle-Isle@cancer.org');
INSERT INTO partners VALUES ('GA','ACS','','N','','Donna Mason','','Manager, Comprehensive Cancer Control Leadership Institutes','','','','1599 Clifton Road','','Atlanta','GA','30339','(404) 329-7741','(404) 325-2548','(678) 596-6315','Donna.Mason@cancer.org');
INSERT INTO partners VALUES ('GA','ACS','','N','','Todd Tyler','','Staff Assistant, Comprehensive Cancer Control Leadership Institutes','','','','1599 Clifton Road','','Atlanta','GA','30339','(404) 982-3679','(404) 325-2548','','ttyler@cancer.org');
INSERT INTO partners VALUES ('GA','CDC','C','S','','Kimberly Redding','MD, MPH','Director, Comprehensive Cancer Control','Georgia Department of Human Resources, Division of Public Health','Chronic Disease Prevention & Health Promotion Branch','http://www.ph.dhr.state.ga.us/programs/cancer/index.shtml','2 Peachtree Street, NW, Room 16-283','16th floor','Atlanta','GA','30303-3142','(404) 657-2613','(404) 657-4338','','kredding@dhr.state.ga.us');
INSERT INTO partners VALUES ('GA','CDC','T','S','','','','','','','www.ph.dhr.state.ga.us/programs/tobacco/index.shtml','','','','','','','','','');
INSERT INTO partners VALUES ('GA','CDC','P','S','','Vicki Pilgrim','','','Georgia Department of Human Resources, Division of Public Health','Health Promotion Section','www.ph.dhr.state.ga.us/','2 Peachtree Street, Room 16-462','','Atlanta','GA','30303-3142','(404) 657-6644','(404) 657-6631','','vcpilgrim@dhr.state.ga.us');
INSERT INTO partners VALUES ('GA','CIS','','R','','Betsy M. Levitas','','Partnership Program Manager','Duke Comprehensive Cancer Center','','','Erwin Square','Suite 201','Durham','NC','27705','(919) 286-5837','(919) 286-2558','','levit002@mc.duke.edu');
INSERT INTO partners VALUES ('GU','CDC','C','T','','Angelina G. Mummert','MPA','Health Services Administrator','Department of Public Health and Social Services','Bureau of Community Health Services','','PO Box 2816','','Hagatna','GUM','96932','(671) 475-0671','(671) 477-7626','','angmum@mail.gov.gu');
INSERT INTO partners VALUES ('GU','CIS','','R','','Paula Higuchi','','Partnership Program Manager','Uh-Cancer Research Center of Hawaii','Cancer Information Service - 5th Floor','','1236 Lauhala Street','','Honolulu','HI','96813','(808) 564-5921','(808) 586-3009','','paulah@crch.hawaii.edu');
INSERT INTO partners VALUES ('HI','ACS','','R','','Judy Jonas','RD, PhD','Regional Manager, Cancer Control Planning','','','','2433 Ridgepoint Drive','','Austin','TX','78754','(512) 919-1828','(512) 919-1844','','judy.jonas@cancer.org');
INSERT INTO partners VALUES ('HI','CDC','C','S','','Danette Tomiyasu','M.B.A.','Branch Chief, Chronic Disease Management and Control Branch','Hawaii State Department of Health','Kansas Department of Health and Environment','','P.O. Box 3378','','Honolulu','HI','96801-3378','(808) 586-4609','','','dwtomiya@mail.health.state.hi.us');
INSERT INTO partners VALUES ('HI','CDC','T','S','','','','','','','www.state.hi.us/doh/resource/tobacco.html','','','','','','','','','');
INSERT INTO partners VALUES ('HI','CDC','P','S','','Jodi Leslie','','Physical Activity Project Coordinator','Hawaii State Department of Health','Health Promotion and Education Branch','www.hawaii.gov/health/','1250 Punchbowl Street, Room 210','','Honolulu','HI','96813','(808) 586-4671','(808) 586-8252','','jhleslie@mail.health.state.hi.us');
INSERT INTO partners VALUES ('HI','CIS','','R','','Paula Higuchi','','Partnership Program Manager','Uh-Cancer Research Center of Hawaii','Cancer Information Service - 5th Floor','','1236 Lauhala Street','','Honolulu','HI','96813','(808) 564-5921','(808) 586-3009','','paulah@crch.hawaii.edu');
INSERT INTO partners VALUES ('IA','ACS','','R','','David Benson','','Director of Planning','American Cancer Society','Midwest Division, Inc.','','3316 W 66th Street','','Edina','MN','55435','(952) 925-6305','(952) 925-6333','','david.benson@cancer.org');
INSERT INTO partners VALUES ('IA','CDC','C','S','','Jill Myers Geadelmann','BS, RN','Chief, Cancer Prevention and Control Bureau','Iowa Department of Public Health','Division of Health Promotion, Prevention and Addictive Behaviors','http://www.idph.state.ia.us/','321 E. 12th Street','','Des Moines','IA','50319-0075','(515) 281-4909','(515) 281-4535','','Jgeadelm@idph.state.ia.us');
INSERT INTO partners VALUES ('IA','CDC','C','S','','Lorrie Graaf','RN','Public Health Advisor/CDC','Iowa Department of Public Health','Comprehensive Cancer Control','http://www.idph.state.ia.us/','321 E. 12th Street','','Des Moines','IA','50319-0075','(515) 281-7739','(515) 281-4535','','lgraaf@idph.state.ia.us');
INSERT INTO partners VALUES ('IA','CDC','T','S','','','','','','','www.idph.state.ia.us/sa/Tobacco/default.htm','','','','','','','','','');
INSERT INTO partners VALUES ('IA','CDC','P','S','','Tim Lane','','Fitness Consultant','Bureau of Health Promotion','','www.mum.edu/exss_dept/iahperd/','Lucas Building, State Capitol Complex','321 East 12th Street','Des Moines','IA','50319-0075','(515) 281-7833','(515) 281-4535','',' tlane@idph.state.ia.us');
INSERT INTO partners VALUES ('IA','CIS','','R','','Maureen Duffey','','Partnership Program Manager','North Central Cancer Information Service','Program of the National Cancer Institute','www.cis.wisc.edu','406 Science Dr., Suite 200','','Madison','WI','53711','(608) 232-5418','(608) 232-5425','','duffey@cis.wisc.edu');
INSERT INTO partners VALUES ('ID','ACS','','R','','Alacey Berumen','MNM','Regional Manager, Cancer Control Planning','','','','2255 Oneida','','Denver','CO','80224','(303) 758-2030, x446','','','alacey.berumen@cancer.org');
INSERT INTO partners VALUES ('ID','CDC','C','S','','Joanne Mitten','MHE','Chief, Bureau of Health Promotion','Idaho Department of Health and Welfare','','','PO Box 83720','','Boise','ID','83720-0036','(208) 334-5933','(208) 334-6573','','mittenj@idhw.state.id.us');
INSERT INTO partners VALUES ('ID','CDC','P','S','','Patti Moran','','','Bureau of Health Promotion','Arthritis Program','','450 West State Street, 1st Floor West','P.O. Box 83720','Boise','ID','83720-0036','(208) 332-7344','(208) 334-6573','','moranp@idhw.state.id.us');
INSERT INTO partners VALUES ('ID','CIS','','R','','Katherine J. Briant','MPH, CHES','Partnership Program Manager','Fred Hutchinson Cancer Research Center','Cancer Information Service - Pacific Region','','1100 Fairview Ave North, J2-400','PO Box 19024','Seattle','WA','98109-1024','(203) 667-1137','(206) 667-7792','','kbriant@fhcrc.org');
INSERT INTO partners VALUES ('IL','ACS','','R','','Kate Serwatka','MPH','Regional Manager, Cancer Control Planning','','','','77 E. Monroe, Suite 1300','','Chicago','IL','60603','(312) 960-2326','(312) 641-3533','','kate.serwatka@cancer.org');
INSERT INTO partners VALUES ('IL','CDC','C','S','','Margie Harris','MPH, RN, CHES','Comprehensive Cancer Control Program Coordinator','Illinois Department of Public Health','Division of Chronic Disease Prevention and Control','','535 West Jefferson, 2nd floor','','Springfield','IL','62761','(217) 785-5243','(217) 782-1235','','mharris@idph.state.il.us');
INSERT INTO partners VALUES ('IL','CDC','T','S','','','','','','','www.idph.state.il.us/TobaccoWebSite/home.htm','','','','','','','','','');
INSERT INTO partners VALUES ('IL','CDC','P','S','','Jeff Sunderlin','','Program Administrator','Office of Health Promotion','Division of Chronic Disease Prevention and Control','www.iahperd.org/','535 West Jefferson Street','','Springfield','IL','62761','(217) 782-3300','(217) 782-1235','',' jsunderl@idph.state.il.us');
INSERT INTO partners VALUES ('IL','CIS','','R','','Sharon Turner','','Partnership Program Manager','University of Kansas Medical Center','','','3901 Rainbow Boulevard','','Kansas City','KS','66160-7312','(913) 588-3723','(913) 588-3779','','sturner@kumc.edu');
INSERT INTO partners VALUES ('IN','ACS','','R','','Lesley Dufner','MS','Regional Manager, Cancer Control Planning','','','','1755 Abbey Road','','East Lansing','MI','48823','(800) 723-0360','(517) 664-1497','','lesley.duffner@cancer.org');
INSERT INTO partners VALUES ('IN','CDC','C','S','','Michael Wade','','','Comprehensive Cancer Control','Indiana State Department of Health','','2 North Meridian, 6A','','Indianapolis','IN','46204-3003','(317) 233-3819','(317) 233-7805','','mwade@isdh.state.in.us');
INSERT INTO partners VALUES ('IN','CDC','T','S','','','','','','','www.in.gov/isdh/programs/tobacco/tobacco.htm','','','','','','','','','');
INSERT INTO partners VALUES ('IN','CDC','P','S','','Casey McIntire','','','Indiana State Dept of Health','','http://www.wellnessin.org/','2 North Meridian Street','','Indianapolis','IN','46204','(317) 233-7671','(317) 234-0311','','cmcintire@isdh.state.in.us');
INSERT INTO partners VALUES ('IN','CIS','','R','','Denise Ballard','M.Ed.','Partnership Program Manager','Barbara Ann Karmanos Cancer Institute','','','110 East Warren Avenue','','Detroit','MI','48201','(313) 833-0715 ext. 7304','(313) 831-4039','','ballardd@karmanos.org');
INSERT INTO partners VALUES ('KS','ACS','','R','','VACANT','','','','','','1100 Pennsylvania Avenue','','Kansas City','MO','64105','(816) 218-7139','(816) 842-8828','','');
INSERT INTO partners VALUES ('KS','CDC','C','S','','Janet Neff','','Director, Cancer Prevention and Control Program','Kansas Department of Health and Environment','Bureau of Health Promotion','','1000 Southwest Jackson, Suite 230','','Topeka','KS','66612-1227','(785) 296-5868','(785) 296-8059','','jneff@kdhe.state.ks.us');
INSERT INTO partners VALUES ('KS','CDC','T','S','','','','','','','www.kdhe.state.ks.us/tobacco/program_info.html','','','','','','','','','');
INSERT INTO partners VALUES ('KS','CDC','P','S','','Paula Marmet','','Director, Bureau of Health Promotion','Bureau of Health Promotion','','www.kahperd.org/','Landon State Office Building','900 SW Jackson, Room 901N','Topeka','KS','66612-1290','(785) 296-8126','(785) 296-8059','','pmarmet@kdhe.state.ks.us');
INSERT INTO partners VALUES ('KS','CIS','','R','','Sharon Turner','','Partnership Program Manager','University of Kansas Medical Center','','','3901 Rainbow Boulevard','','Kansas City','KS','66160-7312','(913) 588-3723','(913) 588-3779','','sturner@kumc.edu');
INSERT INTO partners VALUES ('KY','ACS','','R','','Kristina Jennings-Wait','M.Ed.','Senior Director, Strategic Planning','American Cancer Society','','','709 Boscobel Street','','Nashville','TN','37206','(615) 254-9268','(615) 254-9267','','kristina.wait@cancer.org');
INSERT INTO partners VALUES ('KY','CDC','C','S','P','Curtis Rowe','','Manager, Chronic Disease Prevention and Control Branch','Kentucky Department for Public Health','','','Mailstop HS1C-B','275 East Main Street','Frankfort','KY','40621','(502) 564-7996','(502) 564-4467','','curtis.rowe@mail.state.ky.us');
INSERT INTO partners VALUES ('KY','CDC','C','S','S','Debra Armstrong','M.S.W., M.P.A.','Director, Community Programs Division','Kentucky Cancer Program','','','2365 Harrodsburg Road, Suite A-230','','Lexington','KY','40504-3381','(859) 219-0772, x 249','(859) 219-0548','','dka@kcp.uky.edu');
INSERT INTO partners VALUES ('KY','CDC','T','S','','','','','','','http://publichealth.state.ky.us/tobacco.htm','','','','','','','','','');
INSERT INTO partners VALUES ('KY','CIS','','R','','Tami Kelder','','Partnership Program Manager','UK Markey Cancer Center','','','2365 Harrodsburg Road','Suite A230','Lexington','KY','40504','(859) 219-9063','(859) 219-2276','','tkelder@cis.uky.edu');
INSERT INTO partners VALUES ('LA','ACS','','R','','Kristina Jennings-Wait','M.Ed.','Senior Director, Strategic Planning','American Cancer Society','','','709 Boscobel Street','','Nashville','TN','37206','(615) 254-9268','(615) 254-9267','','kristina.wait@cancer.org');
INSERT INTO partners VALUES ('LA','CDC','C','S','P','Norma W. Bordelon','LCSW','Program Manager','Community Health Promotion & Chronic Disease','Louisiana Office of Public Health - DHH','','PO Box 60630','','New Orleans','LA','70160','(504) 599-1087','(504) 568-7005','','nbordelo@dhh.state.la.us');
INSERT INTO partners VALUES ('LA','CDC','C','S','S','Donna Williams','MS, MPH','Instructor','Department of Public Health and Preventive Medicine','Cancer Control Office','','LSU Health Sciences Center','533 Bolivar Suite 4E1','New Orleans','LA','70112','(504) 568-5151','(504) 568-6888','','dwilli3@lsuhsc.edu');
INSERT INTO partners VALUES ('LA','CDC','T','S','','','','','','','www.oph.dhh.state.la.us/chronicdisease/tobaccocontrol/index.html','','','','','','','','','');
INSERT INTO partners VALUES ('LA','CDC','P','S','','Durand Macklin','','Executive Director','Governor\'s Council on Physical Fitness and Sports','','www.dhh.state.la.us/LaPHYSICAL/index.htm','1201 Capitol Access Road, 3rd Floor','','Baton Rouge','LA','70821','(225) 342-4886','','','rmacklin@dhh.state.la.us');
INSERT INTO partners VALUES ('LA','CIS','','R','','Tami Kelder','','Partnership Program Manager','UK Markey Cancer Center','','','2365 Harrodsburg Road','Suite A230','Lexington','KY','40504','(859) 219-9063','(859) 219-2276','','tkelder@cis.uky.edu');
INSERT INTO partners VALUES ('MA','ACS','','R','','Judith Meinhardt','','Cancer Control Associate','American Cancer Society','New England Division','','30 Speen Street','','Framingham','MA','01701','(508) 270-4661','(508) 270-4921','','');
INSERT INTO partners VALUES ('MA','CDC','C','S','P','Elizabeth Murphy','','Cancer Control Coordinator, Cancer Prevention and Control Initiative','Massachusetts Department of Public Health','','http://www.state.ma.us/dph/cancerct/home.htm','250 Washington Street, 4th floor','','Boston','MA','02108-4619','(617) 624-5441','(617) 624-5075','','elizabeth.murphy@state.ma.us');
INSERT INTO partners VALUES ('MA','CDC','C','S','S','Deborah Klein Walker','EdD','Associate Commissioner, Programs and Prevention','Massachusetts Department of Public Health','','http://www.state.ma.us/dph/cancerct/home.htm','250 Washington Street, 2nd floor','','Boston','MA','02108-4619','(617) 624-5222','(617) 624-5261','','Debbie.walker@state.ma.us');
INSERT INTO partners VALUES ('MA','CDC','T','S','','','','','','','www.state.ma.us/dph/mtcp/home.htm','','','','','','','','','');
INSERT INTO partners VALUES ('MA','CDC','P','S','','Sondra Nealon','','Physical Activity and Wellness Coordinator','Bureau of Family and Community Health','Division of Community Health Promotion','','250 Washington Street, 4th Floor','','Boston','MA','02108-4619','(617) 624-5479','(617) 624-5075','','Sondra.Nealon@state.ma.us');
INSERT INTO partners VALUES ('MA','CIS','','R','','Russell Leshne','','Partnership Program Manager','Dana-Farber Cancer Institute','','','44 Binney Street, Smith 233','','Boston','MA','02115','(617) 632-3155','(617) 632-2661','','russell_leshne@dfci.harvard.edu');
INSERT INTO partners VALUES ('MD','ACS','','R','','Kathleen Wall','MSW','Regional Manager, Cancer Control Planning','','','','6 Staten Drive','','Hockessin','DE','17920','(302) 239-9769','(302) 239-9768','','kathleen.wall@cancer.org');
INSERT INTO partners VALUES ('MD','CDC','C','S','','Robert Villanueva','','Executive Director, Maryland State Council on Cancer Control','Department of Health & Mental Hygiene','c/o Community & Public Health Administration','http://mdpublichealth.org/index.html','201 West Preston St., Suite 300','','Baltimore','MD','21201','(410) 767-1617','(410) 333-5218','','VillanuevaR@dhmh.state.md.us');
INSERT INTO partners VALUES ('MD','CDC','T','S','','','','','','','www.fha.state.md.us/ohpetup/tobacco/tobacco.html','','','','','','','','','');
INSERT INTO partners VALUES ('MD','CDC','P','S','','Judy Wilson','','','Maryland Department of Health and Mental Hygiene','Family Health Administration','http://www.fha.state.md.us/cpf/index.html','6 St. Paul Street, Suite 1301','','Baltimore','MD','21202','(410) 767-5046','(410) 333-8931','',' jwilson@dhmh.state.md.us');
INSERT INTO partners VALUES ('MD','CIS','','R','','Becky Hartt Minor','','Partnership Program Manager','Massey Cancer Center','','','401 College Street','Box 37','Richmond','VA','23298-0037','(804) 828-3998','(804) 828-8453','','bhminor@hsc.vcu.edu');
INSERT INTO partners VALUES ('ME','ACS','','R','','Judith Meinhardt','','Cancer Control Associate','American Cancer Society','New England Division','','30 Speen Street','','Framingham','MA','01701','(508) 270-4661','(508) 270-4921','','');
INSERT INTO partners VALUES ('ME','CDC','C','S','','Anita Teague Ruff','MPH, CHES','Public Health Advisor','Maine Bureau of Health','Maine Comprehensive Cancer Control Program','','151 Capitol Street','11 SHS','Augusta','ME','04333','(207) 287-5358','(207) 287-4100','','Anita.L.Teague@state.me.us');
INSERT INTO partners VALUES ('ME','CDC','T','S','','','','','','','www.maine.gov/dhs/bohdcfh/ptm/','','','','','','','','','');
INSERT INTO partners VALUES ('ME','CDC','P','S','','Keith Whalen','','Public Health Educator III','Maine Cardiovascular Health Program','','www.mainephysicalactivity.org/home.htm','11 State House Station','Key Bank Plaza, 4th Floor','Augusta','ME','04333-0011','(207) 287-4298','(207) 287-4631','','keith.whalen@state.me.us');
INSERT INTO partners VALUES ('ME','CIS','','R','','Russell Leshne','','Partnership Program Manager','Dana-Farber Cancer Institute','','','44 Binney Street, Smith 233','','Boston','MA','02115','(617) 632-3155','(617) 632-2661','','russell_leshne@dfci.harvard.edu');
INSERT INTO partners VALUES ('MI','ACS','','R','','Lesley Dufner','MS','Regional Manager, Cancer Control Planning','','','','1755 Abbey Road','','East Lansing','MI','48823','(800) 723-0360','(517) 664-1497','','lesley.duffner@cancer.org');
INSERT INTO partners VALUES ('MI','CDC','C','S','P','Carol Callaghan','MPH','Chief, Cancer Prevention and Control Section','Michigan Department of Community Health','Division of Chronic Disease and Injury Control','','3423 North Martin Luther King Jr. Boulevard','PO Box 30195','Lansing','MI','48909','(517) 335-9616','(517) 335-9397','','callaghanc@michigan.gov');
INSERT INTO partners VALUES ('MI','CDC','C','S','S','E. Sue Haviland','MSN','Coordinator, Comprehensive Cancer Control Program','Michigan Department of Community Health','Cancer Prevention and Control Section','http://www.michigancancer.org/frame3.htm','3423 North Martin Luther King Jr. Boulevard','PO Box 30195','Lansing','MI','48909','(517) 335-9616','(517) 335-9397','','havilande@michigan.gov');
INSERT INTO partners VALUES ('MI','CDC','T','S','','','','','','','www.michigan.gov/mdch/0,1607,7-132-2940_2955-45281--,00.html','','','','','','','','','');
INSERT INTO partners VALUES ('MI','CDC','P','S','','Lisa Grost','','Public Health Consultant','Center for Health Promotion and Chronic Disease Prevention','','www.michiganfitness.org/','3423 North Martin Luther King, Jr. Blvd.','P.O. Box 30195','Lansing','MI','48909','(517) 335-9781','(517) 335-8395','','grostl@michigan.gov');
INSERT INTO partners VALUES ('MI','CIS','','R','','Denise Ballard','M.Ed.','Partnership Program Manager','Barbara Ann Karmanos Cancer Institute','','','110 East Warren Avenue','','Detroit','MI','48201','(313) 833-0715 ext. 7304','(313) 831-4039','','ballardd@karmanos.org');
INSERT INTO partners VALUES ('MN','ACS','','R','','David Benson','','Director of Planning','American Cancer Society','Midwest Division, Inc.','','3316 W 66th Street','','Edina','MN','55435','(952) 925-6305','(952) 925-6333','','david.benson@cancer.org');
INSERT INTO partners VALUES ('MN','CDC','C','S','P','Jonathan Slater','','Chief, Cancer Control Section','Minnesota Department of Health','','','717 SE Delaware Street','','Minneapolis','MN','55440-9441','','','','Jonathan.slater@health.state.mn.us');
INSERT INTO partners VALUES ('MN','CDC','C','S','S','Jane E. Korn','MD, MPH','Director for Comprehensive Cancer Planning','Minnesota Department of Health','Director for Comprehensive Cancer Planning','','PO Box 9441','','Minneapolis','MN','55440-9441','(612) 676-5556','(612) 676-5520','','jane.korn@health.state.mn.us');
INSERT INTO partners VALUES ('MN','CDC','T','S','','','','','','','www.health.state.mn.us/divs/fh/assist/assist.html','','','','','','','','','');
INSERT INTO partners VALUES ('MN','CDC','P','S','','Christine Kimber','','Physical Activity Promotion Coordinator','Center for Health Promotion','','www.health.state.mn.us/divs/fh/chp/nutritio.htm','P.O. Box 64882','','St. Paul','MN','55164-0882','(651) 281-9875','(651) 215-8959','',' chris.kimber@health.state.mn.us');
INSERT INTO partners VALUES ('MN','CIS','','R','','Maureen Duffey','','Partnership Program Manager','North Central Cancer Information Service','Program of the National Cancer Institute','www.cis.wisc.edu','406 Science Dr., Suite 200','','Madison','WI','53711','(608) 232-5418','(608) 232-5425','','duffey@cis.wisc.edu');
INSERT INTO partners VALUES ('MO','ACS','','R','','VACANT','','','','','','1100 Pennsylvania Avenue','','Kansas City','MO','64105','(816) 218-7139','(816) 842-8828','','');
INSERT INTO partners VALUES ('MO','CDC','C','S','','Marianne Ronan','','Comprehensive Cancer Control Coordinator','Missouri Department of Health','Bureau of Cancer Control','http://www.health.state.mo.us/','PO Box 570','','Jefferson City','MO','65102-0570','(573) 522-2843','(573) 522-2899','','ronanm@dhss.state.mo.us');
INSERT INTO partners VALUES ('MO','CDC','T','S','','','','','','','www.health.state.mo.us/SmokingAndTobacco/index.html','','','','','','','','','');
INSERT INTO partners VALUES ('MO','CDC','P','S','','Dale Brigham','','Health Educator III','Division of Chronic Disease Prevention and Health Promotion','Bureau of Health Promotion',' www.mocouncilonfitness.org/','P.O. Box 570','920 Wildwood Drive','Jefferson City','MO','65102-0570','(573) 522-2888','(573) 522-2899','','brighD@dhss.state.mo.us');
INSERT INTO partners VALUES ('MO','CIS','','R','','Sharon Turner','','Partnership Program Manager','University of Kansas Medical Center','','','3901 Rainbow Boulevard','','Kansas City','KS','66160-7312','(913) 588-3723','(913) 588-3779','','sturner@kumc.edu');
INSERT INTO partners VALUES ('MS','ACS','','R','','Kristina Jennings-Wait','M.Ed.','Senior Director, Strategic Planning','American Cancer Society','','','709 Boscobel Street','','Nashville','TN','37206','(615) 254-9268','(615) 254-9267','','kristina.wait@cancer.org');
INSERT INTO partners VALUES ('MS','CDC','C','S','P','Victor Sutton','','Division Director, Chronic Disease Branch','Mississippi State Department of Health','','','2423 North State Street, A-304','PO Box 1700','Jackson','MS','39215-1700','(601) 576-7725','(601) 576-7497','','vsutton@msdh.state.ms.us');
INSERT INTO partners VALUES ('MS','CDC','C','S','S','Pat Clemen','RN, BSN, MTS','School Health Coordinator','Mississippi State Department of Health','Division of Health Promotion','','2423 North State Street, A-304','PO Box 1700','Jackson','MS','39215-1700','(601) 576-7781','(601) 576-7444','','pclemen@msdh.state.ms.us');
INSERT INTO partners VALUES ('MS','CDC','T','S','','','','','','','www.msdh.state.ms.us/msdhsite/index.cfm/12,0,94,html','','','','','','','','','');
INSERT INTO partners VALUES ('MS','CDC','P','S','','Tennile Howard','','Health Program Specialist','Division of Health Promotion','Chronic Disease','www.msdh.state.ms.us/promotion/comm.htm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO partners VALUES ('','570 E','P','J','M','39215-1700','(601) 576-7781','(601) 576-7444','','thoward@msdh.state.ms.us',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO partners VALUES ('MS','CIS','','R','','Tami Kelder','','Partnership Program Manager','UK Markey Cancer Center','','','2365 Harrodsburg Road','Suite A230','Lexington','KY','40504','(859) 219-9063','(859) 219-2276','','tkelder@cis.uky.edu');
INSERT INTO partners VALUES ('MT','ACS','','R','','Patti Migliore','MPA','Regional Manager, Cancer Control Planning','','','','PO Box 19140','2120 First Avenue North','Seattle','WA','98109','(206) 283-1152','(206) 285-3469','','patricia.migliore@cancer.org');
INSERT INTO partners VALUES ('MT','CDC','C','S','','John Schroeck','M.Ed., CHES','Section Supervisor','Montana Department of Public Health & Human Services','Chronic Disease & Health Promotion Section','','Cogswell Building, 1400 Broadway','P.O. Box 202951','Helena','MT','59620-2951','(406) 444-3934','(406) 444-7465','','jschroeck@state.mt.us');
INSERT INTO partners VALUES ('MT','CDC','T','S','','','','','','','www.dphhs.state.mt.us/hpsd/pubheal/disease/tobacco/index.htm','','','','','','','','','');
INSERT INTO partners VALUES ('MT','CDC','P','S','','Lynda Blades','','','Health Policy and Services Division','','www.dphhs.state.mt.us/hpsd/pubheal/disease/cardio/index.htm','Cogswell Building, 1400 Broadway','P.O. Box 202951','Helena','MT','59620-2951','(406) 444-7324','(406) 444-7465','','lblades@state.mt.us');
INSERT INTO partners VALUES ('MT','CIS','','R','','Barbara Baldwin','','Partnership Program Manager','Centura Health','Penrose-St. Francis Health Services','','PO Box 7021','','Colorado Springs','CO','80933','(719) 776-3150','(719) 776-3132','','barbarabaldwin@centura.org');
INSERT INTO partners VALUES ('NC','ACS','','R','','Glennis Foster','MSPH','Regional Manager, Cancer Control Planning','','','','2200 Lake Boulevard','','Atlanta','GA','30319','(404) 816-7800 x321','(404) 816-9443','','glennis.foster@cancer.org');
INSERT INTO partners VALUES ('NC','CDC','C','S','','Larry Jenkins','MPH','Branch Head, Cancer Prevention and Control Branch','Division of Public Health','','http://www.communityhealth.dhhs.state.nc.us/cancer.htm','1915 Mail Service Center','','Raleigh','NC','27699-1915','(919) 715-0123','(919) 715-3153','','larry.jenkins@ncmail.net');
INSERT INTO partners VALUES ('NC','CDC','T','S','','','','','','','www.communityhealth.dhhs.state.nc.us/tobacco.htm','','','','','','','','','');
INSERT INTO partners VALUES ('NC','CDC','P','S','','Cathy Thomas','','Unit Head, Physical Activity and Nutrition Unit','Division of Public Health','','www.communityhealth.dhhs.state.nc.us/hlthprom/ncgov.htm','1915 Mail Service Center','','Raleigh','NC','27699-1907','(919) 733-9615','(919) 715-0433','','cathy.thomas@ncmail.net');
INSERT INTO partners VALUES ('NC','CIS','','R','','Betsy M. Levitas','','Partnership Program Manager','Duke Comprehensive Cancer Center','','','Erwin Square','Suite 201','Durham','NC','27705','(919) 286-5837','(919) 286-2558','','levit002@mc.duke.edu');
INSERT INTO partners VALUES ('ND','ACS','','R','','Alacey Berumen','MNM','Regional Manager, Cancer Control Planning','','','','2255 Oneida','','Denver','CO','80224','(303) 758-2030, x446','','','alacey.berumen@cancer.org');
INSERT INTO partners VALUES ('ND','CDC','C','S','','Danielle Kenneweg','CHES','','North Dakota Department of Health','Division of Health Promotion','','600 East Boulevard Avenue, Department 301','','Bismarck','ND','58505-0200','(701) 328-2333','(701) 328-2036','','dkennewe@state.nd.us');
INSERT INTO partners VALUES ('ND','CDC','T','S','','','','','','','www.health.state.nd.us/ndhd/prevent/tobacco/','','','','','','','','','');
INSERT INTO partners VALUES ('ND','CDC','P','S','','Melissa Olson','','Coordinator, Cardiovascular Health Program','Division of Health Promotion','','www.health.state.nd.us/ndhd/prevent/hpe/','600 East Boulevard Avenue, Dept. 301','','Bismark','ND','58505-0200','(701) 328-2367','(701) 328-2036','','mjolson@state.nd.us');
INSERT INTO partners VALUES ('ND','CIS','','R','','Maureen Duffey','','Partnership Program Manager','North Central Cancer Information Service','Program of the National Cancer Institute','www.cis.wisc.edu','406 Science Dr., Suite 200','','Madison','WI','53711','(608) 232-5418','(608) 232-5425','','duffey@cis.wisc.edu');
INSERT INTO partners VALUES ('NE','ACS','','R','','VACANT','','','','','','1100 Pennsylvania Avenue','','Kansas City','MO','64105','(816) 218-7139','(816) 842-8828','','');
INSERT INTO partners VALUES ('NE','CDC','C','S','','June Ryan','','Program Director','Comprehensive Cancer Control Program','Nebraska Department of Health and Human Services','www.hhs.state.ne.us/','PO Box 95044','','Lincoln','NE','68509-5044','(402) 471-0369','(402) 471-0913','','june.ryan@hhss.state.ne.us');
INSERT INTO partners VALUES ('NE','CDC','T','S','','','','','','','www.hhs.state.ne.us/tfn/tfnindex.htm','','','','','','','','','');
INSERT INTO partners VALUES ('NE','CDC','P','S','','Jamie Hahn','','Cardiovascular Health Program','Office of Disease Prevention and Health Promotion','Nebraska Health & Human Services System','www.hhs.state.ne.us/hpe/physact.htm','301 Centennial Mall South','P.O. Box 95044','Lincoln','NE','68509-5044','(402) 471-3493','(402) 471-6446','','jamie.hahn@hhss.state.ne.us');
INSERT INTO partners VALUES ('NE','CIS','','R','','Sharon Turner','','Partnership Program Manager','University of Kansas Medical Center','','','3901 Rainbow Boulevard','','Kansas City','KS','66160-7312','(913) 588-3723','(913) 588-3779','','sturner@kumc.edu');
INSERT INTO partners VALUES ('NH','ACS','','R','','Judith Meinhardt','','Cancer Control Associate','American Cancer Society','New England Division','','30 Speen Street','','Framingham','MA','01701','(508) 270-4661','(508) 270-4921','','');
INSERT INTO partners VALUES ('NH','CDC','C','S','','Margaret Murphy','','Director, Breast and Cervical Cancer Program','New Hampshire Department of Health and Human Promotion','Office of Community and Public Health','','6 Hazen Drive','','Concord','NH','03301-6527','(603) 271-4886','(603) 271-0539','','mmurphy@dhhs.state.nh.us');
INSERT INTO partners VALUES ('NH','CDC','T','S','','','','','','','www.dhhs.state.nh.us/DHHS/TPCP/default.htm','','','','','','','','','');
INSERT INTO partners VALUES ('NH','CDC','P','S','','Patricia Baum','','Health Promotion Advisor','Division of Disease Prevention and Health Promotion','','users.rowan.edu/~cone/nhahperd.htm','6 Hazen Drive','','Concord','NH','03301-6510','(603) 271-4623','(603) 271-4160','','pbaum@dhhs.state.nh.us');
INSERT INTO partners VALUES ('NH','CIS','','R','','Russell Leshne','','Partnership Program Manager','Dana-Farber Cancer Institute','','','44 Binney Street, Smith 233','','Boston','MA','02115','(617) 632-3155','(617) 632-2661','','russell_leshne@dfci.harvard.edu');
INSERT INTO partners VALUES ('NJ','ACS','','R','','Melissa Gallison','RN, PhD','Regional Manager, Cancer Control Planning','','','','1400 Winton Road North','','Rochester','NY','14609','(585) 394-5168','(585) 394-9297','','melissa.gallison@cancer.org');
INSERT INTO partners VALUES ('NJ','CDC','C','S','','Peg Knight','RN','Executive Director, Office of Cancer Control & Prevention','New Jersey Department of Health and Senior Services','','http://www.state.nj.us/health/ccp/index.html','PO Box 369','','Trenton','NJ','08625-0369','(609) 588-7681','(609) 588-4992','','Peg.Knight@doh.state.nj.us');
INSERT INTO partners VALUES ('NJ','CDC','T','S','','','','','','','www.state.nj.us/health/as/ctcp/index.html','','','','','','','','','');
INSERT INTO partners VALUES ('NJ','CDC','P','S','','Karin Mille','','','Division of Family Health Services','','','50 East State Street, 6th Floor (CN 364)','','Trenton','NJ','08625-0364','(609) 292-1723','(609) 292-3580','','karin.mille@doh.state.nj.us');
INSERT INTO partners VALUES ('',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO partners VALUES ('',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO partners VALUES ('NJ','CIS','','R','','Evelyn Gonzalez','','Partnership Program Manager','Fox Chase Cancer Center','','','510 Township Line Road','','Cheltenham','PA','19012','(215) 728-3600','(215) 379-1369','','em_gonzalez@fccc.edu');
INSERT INTO partners VALUES ('NM','ACS','','R','','A. Veronica Perez','MPH','Regional Manager, Cancer Control Planning','','','','2929 East Thomas Road','','Phoenix','AZ','85016','(602) 224-0524','(602) 381-3096','','veronica.perez@cancer.org');
INSERT INTO partners VALUES ('NM','CDC','C','S','','Jane Cotner','MS','Program Manager, Other Chronic Diseases','New Mexico Department of Health','Chronic Disease Prevention and Control Comprehensive Cancer Programs','http://cancernm.org/','625 Silver Sothwest, Suite 325','','Albuquerque','NM','87102','(505) 841-5861','(505) 841-5865','','janec@doh.state.nm.us');
INSERT INTO partners VALUES ('NM','CDC','T','S','','','','','','','www.health.state.nm.us/TheStink/site/searchthestink.html','','','','','','','','','');
INSERT INTO partners VALUES ('NM','CDC','P','S','','Carol Marr','','','Chronic Disease Prevention and Control Bureau','','','625 Silver Ave. SW, Suite 200','P.O. Box 26110','Albuquerque','NM','87102','(505) 841-5864','(505) 841-5865','','carolma@doh.state.nm.us');
INSERT INTO partners VALUES ('NM','CIS','','R','','Barbara Baldwin','','Partnership Program Manager','Centura Health','Penrose-St. Francis Health Services','','PO Box 7021','','Colorado Springs','CO','80933','(719) 776-3150','(719) 776-3132','','barbarabaldwin@centura.org');
INSERT INTO partners VALUES ('NV','ACS','','R','','A. Veronica Perez','MPH','Regional Manager, Cancer Control Planning','','','','2929 East Thomas Road','','Phoenix','AZ','85016','(602) 224-0524','(602) 381-3096','','veronica.perez@cancer.org');
INSERT INTO partners VALUES ('NV','CDC','C','S','','Kim H. Neiman','RN, MPH, CIC','Program Manager','Bureau of Community Health','','','505 East King Street, Room 103','','Carson City','NV','89710','(775) 684-5949','(775) 684-5998','','kneiman@nvhd.state.nv.us');
INSERT INTO partners VALUES ('NV','CDC','T','S','','','','','','','http://health2k.state.nv.us/tobacco/','','','','','','','','','');
INSERT INTO partners VALUES ('NV','CIS','','R','','Katherine J. Briant','MPH, CHES','Partnership Program Manager','Fred Hutchinson Cancer Research Center','Cancer Information Service - Pacific Region','','1100 Fairview Ave North, J2-400','PO Box 19024','Seattle','WA','98109-1024','(203) 667-1137','(206) 667-7792','','kbriant@fhcrc.org');
INSERT INTO partners VALUES ('NY','ACS','','R','','Melissa Gallison','RN, PhD','Regional Manager, Cancer Control Planning','','','','1400 Winton Road North','','Rochester','NY','14609','(585) 394-5168','(585) 394-9297','','melissa.gallison@cancer.org');
INSERT INTO partners VALUES ('NY','CDC','C','S','','Mark Baptiste','PhD','Director, Division of Chronic Disease Prevention & Adult Health','New York State Department of Health','','http://www.health.state.ny.us/nysdoh/consumer/cancer/cancer.htm','Corning Tower Building/Empire State Plaza','Room 515','Albany','NY','12237','(518) 474-0512','(518) 473-2853','','msb02@health.state.ny.us');
INSERT INTO partners VALUES ('NY','CDC','T','S','','','','','','','www.health.state.ny.us/nysdoh/smoking/main.htm','','','','','','','','','');
INSERT INTO partners VALUES ('NY','CDC','P','S','','Deborah Spicer','','Phisical Activity Coordinator','Healthy Heart Program','',' www.nysphysicalactivity.org/','Riverview Center','150 Broadway, 3rd Floor West','Albany','NY','12204','(518) 474-6683','(518) 474-3356','','das09@health.state.ny.us');
INSERT INTO partners VALUES ('NY','CIS','','R','','Anita  Redrick McFarlane','','Partnership Program Manager','Memorial Sloan-Kettering Cancer Center','Cancer Information Service','','1275 York Avenue','PO Box 166','New York','NY','10021','(212) 593-8245','(212) 593-9154','','mcfarlaa@mskcc.org');
INSERT INTO partners VALUES ('OH','ACS','','R','','Melinda Hill','MS','Regional Manager, Cancer Control Planning','','','','5555 Franz Road','','Dublin','OH','43017','(614) 718-4448','(614) 718-4449','','melinda.hill@cancer.org');
INSERT INTO partners VALUES ('OH','CDC','C','S','P','Frank S. Bright','MS','Chief, Bureau of Health Promotion and Risk Reduction','Ohio Department of Health','','www.odh.state.oh.us/odh_home.html','246 North High Street','','Columbus','OH','43215','(614) 466-2144','(614) 564-2409','','fbright@gw.odh.state.oh.us');
INSERT INTO partners VALUES ('OH','CDC','C','S','S','Lois Hall','MS','','Ohio Department of Health','Cancer Program','','246 North High Street','','Columbus','OH','43216-0118','(614) 752-2464','(614) 644-7740','','lhall@gw.odh.state.oh.us');
INSERT INTO partners VALUES ('OH','CDC','T','S','','','','','','','www.odh.state.oh.us/ODHPrograms/TOB_RISK/tob_risk1.htm','','','','','','','','','');
INSERT INTO partners VALUES ('OH','CDC','P','S','','Roberto Santos','','Phisical Activity Coordinator','Bureau of Health Promotion and Risk Reduction','','www.odh.state.oh.us/ohiofit/fithome.html','246 North High Street','','Columbus','OH','43266-0588','(614) 644-7628','(614) 564-2409','',' rsantos@gw.odh.state.oh.us');
INSERT INTO partners VALUES ('OH','CIS','','R','','Denise Ballard','M.Ed.','Partnership Program Manager','Barbara Ann Karmanos Cancer Institute','','','110 East Warren Avenue','','Detroit','MI','48201','(313) 833-0715 ext. 7304','(313) 831-4039','','ballardd@karmanos.org');
INSERT INTO partners VALUES ('OK','ACS','','R','','VACANT','','','','','','1100 Pennsylvania Avenue','','Kansas City','MO','64105','(816) 218-7139','(816) 842-8828','','');
INSERT INTO partners VALUES ('OK','CDC','C','S','','Adeline Yerkes','RN, MPH','Chief,Chronic Disease Services','Oklahoma State Department of Health','','http://www.health.state.ok.us/program/cds/cancer.html','1000 North East 10th Street','','Oklahoma City','OK','73117-1299','(405) 271-4072','(405) 271-5181','','adeliney@health.state.ok.us');
INSERT INTO partners VALUES ('OK','CDC','T','S','','','','','','','www.health.state.ok.us/program/tobac/index.html','','','','','','','','','');
INSERT INTO partners VALUES ('OK','CIS','','R','','Linda Civallero','MPH, CHES','Partnership Program Manager','M.D. Anderson Cancer Center','','','1515 Holcombe Blvd., Unit 229','','Houston','TX','77030','(713) 792-3363','(713) 794-4418','','lcivallero@mdanderson.org');
INSERT INTO partners VALUES ('OR','ACS','','R','','Patti Migliore','MPA','Regional Manager, Cancer Control Planning','','','','PO Box 19140','2120 First Avenue North','Seattle','WA','98109','(206) 283-1152','(206) 285-3469','','patricia.migliore@cancer.org');
INSERT INTO partners VALUES ('OR','CDC','C','S','','Jane M. Moore','PhD, RD','Manager, Health Promotion and Chronic Disease Prevention','Oregon Health Division','','http://www.ohd.hr.state.or.us/','800 North East Oregon Street, Suite 730','','Portland','OR','97232','(503) 731-4273','(503) 731-4082','','jane.m.moore@state.or.us');
INSERT INTO partners VALUES ('OR','CDC','C','B','','Ruth Jensen','','Project Director, Northwest Tribal Cancer Control Project','Northwest Portland Area Indian Health Board','','www.npaihb.org/cancer/ntccp.html','527 Southwest Hall, Suite 300','','Portland','OR','97201','(503) 228-4185','(503) 228-8182','','rjensen@npaihb.org');
INSERT INTO partners VALUES ('OR','CDC','T','S','','','','','','','www.ohd.hr.state.or.us/tobacco/index.cfm','','','','','','','','','');
INSERT INTO partners VALUES ('OR','CDC','P','S','','Jane Moore','PhD, RN','Program Manager','Health Promotion and Chronic Disease Prevention Program','','','800 NE Oregon Street, Suite 730','','Portland','OR','97232','(503) 731-4273','(503) 731-4082','',' jane.m.moore@state.or.us');
INSERT INTO partners VALUES ('OR','CIS','','R','','Katherine J. Briant','MPH, CHES','Partnership Program Manager','Fred Hutchinson Cancer Research Center','Cancer Information Service - Pacific Region','','1100 Fairview Ave North, J2-400','PO Box 19024','Seattle','WA','98109-1024','(203) 667-1137','(206) 667-7792','','kbriant@fhcrc.org');
INSERT INTO partners VALUES ('PA','ACS','','R','','Julia Bucher','PhD','Regional Manager, Cancer Control Planning','','','http://www.pac3.org/','RR3 Box 1576','','Milton','PA','17847','(570) 742-7443','(570) 742-4328','','julia.bucher@cancer.org');
INSERT INTO partners VALUES ('PA','CDC','C','S','','Charlotte Greenawalt','MPH','Public Health Administrator, Strategic Planning','Cancer Prevention and Control Section','Pennsylvania Department of Health','http://webserver.health.state.pa.us/health/cwp/view.asp?a=174&Q=198292','Room 1011 Health & Welfare Building','PO Box 90','Harrisburg','PA','17108','(717) 787-5251','(717) 772-0608','','cgreenawal@state.pa.us');
INSERT INTO partners VALUES ('PA','CDC','T','S','','','','','','','http://webserver.health.state.pa.us/health/cwp/view.asp?a=186&Q=229582&healthPNav=|3647|#2913','','','','','','','','','');
INSERT INTO partners VALUES ('PA','CDC','P','S','','Matt Brady','','Manager, GCPFS','Bureau of Chronic Diseases and Injury Prevention','Cardiovascular Health Section','www.health.state.pa.us/php/fitness/govcoun.htm','Health and Welfare Building, Room 1011','P.O. Box 90','Harrisburg','PA','17108','(717) 787-2957','(717) 772-0608','','mattbrady@state.pa.us');
INSERT INTO partners VALUES ('PA','CIS','','R','','Evelyn Gonzalez','','Partnership Program Manager','Fox Chase Cancer Center','','','510 Township Line Road','','Cheltenham','PA','19012','(215) 728-3600','(215) 379-1369','','em_gonzalez@fccc.edu');
INSERT INTO partners VALUES ('PR','CDC','C','T','','Gabriel Diaz-Riviera','MD, MPH','Director Geriatrics and Nonintentional Injuries, Preventive Medicine Division','Department of Health of Puerto Rico','','http://users.etbyte.net/departamento/ingles/new_page_3.htm','PO Box 70184','','San Juan','PR','00936','(787) 274-6861','(787) 274-8008','','');
INSERT INTO partners VALUES ('PR','CIS','','R','','Islara Souto','','Partnership Program Manager','Sylvester Cancer Center','','','1150 NW 14 Street','Suite 207','Miami','FL','33136','(305) 243-4821','(305) 243-6678','','isouto@med.miami.edu');
INSERT INTO partners VALUES ('RI','ACS','','R','','Judith Meinhardt','','Cancer Control Associate','American Cancer Society','New England Division','','30 Speen Street','','Framingham','MA','01701','(508) 270-4661','(508) 270-4921','','');
INSERT INTO partners VALUES ('RI','CDC','C','S','','John P. Fulton','PhD','Associate Director, Division of Disease Prevention and Control','Rhode Island Department of Health','','http://www.health.state.ri.us/','3 Capitol Hill','','Providence','RI','02908-5097','(401) 222-1172','(401) 222-3551','','fult100W@aol.com');
INSERT INTO partners VALUES ('RI','CDC','T','S','','','','','','','www.healthri.org/disease/tobacco/home.htm','','','','','','','','','');
INSERT INTO partners VALUES ('RI','CDC','P','S','','Ann Thacher','','Chief','Office of Health Promotion','','http://www.health.state.ri.us/disease/hshk/home.htm','3 Capitol Hill','','Providence','RI','02906','(401) 222-7637','(401) 222-4415','','annt@doh.state.ri.us');
INSERT INTO partners VALUES ('RI','CIS','','R','','Russell Leshne','','Partnership Program Manager','Dana-Farber Cancer Institute','','','44 Binney Street, Smith 233','','Boston','MA','02115','(617) 632-3155','(617) 632-2661','','russell_leshne@dfci.harvard.edu');
INSERT INTO partners VALUES ('SC','ACS','','R','','Glennis Foster','MSPH','Regional Manager, Cancer Control Planning','','','','2200 Lake Boulevard','','Atlanta','GA','30319','(404) 816-7800 x321','(404) 816-9443','','glennis.foster@cancer.org');
INSERT INTO partners VALUES ('SC','CDC','C','S','P','Alan Waln','','Assistant Division Director, Comprehensive Cancer Prevention & Control Division','DHEC-Bureau of Chronic Disease','','http://www.scdhec.net/hs/comhlth/cancer/','1751 Calhoun Street','','Columbia','SC','29201','(803) 898-0754','(803) 253-4001','','walna@dhec.sc.gov');
INSERT INTO partners VALUES ('SC','CDC','C','S','S','Irene Prabhu Das','MPH','Division Director, Comprehensive Cancer Prevention & Control Division','DHEC-Bureau of Chronic Disease','','http://www.scdhec.net/hs/comhlth/cancer/','1800 St. Julian Place, Suite 406','','Columbia','SC','29204','(803) 545-4103','(803) 545-4445','','prabhudi@dhec.sc.gov');
INSERT INTO partners VALUES ('SC','CDC','T','S','','','','','','','www.scdhec.net/hs/comhlth/risk/tobacco_control.htm','','','','','','','','','');
INSERT INTO partners VALUES ('SC','CDC','P','S','','Teresa Hill','','Nutrition Consultant','Division of Community Health','','http://www.scahperd.org/','Mills/Jarrett Complex','Box 101106','Columbia','SC','29211','(803) 898-0431','(803) 253-4001','','hillte@dhec.sc.us');
INSERT INTO partners VALUES ('SC','CIS','','R','','Betsy M. Levitas','','Partnership Program Manager','Duke Comprehensive Cancer Center','','','Erwin Square','Suite 201','Durham','NC','27705','(919) 286-5837','(919) 286-2558','','levit002@mc.duke.edu');
INSERT INTO partners VALUES ('SD','ACS','','R','','David Benson','','Director of Planning','American Cancer Society','Midwest Division, Inc.','','3316 W 66th Street','','Edina','MN','55435','(952) 925-6305','(952) 925-6333','','david.benson@cancer.org');
INSERT INTO partners VALUES ('SD','CDC','C','S','','Norma Schmidt','MA','Section Leader for Chronic Disease Control, Project Director Breast and Cervical Cancer Control','South Dakota Department of Health','Office of Health Promotion','http://www.state.sd.us/doh/disease2/cancer.htm','615 East 4th Street','','Pierre','SD','57501','(605) 773-5728','(605) 773-5509','','norma.schmidt@state.sd.us');
INSERT INTO partners VALUES ('SD','CDC','T','S','','','','','','','www.state.sd.us/doh/Tobacco/index.htm','','','','','','','','','');
INSERT INTO partners VALUES ('SD','CDC','P','S','','Linda Ahrendt','','','South Dakota Dept of Health','','www.usd.edu/hper/sdaahperdindex.html','615 East Fourth Street','','Pierre','SD','57501-1700','(605) 773-3737','(605) 773-5942','','linda.ahrendt@state.sd.us');
INSERT INTO partners VALUES ('SD','CIS','','R','','Maureen Duffey','','Partnership Program Manager','North Central Cancer Information Service','Program of the National Cancer Institute','www.cis.wisc.edu','406 Science Dr., Suite 200','','Madison','WI','53711','(608) 232-5418','(608) 232-5425','','duffey@cis.wisc.edu');
INSERT INTO partners VALUES ('TN','ACS','','R','','Kristina Jennings-Wait','M.Ed.','Senior Director, Strategic Planning','American Cancer Society','','','709 Boscobel Street','','Nashville','TN','37206','(615) 254-9268','(615) 254-9267','','kristina.wait@cancer.org');
INSERT INTO partners VALUES ('TN','CDC','C','S','','Toni H. Bounds','PhD, MPH','Program Director','Tennessee Cancer Registry','','http://www.state.tn.us/health/','Cordell Hull Building, 6th Floor North','425 Fifth Avenue North','Nashville','TN','37247','(615) 532-7903','(615) 532-7904','','Toni.Bounds@state.tn.us');
INSERT INTO partners VALUES ('TN','CDC','T','S','','','','','','','www2.state.tn.us/health/healthpromotion/index.html#Tobacco%20Control','','','','','','','','','');
INSERT INTO partners VALUES ('TN','CIS','','R','','Tami Kelder','','Partnership Program Manager','UK Markey Cancer Center','','','2365 Harrodsburg Road','Suite A230','Lexington','KY','40504','(859) 219-9063','(859) 219-2276','','tkelder@cis.uky.edu');
INSERT INTO partners VALUES ('TX','ACS','','R','','Judy Jonas','RD, PhD','Regional Manager, Cancer Control Planning','','','','2433 Ridgepoint Drive','','Austin','TX','78754','(512) 919-1828','(512) 919-1844','','judy.jonas@cancer.org');
INSERT INTO partners VALUES ('TX','CDC','C','S','','Anne Williamson','MEd','Director, Adult Health Program','Texas Department of Health','Comprehensive Cancer Control Program','http://www.tdh.state.tx.us/tcccp/default.htm','1100 West 49th Street','','Austin','TX','78756','(512) 458-7534','(512) 458-7254','','anne.williamson@tdh.state.tx.us');
INSERT INTO partners VALUES ('TX','CDC','T','S','','','','','','','www.tdh.state.tx.us/otpc/','','','','','','','','','');
INSERT INTO partners VALUES ('TX','CDC','P','S','','Jennifer Smith','','Director, Cardiovascular Health & Wellness','Bureau of Chronic Disease','','http://www.tdh.state.tx.us/wellness/','1100 West 49th Street','','Austin','TX','78756-3199','(512) 458-7111 x2209','(512) 458-7618','',' jennifer.smith@tdh.state.tx.us');
INSERT INTO partners VALUES ('TX','CIS','','R','','Linda Civallero','MPH, CHES','Partnership Program Manager','M.D. Anderson Cancer Center','','','1515 Holcombe Blvd., Unit 229','','Houston','TX','77030','(713) 792-3363','(713) 794-4418','','lcivallero@mdanderson.org');
INSERT INTO partners VALUES ('UT','ACS','','R','','Alacey Berumen','MNM','Regional Manager, Cancer Control Planning','','','','2255 Oneida','','Denver','CO','80224','(303) 758-2030, x446','','','alacey.berumen@cancer.org');
INSERT INTO partners VALUES ('UT','CDC','C','S','','Kathryn Rowley','RT','Program Director, Utah Cancer Control Program','Utah Department of Health','','http://www.utahcancer.org/','PO Box 142107','','Salt Lake City','UT','84114-2107','(801) 538-6233','(801) 538-9495','','krowley@doh.state.ut.us');
INSERT INTO partners VALUES ('UT','CDC','T','S','','','','','','','www.tobaccofreeutah.org/','','','','','','','','','');
INSERT INTO partners VALUES ('UT','CDC','P','S','','Kathy Paras','','Coordinator, CVH Program','Bureau of Health Education','','http://www.healthyutah.org/','Box 142106','','Salt Lake City','UT','84114-2106','(801) 538-6242','(801) 538-9495','','kparas@utah.gov');
INSERT INTO partners VALUES ('UT','CIS','','R','','Barbara Baldwin','','Partnership Program Manager','Centura Health','Penrose-St. Francis Health Services','','PO Box 7021','','Colorado Springs','CO','80933','(719) 776-3150','(719) 776-3132','','barbarabaldwin@centura.org');
INSERT INTO partners VALUES ('VA','ACS','','R','','Kathleen Wall','MSW','Regional Manager, Cancer Control Planning','','','','6 Staten Drive','','Hockessin','DE','17920','(302) 239-9769','(302) 239-9768','','kathleen.wall@cancer.org');
INSERT INTO partners VALUES ('VA','CDC','C','S','','Ramona Schaeffer','','Manager, Cancer Prevention and Control Project','Virginia Department of Health','','http://www.vahealth.org/cancerprevention/index.htm','PO Box 2448, Room 106','','Richmond','VA','23218-2448','(804) 692-0201','(804) 371-6152','','rschaeffer@vdh.state.va.us');
INSERT INTO partners VALUES ('VA','CDC','T','S','','','','','','','www.vahealth.org/tobaccocontrol/index.htm','','','','','','','','','');
INSERT INTO partners VALUES ('VA','CDC','P','S','','Rod Hyner','','Project Manager','Chronic Disease Prevention and Nutrition Program','','www.vahperd.vt.edu/','1500 East Main Street, Room 132','P.O. Box 2448','Richmond','VA','23218','(804) 786-5420','(804) 371-6162','','rhyner@vdh.state.va.us');
INSERT INTO partners VALUES ('VA','CIS','','R','','Becky Hartt Minor','','Partnership Program Manager','Massey Cancer Center','','','401 College Street','Box 37','Richmond','VA','23298-0037','(804) 828-3998','(804) 828-8453','','bhminor@hsc.vcu.edu');
INSERT INTO partners VALUES ('VI','CDC','C','T','','Darlene Carty-Petty','MAE, RTT','Project Director, VIBCCEDP','Virgin Islands Department of Health','','http://www.usvi.org/health/','Knud Hansen Complex','Old Municipal Hospital; Building F','Saint Thomas','VI','00802','(340) 774-2995','(340) 776-7206','','dacpetty@viaccess.net');
INSERT INTO partners VALUES ('VI','CIS','','R','','Islara Souto','','Partnership Program Manager','Sylvester Cancer Center','','','1150 NW 14 Street','Suite 207','Miami','FL','33136','(305) 243-4821','(305) 243-6678','','isouto@med.miami.edu');
INSERT INTO partners VALUES ('VT','ACS','','R','','Judith Meinhardt','','Cancer Control Associate','American Cancer Society','New England Division','','30 Speen Street','','Framingham','MA','01701','(508) 270-4661','(508) 270-4921','','');
INSERT INTO partners VALUES ('VT','CDC','C','S','','Suzanne Kelley','MSW','Chronic Disease Program Chief','Vermont Department of Health','','http://www.healthyvermonters.info/','P.O. Box 70','','Burlington','VT','05402','(802) 863-7331','(802) 657-4208','','skelley@vdh.state.vt.us');
INSERT INTO partners VALUES ('VT','CDC','T','S','','','','','','','www.healthyvermonters.info/hi/tobacco/tobacco.shtml','','','','','','','','','');
INSERT INTO partners VALUES ('VT','CDC','P','S','','Jill Nye-McKeown','','Physical Activity Promotion Coordinator','Vermont Dept of Health','','www.state.vt.us/health/hi/councilpfs/govcpfs.htm','108 Cherry Street','P.O. Box 70','Burlington','VT','05402','(802) 651-1869','(802) 651-1634','','jnyemck@vdh.state.vt.us');
INSERT INTO partners VALUES ('VT','CIS','','R','','Russell Leshne','','Partnership Program Manager','Dana-Farber Cancer Institute','','','44 Binney Street, Smith 233','','Boston','MA','02115','(617) 632-3155','(617) 632-2661','','russell_leshne@dfci.harvard.edu');
INSERT INTO partners VALUES ('WA','ACS','','R','','Patti Migliore','MPA','Regional Manager, Cancer Control Planning','','','','PO Box 19140','2120 First Avenue North','Seattle','WA','98109','(206) 283-1152','(206) 285-3469','','patricia.migliore@cancer.org');
INSERT INTO partners VALUES ('WA','CDC','C','S','','Garry Lowry','MPH','Project Manager, Comprehensive Cancer Control','Washington State Department of Health','','http://www.doh.wa.gov/','PO Box 47855','','Olympia','WA','98504-7855','(360) 236-3677','(360) 236-3646','','garry.lowry@doh.wa.gov');
INSERT INTO partners VALUES ('WA','CDC','T','S','','','','','','','www.doh.wa.gov/Tobacco/program/program.htm','','','','','','','','','');
INSERT INTO partners VALUES ('WA','CDC','P','S','','Charlotte Claybrooke','','Health Educator','Nutrition and Physical Activity section','Washington State Dept. of Health','www.beactive.org/','PO Box 47833','','Olympia','WA','98504-7833','(360) 236-3623','(360) 753-9100','','Charlotte.Claybrooke@doh.wa.gov');
INSERT INTO partners VALUES ('WA','CIS','','R','','Katherine J. Briant','MPH, CHES','Partnership Program Manager','Fred Hutchinson Cancer Research Center','Cancer Information Service - Pacific Region','','1100 Fairview Ave North, J2-400','PO Box 19024','Seattle','WA','98109-1024','(203) 667-1137','(206) 667-7792','','kbriant@fhcrc.org');
INSERT INTO partners VALUES ('WI','ACS','','R','','David Benson','','Director of Planning','American Cancer Society','Midwest Division, Inc.','','3316 W 66th Street','','Edina','MN','55435','(952) 925-6305','(952) 925-6333','','david.benson@cancer.org');
INSERT INTO partners VALUES ('WI','CDC','C','S','','Gale Johnson','','Supervisor, Unit of Comprehensive Cancer','Wisconsin Division of Public Health','','http://www.dhfs.state.wi.us/aboutDHFS/dph/dphservs.htm','1 West Wilson Street','PO Box 2659','Madison','WI','53701-2659','(608) 261-6871','(608) 266-8925','','johnsgd@dhfs.state.wi.us');
INSERT INTO partners VALUES ('WI','CDC','T','S','','','','','','','www.dhfs.state.wi.us/health/TobaccoControl/INDEX.HTM','','','','','','','','','');
INSERT INTO partners VALUES ('WI','CDC','P','S','','Nancy Chudy','','','Division of Public Health','Chronic Disease Prevention Unit','perth.uwlax.edu/hper/wahperd/','1 West Wilson Street, Room 218','','Madison','WI','53701','(608) 266-2593','(608) 266-8925','','chudyne@dhfs.state.wi.us');
INSERT INTO partners VALUES ('WI','CIS','','R','','Maureen Duffey','','Partnership Program Manager','North Central Cancer Information Service','Program of the National Cancer Institute','www.cis.wisc.edu','406 Science Dr., Suite 200','','Madison','WI','53711','(608) 232-5418','(608) 232-5425','','duffey@cis.wisc.edu');
INSERT INTO partners VALUES ('WV','ACS','','R','','Kathleen Wall','MSW','Regional Manager, Cancer Control Planning','','','','6 Staten Drive','','Hockessin','DE','17920','(302) 239-9769','(302) 239-9768','','kathleen.wall@cancer.org');
INSERT INTO partners VALUES ('WV','CDC','C','S','','Jennifer Weiss','MS','Manager, Comprehensive Cancer Control','West Virginia Bureau for Public Health','','http://www.wvdhhr.org/bph/','350 Capitol Street, Room 319','','Charleston','WV','25301-3715','(304) 558-0644','(304) 558-1553','','jenniferweiss@wvdhhr.org');
INSERT INTO partners VALUES ('WV','CDC','T','S','','','','','','','www.wvdhhr.org/bph/oehp/tobacco/dhhrlinks.htm','','','','','','','','','');
INSERT INTO partners VALUES ('WV','CDC','P','S','','Kristy Blower','','Physical Activity Coordinator','OEHP - Division of Health Promotion','Cardiovascular Health Program','http://www.wvdhhr.org/bph/oehp/hp/card/','350 Capitol Street, Room 319','','Charleston','WV','25301-3715','(304) 558-1715','(304) 558-1553','','kristyblower@wvdhhr.org');
INSERT INTO partners VALUES ('WV','CIS','','R','','Becky Hartt Minor','','Partnership Program Manager','Massey Cancer Center','','','401 College Street','Box 37','Richmond','VA','23298-0037','(804) 828-3998','(804) 828-8453','','bhminor@hsc.vcu.edu');
INSERT INTO partners VALUES ('WY','ACS','','R','','Alacey Berumen','MNM','Regional Manager, Cancer Control Planning','','','','2255 Oneida','','Denver','CO','80224','(303) 758-2030, x446','','','alacey.berumen@cancer.org');
INSERT INTO partners VALUES ('WY','CDC','C','S','','Chris Thomas','MS, CHES','Chronic Disease Section','Preventive Health and Safety Division','Wyoming Department of Health','http://wdhfs.state.wy.us/WDH/','6101 Yellowstone Road, Suite 259A','','Cheyenne','WY','82001','(307) 777-8609','(307) 777-8604','','cthoma3@state.wy.us');
INSERT INTO partners VALUES ('WY','CDC','T','S','','Janet Jares','','Tobacco Prevention Program Manager','Substance Abuse Division','Wyoming Department of Health','http://sad.state.wy.us/tobacco','2424 Pioneer Avenue, Suite 306','','Cheyenne','WY','82002','(307) 777-5454 or (800) 535-4006','(307) 777-7006','','');
INSERT INTO partners VALUES ('WY','CDC','P','S','','Star Heintz','MS, RD','Cardiovascular Disease Program Coordinator','Preventive Health and Safety Division','Wyoming Department of Health','http://wdh.state.wy.us/cvd/','6101 Yellowstone Road, Suite 259A','','Cheyenne','WY','82002','(307) 777-3732','(307) 777-8604','','sheint@state.wy.us');
INSERT INTO partners VALUES ('WY','CIS','','R','','Barbara Baldwin','','Partnership Program Manager','Centura Health','Penrose-St. Francis Health Services','','PO Box 7021','','Colorado Springs','CO','80933','(719) 776-3150','(719) 776-3132','','barbarabaldwin@centura.org');

#
# Table structure for table 'states'
#
CREATE TABLE states (
  state char(2) DEFAULT '' NOT NULL,
  name varchar(32) DEFAULT '' NOT NULL,
  type char(1),
  PRIMARY KEY (state)
);

#
# Dumping data for table 'states'
#

INSERT INTO states VALUES ('AL','Alabama','S');
INSERT INTO states VALUES ('AK','Alaska','S');
INSERT INTO states VALUES ('AZ','Arizona','S');
INSERT INTO states VALUES ('AR','Arkansas','S');
INSERT INTO states VALUES ('CA','California','S');
INSERT INTO states VALUES ('CO','Colorado','S');
INSERT INTO states VALUES ('CT','Connecticut','S');
INSERT INTO states VALUES ('DE','Delaware','S');
INSERT INTO states VALUES ('DC','District of Columbia','S');
INSERT INTO states VALUES ('FL','Florida','S');
INSERT INTO states VALUES ('GA','Georgia','S');
INSERT INTO states VALUES ('HI','Hawaii','S');
INSERT INTO states VALUES ('ID','Idaho','S');
INSERT INTO states VALUES ('IL','Illinois','S');
INSERT INTO states VALUES ('IN','Indiana','S');
INSERT INTO states VALUES ('IA','Iowa','S');
INSERT INTO states VALUES ('KS','Kansas','S');
INSERT INTO states VALUES ('KY','Kentucky','S');
INSERT INTO states VALUES ('LA','Louisiana','S');
INSERT INTO states VALUES ('ME','Maine','S');
INSERT INTO states VALUES ('MD','Maryland','S');
INSERT INTO states VALUES ('MA','Massachusetts','S');
INSERT INTO states VALUES ('MI','Michigan','S');
INSERT INTO states VALUES ('MN','Minnesota','S');
INSERT INTO states VALUES ('MS','Mississippi','S');
INSERT INTO states VALUES ('MO','Missouri','S');
INSERT INTO states VALUES ('MT','Montana','S');
INSERT INTO states VALUES ('NE','Nebraska','S');
INSERT INTO states VALUES ('NV','Nevada','S');
INSERT INTO states VALUES ('NH','New Hampshire','S');
INSERT INTO states VALUES ('NJ','New Jersey','S');
INSERT INTO states VALUES ('NM','New Mexico','S');
INSERT INTO states VALUES ('NY','New York','S');
INSERT INTO states VALUES ('NC','North Carolina','S');
INSERT INTO states VALUES ('ND','North Dakota','S');
INSERT INTO states VALUES ('OH','Ohio','S');
INSERT INTO states VALUES ('OK','Oklahoma','S');
INSERT INTO states VALUES ('OR','Oregon','S');
INSERT INTO states VALUES ('PA','Pennsylvania','S');
INSERT INTO states VALUES ('RI','Rhode Island','S');
INSERT INTO states VALUES ('SC','South Carolina','S');
INSERT INTO states VALUES ('SD','South Dakota','S');
INSERT INTO states VALUES ('TN','Tennessee','S');
INSERT INTO states VALUES ('TX','Texas','S');
INSERT INTO states VALUES ('UT','Utah','S');
INSERT INTO states VALUES ('VT','Vermont','S');
INSERT INTO states VALUES ('VA','Virginia','S');
INSERT INTO states VALUES ('WA','Washington','S');
INSERT INTO states VALUES ('WV','West Virginia','S');
INSERT INTO states VALUES ('WI','Wisconsin','S');
INSERT INTO states VALUES ('WY','Wyoming','S');
INSERT INTO states VALUES ('AS','American Samoa','T');
INSERT INTO states VALUES ('GU','Guam','T');
INSERT INTO states VALUES ('PR','Puerto Rico','T');
INSERT INTO states VALUES ('VI','Virgin Islands','T');

