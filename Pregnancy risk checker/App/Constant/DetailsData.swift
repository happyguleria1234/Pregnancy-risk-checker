//
//  DetailsData.swift
//  Pregnancy risk checker
//
//  Created by Apple on 18/02/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import Foundation


//    :-> Delivery First

var spontaneousVaginalBirthHeadingArrayBlack = ["Headline"]
var spontaneousVaginalBirthDetailsArrayBlack = ["Rates of normal vaginal delivery, interventions and complications differ in different countries and even in different hospitals in the same country. Our ultimate goal is to collate all this information so that you will have a live update of these figures wherever you are. Please visit our fund page to see how you can help us achieve this goal.","Headline"]
var spontaneousVaginalBirthImagesArrayBlack = [""]

var spontaneousVaginalBirthHeadingArrayGreen = ["Chance of a normal vaginal delivery","","","","","","",""]
var spontaneousVaginalBirthDetailsArrayGreen = ["This ranges from 58% to 88.7% on avearge across different units and settings",
                                                "Depends on where you deliver, if you have had a vaginal delivery before and other health problems affecting you or your baby. This rate changes slightly from month to month, in different hospitals and in different countries",
                                                "This is my first baby and I want to deliver at home, what is my chance of a normal vaginal delivery 78.6%",
                                                "I've had a normal vaginal delivery before and I want to deliver at home, what is my chance of a normal delivery again 98%",
                                                "This is my first baby and I want to deliver in a  Midwife led unit, what is my chance of a normal vaginal delivery 75.8 to 82.3%",
                                                "I have had a vaginal delivery before and I want to do deliver in a Midwife led unit, what is my chance of a normal vaginal delivery 96.3% to 97.8%",
                                                "This is my first baby and I have chosen to deliver at a Hospital (Obstetric unit with doctors present) \nwhat is my chance of a normal vaginal delivery : 61.3%",
                                                "I have had a vaginal delivery before and I have chosen to deliver at a Hospital (Obstetric unit with doctors present) \nwhat is my chance of a normal vaginal delivery : 88.7%","","","","","","",""]
var spontaneousVaginalBirthImagesArrayGreen = ["","","","","","","",""]

var spontaneousVaginalBirthHeadingArrayOrange = ["Chance of a normal vaginal delivery",
                                                 "Chance of an assisted birth with forceps or vacuum cup",
                                                 "Chance of a caesarean section",
                                                 "Chance of excess bleeding",
                                                 "Chance of a blood transfusion",
                                                 "Chance of a major vaginal tear (3rd to 4th degree tear)",
                                                 "Chance of an episiotomy ",
                                                 "Chance of an epidural and or spinal anaesthesia"]
var spontaneousVaginalBirthDetailsArrayOrange = ["This is my first baby and I have chosen to deliver at a Hospital (Obstetric unit with doctors present)\n\nwhat is my chance of a normal vaginal delivery : 61.3%","First baby > Home birth :  12.5%\nHad a vaginal birth before > Home birth :  0.9%\nFirst baby > Midwife led unit  :  10.7% to 16.3%\nHad a vaginal birth before > Midwife led unit: 1.1% to 2.4%\nFirst baby > Hospital unit  :  13% to 22%\nHad a vaginal birth before > Hospital unit: 5.8%\n\nBear in mind that if you need assisted birth whilst delivering at home or midwife led unit, you will need transfer to a Hospital (Obstetric unit where doctors are available)","First baby > Home birth :  8.5%\nHad a vaginal birth before > Home birth :  0.6%\nFirst baby > Midwife led unit  :  6.6% to 7.7%\nHad a vaginal birth before > Midwife led unit: 0.7% to 1%\nFirst baby > Hospital unit  :  16%\nHad a vaginal birth before > Hospital unit : 5.3%\n\nBear in mind that if you need caesarean whilst delivering at home or midwife led unit, you will need transfer to a Hospital (Obstetric unit where doctors are available)","About 18% of all births involve blood loss more than 500ml\nUp to 5% of births lead to blood loss of more than 1500ml","First baby > Home birth :  1.3%\nHad a vaginal birth before > Home birth :  0.4%\nFirst baby > Midwife led unit  :  0.8% to 1.3%\nHad a vaginal birth before > Midwife led unit: 0.3%  to 0.6%\nFirst baby > Hospital unit  :  1.6%\nHad a vaginal birth before > Hospital unit : 0.7%\n\nBear in mind that if you need blood transfusion whilst delivering at home or midwife led unit, you will need transfer to a Hospital (Obstetric unit where doctors are available)","First baby > Home birth :  4.3% to 6%\nHad a vaginal birth before > Home birth :  1%  to 2%\nFirst baby > Midwife led unit  :  4% to 6%\nHad a vaginal birth before > Midwife led unit: 0.9%  to 2%\nFirst baby > Hospital unit  :  4.5% to 6%\nHad a vaginal birth before > Hospital unit : 1.6%  to  2%\n\nAbout 85% of mothers will have some form of a tear after birth and on average about 60% will need some stitches. Most of these are small tears (1st to 2nd degree tears) that may need just a couple of stitches.\n\nBear in mind that if you have a major tear whilst delivering at home or midwife led unit, you may need transfer to a Hospital (Obstetric unit where doctors are available)","(Vaginal cut to make more space and reduce risk of a major tear)\nFirst baby > Home birth :  16%\nHad a vaginal birth before > Home birth :  1.5%\nFirst baby > Midwife led unit  :  16% to 22.1%\nHad a vaginal birth before > Midwife led unit: 2.3%  to 7.5%\nFirst baby > Hospital unit  :  29.3%\nHad a vaginal birth before > Hospital unit : 5.6%  to  7.5%","First baby > Home birth :  22.7%\nHad a vaginal birth before > Home birth :  2.9%\nFirst baby > Midwife led unit  :  18.9% to 24.4%\nHad a vaginal birth before > Midwife led unit: 3.5%  to 5.9%\nFirst baby > Hospital unit  :  42.5%\nHad a vaginal birth before > Hospital unit : 16.8%\n\nBear in mind that if you request an epidural whilst delivering at home or midwife led unit, you may need transfer to a Hospital (Obstetric unit where doctors are available)."]
var spontaneousVaginalBirthImagesArrayOrange = ["","","","","","","","ic_delivery_spontaneous_orange"]


var spontaneousVaginalBirthHeadingArrayRed = ["What is the chance my baby will need admission to neonatal unit soon after birth",
                                              "Chance of other complications"]
var spontaneousVaginalBirthDetailsArrayRede = ["First baby > Home birth :  2.85%\nHad a vaginal birth before > Home birth :  1.31%\nFirst baby > Midwife led unit  :  2.16% to 2.6%\nHad a vaginal birth before > Midwife led unit: 1.2%  to 1.3%\nFirst baby > Hospital unit  :  3.6%\nHad a vaginal birth before > Hospital unit : 1.9%","See other pages in our app that goes into more detail about each complication\n\nCord prolapse : 0.1% to 0.6%\nShoulder dystocia: 0.7% (1.4 in 200)\nBreech babies: 3% to 4% of babies are breech by 37 weeks\nUnexpected breech during labour: About 0.7% (1.4 in 200)\nDeath of mother: 0.009% ( 9 in 100,000)\nDeath of baby: 0.1% (1 in 1000)"]
var spontaneousVaginalBirthImagesArrayRed = ["",""]

var spontaneousVaginalBirthSourceHeadingData = ["Sources"]
var spontaneousVaginalBirthSourceData = ["Perinatal and maternal outcomes by planned place of birth for healthy women with low risk pregnancies: the Birthplace in England national prospective cohort study BMJ 2011\n\nPerinatal and maternal outcomes by planned place of birth for healthy women with low risk pregnancies: the Birthplace in England national prospective cohort study BMJ 2011\n\nData supplement. Appendix 6. Birthplace in England national prospective cohort study. BMJ. 2011\n\nTies Boerma, Carine Ronsmans, Dessalegn Y Melesse, Aluisio J D Barros, Fernando C Barros, Liang Juan, Ann-Beth Moller, Lale Say, Ahmad Reza Hosseinpoor, Mu Yi, Dácio de Lyra Rabello Neto, Marleen Temmerman, Global epidemiology of use of and disparities in caesarean sections, The Lancet, Volume 392, Issue 10155, 2018, Pages 1341-1348,\n\nMaternity Services Monthly Statistics March 2018, NHS Digital Services, Maternity Services Data Set\n\nRoyal college of Obstetrics and Gynaecology. Assisted vaginal birth. 2020\n\nPatricia C. Devine, Obstetric Hemorrhage, Seminars in Perinatology, Volume 33, Issue 2, 2009, Pages 76-81,\n\nMBRRACE-UK: Mothers and Babies: Reducing Risk through Audits and Confidential Enquiries across the UK, 2019\n\nPrendiville  WJP, Elbourne  D, McDonald  SJ. Active versus expectant management in the third stage of labour. Cochrane Database of Systematic Reviews 2000, Issue 3.\n\nRoyal College of Obstetrics and Gynaecology. Prevention and Management of Postpartum Haemorrhage Guideline 52 2016\n\nWastlund D, Moraitis AA, Dacey A, Sovio U, Wilson ECF, et al. (2019) Screening for breech presentation using universal late-pregnancy ultrasonography: A prospective cohort study and cost effectiveness analysis. PLOS Medicine 16(4)\n\nWalker, S. and Cochrane, V. (2015). Unexpected breech: what can midwives do?. The Practising Midwife, 18(10), pp. 26-29\n\nImpey LWM, Murphy DJ, Grifﬁths M, Penna LK on behalf of the Royal College of Obstetriciansand Gynaecologists. Management of Breech Presentation. BJOG 2017\n\n"]

var colorType = ["Black","Green","Orange","Red","White"]


var deliveryFirstBlack = (["title" : "", "des" : "" , "image" : ""])


var inducedVaginalBirthBlackTitle = ["Headline", "", ""]
var inducedVaginalBirthBlackDetails = ["Rates of normal vaginal delivery, interventions and complications differ in different countries and even in different hospitals in the same country. Our ultimate goal is to collate all this information so that you will have a live update of these figures wherever you are. Please visit our fund page to see how you can help us achieve this goal. ",
                                       "",
                                       "Medications used to induce labour:\nDinoprostone (Propess®)\nProstin\nMisoprostol\nOther ways labour can be induced without medication but not entirely discussed here: Membrane sweep, Special catheter, osmotic dilator (Dilapan) and planned breaking of membrane"]
var inducedVaginalBirthBlackImages = ["ic_delivery_induced_vaginal","ic_delivery_incuced_vaginal_2",""]


var inducedVaginalBirthGreenTitle = [ "Will induction affect my chance of a vaginal birth",
                                      "So according to the latest research on women who have been induced, what are the chances of normal delivery, caesarean section and assisted birth (Vacuum cup or forceps)",
                                      "Does induction makes a difference for my baby",
                                      "",
                                      "",
                                      "What about membrane sweep, can this induce my labour"]
var inducedVaginalBirthGreenDetails = ["No, it will not.\nRecent data have concluded that the rates of forceps, vacuum cup and casearean section is similar whether you go into natural labour or you are induced.\n\nSource: Induction of labour at or beyond 37 weeks' gestation. Cochrane Database of Systematic Reviews 2020, Issue 7",
                                       "Mothers induced : vaginal birth rate : 69.5%\nMothers not induced : vaginal birth rate : 67.8%\n\nBear in mind that mothers who have had a vaginal birth before have a higher chance of a normal vaginal birth whilst first time mothers may have slightly lower rate. ",
                                       "Yes\nBased on recent data, induction reduced the risk of stillbirth.",
                                       "Here, we are simply providing current data. But the decision to accept or decline induction is entirely up to you, a mother, your instincts and what you feel is best for you and your baby",
                                       "Source: Induction of labour at or beyond 37 weeks' gestation. Cochrane Database of Systematic Reviews 2020, Issue 7",
                                       "Yes. 72% to 79% chance of going into labour within 7 days.\n\nBut labour occurred up to 7 days after the sweep and the nature of a sweep means your cervix has to be a bit open and 'favourable.' Therefore not all women will be able to have a successful membrane sweep. This is usually more successful for mothers who have had vaginal birth before.\n\nSource: Ugezu, C.H., Corcoran, P., Dunn, E.A. et al. Does membrane sweep work? Assessing obstetric outcomes and patient perception of cervical membrane sweeping at term in an Irish obstetric population: a prospective multi-centre cohort study. Ir J Med Sci 189, 969–977 (2020)\n\nFinucane  EM, Murphy  DJ, Biesty  LM, Gyte  GML, Cotter  AM, Ryan  EM, Boulvain  M, Devane  D. Membrane sweeping for induction of labour. Cochrane Database of Systematic Reviews 2020, Issue 2\n\nWill induction increase my risk of labour complications?\nNo\nSimilar rates of vaginal tears, length of labour, Hospital stay, excess bleeding, epidural rates and overall satisfaction"]
var inducedVaginalBirthGreenImages = ["","","","","","ic_delivery_sweep"]


var inducedVaginalBirthOrangeTitle = [ "Why will I be offered induction of labour",
                                       "So according to the latest research on women who have been induced, what are the chances of normal delivery, caesarean section and assisted birth (Vacuum cup or forceps)",
                                       "Does induction makes a difference for my baby"]
var inducedVaginalBirthOrangeDetails = ["Mainly to reduce the risk of stillbirth (Death of a baby before or during labour)\n\nThe current stillbirth rate in UK is 3.8 out of 1000 babies born overall. UK stillbirth rate between 37 weeks and 42 weeks is 1.4 out of 1000 babies born.\n\nDeveloped countries stillbirth rate is 3.4 out of 1000 babies overall. Worldwide stillbirth rate is 18.4 out of 1000 babies overall. See the 'Previous stillbirth page' in our app which goes into more detail.\n\nThere are other reasons why you may be offered an induction. Your midwife or doctor should inform and explain the reason.",
                                        "Mothers induced : assisted birth rate : 14.1%\n\nMothers not induced : assisted birth rate : 13.6%\n\nMothers induced : caesarean rate : 16.4%\n\nMothers not induced : caesarean birth rate : 18.6%\n\nBear in mind that these rates shows the average but the chances of how a mother is likely to deliver is dependent on many factors.",
                                        "Mothers induced : stillbirth rate : 0.02% (1 out of 5000 babies born)\n\nMothers not induced : stillbirth rate : 0.17% (8.5 out of 5000 babies born)"]
var inducedVaginalBirthOrangeImages = ["","",""]


var inducedVaginalBirthRedTitle = ["",""]
var inducedVaginalBirthRedDetails = ["",""]
var inducedVaginalBirthRedImages = ["",""]





var forcepsDeliveryForBlackTitle = ["Headline"]
var forcepsDeliveryForBlackDetails = ["Rates of normal vaginal delivery, interventions and complications differ in different countries and even in different hospitals in the same country. Our ultimate goal is to collate all this information so that you will have a live update of these figures wherever you are. Please visit our fund page to see how you can help us achieve this goal. "]
var forcepsDeliveryForBlackImages = ["ic_forcep_headline"]

var forcepsDeliveryForGreenTitle = ["Chance of a normal vaginal delivery for my second baby",
                                    "Risks for baby:"]
var forcepsDeliveryForGreenDetails = ["90% or more. First time mothers who have assisted delivery for their first baby are likely to have 90% or more chance of a normal delivery for their second baby",
                                      "Small bruises and marks on baby's head and face that completely resolves in a few days : 10%"]
var forcepsDeliveryForGreenImages = ["",""]


var forcepsDeliveryForOrangeTitle = [ "Chance of an assisted (Forceps and vacuum cup) vaginal delivery",
                                      "Chance of an assisted birth with forceps or vacuum cup",
                                      "Chance of a forceps delivery",
                                      "Risks for Mother:",
                                      "Risks for baby:"]
var forcepsDeliveryForOrangeDetails = ["This ranges from 13% to 15% on average across different units and settings\n\nDepends on where you deliver, if you have had a vaginal delivery before and other health problems affecting you or your baby. This rate changes slightly from month to month, in different hospitals and in different countries",
                                       "First baby > Home birth :  12.5%\nHad a vaginal birth before > Home birth :  0.9%\nFirst baby > Midwife led unit  :  10.7% to 16.3%\nHad a vaginal birth before > Midwife led unit: 1.1% to 2.4%\nFirst baby > Hospital unit  :  13% to 22%\nHad a vaginal birth before > Hospital unit: 5.8%\n\nBear in mind that if you need assisted birth whilst delivering at home or midwife led unit, you will need transfer to a Hospital (Obstetric unit where doctors are available)",
                                       "First baby > Home birth :  6.6%\nHad a vaginal birth before > Home birth :  0.4%\nFirst baby > Midwife led unit  :  5.4% to 8.2%\nHad a vaginal birth before > Midwife led unit: 0.7% to 1.1%\nFirst baby > Hospital unit  :  10.7%\nHad a vaginal birth before > Hospital unit: 2.1%",
                                       "Significant other vaginal or vulval tears : 20%\n\nExcess bleeding in labour : 10% to 40%\n\nBladder and bowel problems : 1% to 10% \n\nThis usually resolves after some weeks but depends on severity of any trauma or tears",
                                       "Retinal haemorrhage : tiny bleed at the back of the eyes that resolve after 4 weeks and is unlikely to cause any issues : 17% to 38%\n\nCephalohaematoma : Small bleeding just underneath the scalp : 1% to 12%\n\nThis is above the skull bones and goes away after few days and does not affect the brain\n\nJaundice soon after birth: 5% to 15%\nThis is successfully treated with light therapy"]
var forcepsDeliveryForOrangeImages = ["","","","",""]


var forcepsDeliveryForRedTitle = [ "Risks of forceps delivery",
                                   "Risks for Mother:",
                                   "Risks for baby:"]
var forcepsDeliveryForredDetails = [ "Unsuccessful at deliverying baby : 9.3% chance\n\nEither a caesarean section or vacuum cup delivery would be next options. Chance of a caesarean section due to unsuccessful forceps: 4.5%\n\n",
                                     "Episiotomy : 90% or more\n\n3rd or 4th degree tear : 8% to 12%",
                                     "Subgaleal haematoma : bleeding just above the skull bones but below a cephalohaematoma.\n\nThis is more serious as it can lead to much more blood accumulating under the scalp and above the skull bones : 0.3% to 0.6% chance (3 to 6 out of 1000 babies born)\n\nBrain haemorrhage : bleeding inside the skull or brain : 0.05% to 0.15% (5 to 15 out of 10,000 babies born)\n\nFacial nerve palsy : rare. About 0.01% to 0.1%. Mostly resolves over few months\n\nSkull fracture : rare. 0.01% or less\n\nNeck spine injury : rare. 0.01% or less. This applies to a particular type of forceps that is used to turn or rotate a baby\n\nBaby dying : Very rare. Less than 0.01%"]
var forcepsDeliveryForRedImages = ["","",""]
