//
//  DetailsData.swift
//  Pregnancy risk checker
//
//  Created by Apple on 18/02/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import Foundation


struct MainData {
    
    var dataforBlack : [AllDataDetailsForBlack]
    var dataforGreen : [AllDataDetailsForGreen]
    var dataforOrange : [AllDataDetailsForOrange]
    var dataforRed : [AllDataDetailsForRed]
    var dataforWhite : [AllDataDetailsForWhite]
    var type:[String]?
    
    init(dataforBlack : [AllDataDetailsForBlack],dataforGreen : [AllDataDetailsForGreen],dataforOrange : [AllDataDetailsForOrange],dataforRed : [AllDataDetailsForRed],dataforWhite : [AllDataDetailsForWhite],type:[String]) {
        
        self.dataforBlack = dataforBlack
        self.dataforGreen = dataforGreen
        self.dataforOrange = dataforOrange
        self.dataforRed = dataforRed
        self.dataforWhite = dataforWhite
        self.type = type
    }
}

struct AllDataDetailsForBlack {
    var headline : [String]
    var images : [String]
    var description : [String]
    var source : [String]
    var sourceDetails : [String]
    var type : String
    
    init(headline : [String],images : [String],description : [String],source : [String ] , sourceDetails : [String] ,type : String) {
        self.headline = headline
        self.images = images
        self.description = description
        self.source = source
        self.sourceDetails = sourceDetails
        self.type = type
    }
}

struct AllDataDetailsForGreen {
    var headline : [String]
    var images : [String]
    var description : [String]
    var source : [String]
    var sourceDetails : [String]
    var type : String
    
    init(headline : [String],images : [String],description : [String],source : [String ] , sourceDetails : [String] ,type : String) {
        self.headline = headline
        self.images = images
        self.description = description
        self.source = source
        self.sourceDetails = sourceDetails
        self.type = type
    }
}

struct AllDataDetailsForOrange {
    var headline : [String]
    var images : [String]
    var description : [String]
    var source : [String]
    var sourceDetails : [String]
    var type : String
    
    init(headline : [String],images : [String],description : [String],source : [String ] , sourceDetails : [String] ,type : String) {
        self.headline = headline
        self.images = images
        self.description = description
        self.source = source
        self.sourceDetails = sourceDetails
        self.type = type
    }
}


struct AllDataDetailsForRed {
    var headline : [String]
    var images : [String]
    var description : [String]
    var source : [String]
    var sourceDetails : [String]
    var type : String
    
    init(headline : [String],images : [String],description : [String],source : [String ] , sourceDetails : [String] ,type : String) {
        self.headline = headline
        self.images = images
        self.description = description
        self.source = source
        self.sourceDetails = sourceDetails
        self.type = type
    }
}


struct AllDataDetailsForWhite {
    var headline : [String]
    var images : [String]
    var description : [String]
    var source : [String]
    var sourceDetails : [String]
    var type : String
    
    init(headline : [String],images : [String],description : [String],source : [String ] , sourceDetails : [String] ,type : String) {
        self.headline = headline
        self.images = images
        self.description = description
        self.source = source
        self.sourceDetails = sourceDetails
        self.type = type
    }
}

var spontaneousVaginalBirthHeadingArrayBlack = ["Headline",""]
var spontaneousVaginalBirthDetailsArrayBlack = ["Rates of normal vaginal delivery, interventions and complications differ in different countries and even in different hospitals in the same country. Our ultimate goal is to collate all this information so that you will have a live update of these figures wherever you are. Please visit our fund page to see how you can help us achieve this goal.",""]
var spontaneousVaginalBirthImagesArrayBlack = ["stemetil","stemetil"]
//var spontaneousVaginalBirthImagesArrayType = [""]


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
var spontaneousVaginalBirthImagesArrayOrange = ["","","","","","","",""]


var spontaneousVaginalBirthHeadingArrayRed = ["What is the chance my baby will need admission to neonatal unit soon after birth",
                                              "Chance of other complications"]
var spontaneousVaginalBirthDetailsArrayRede = ["First baby > Home birth :  2.85%\nHad a vaginal birth before > Home birth :  1.31%\nFirst baby > Midwife led unit  :  2.16% to 2.6%\nHad a vaginal birth before > Midwife led unit: 1.2%  to 1.3%\nFirst baby > Hospital unit  :  3.6%\nHad a vaginal birth before > Hospital unit : 1.9%","See other pages in our app that goes into more detail about each complication\n\nCord prolapse : 0.1% to 0.6%\nShoulder dystocia: 0.7% (1.4 in 200)\nBreech babies: 3% to 4% of babies are breech by 37 weeks\nUnexpected breech during labour: About 0.7% (1.4 in 200)\nDeath of mother: 0.009% ( 9 in 100,000)\nDeath of baby: 0.1% (1 in 1000)"]
var spontaneousVaginalBirthImagesArrayRed = ["",""]

var pontaneousVaginalBirthSourceHeadingData = ["Sources"]
var pontaneousVaginalBirthSourceData = ["Perinatal and maternal outcomes by planned place of birth for healthy women with low risk pregnancies: the Birthplace in England national prospective cohort study BMJ 2011\n\nPerinatal and maternal outcomes by planned place of birth for healthy women with low risk pregnancies: the Birthplace in England national prospective cohort study BMJ 2011\n\nData supplement. Appendix 6. Birthplace in England national prospective cohort study. BMJ. 2011\n\nTies Boerma, Carine Ronsmans, Dessalegn Y Melesse, Aluisio J D Barros, Fernando C Barros, Liang Juan, Ann-Beth Moller, Lale Say, Ahmad Reza Hosseinpoor, Mu Yi, Dácio de Lyra Rabello Neto, Marleen Temmerman, Global epidemiology of use of and disparities in caesarean sections, The Lancet, Volume 392, Issue 10155, 2018, Pages 1341-1348,\n\nMaternity Services Monthly Statistics March 2018, NHS Digital Services, Maternity Services Data Set\n\nRoyal college of Obstetrics and Gynaecology. Assisted vaginal birth. 2020\n\nPatricia C. Devine, Obstetric Hemorrhage, Seminars in Perinatology, Volume 33, Issue 2, 2009, Pages 76-81,\n\nMBRRACE-UK: Mothers and Babies: Reducing Risk through Audits and Confidential Enquiries across the UK, 2019\n\nPrendiville  WJP, Elbourne  D, McDonald  SJ. Active versus expectant management in the third stage of labour. Cochrane Database of Systematic Reviews 2000, Issue 3.\n\nRoyal College of Obstetrics and Gynaecology. Prevention and Management of Postpartum Haemorrhage Guideline 52 2016\n\nWastlund D, Moraitis AA, Dacey A, Sovio U, Wilson ECF, et al. (2019) Screening for breech presentation using universal late-pregnancy ultrasonography: A prospective cohort study and cost effectiveness analysis. PLOS Medicine 16(4)\n\nWalker, S. and Cochrane, V. (2015). Unexpected breech: what can midwives do?. The Practising Midwife, 18(10), pp. 26-29\n\nImpey LWM, Murphy DJ, Grifﬁths M, Penna LK on behalf of the Royal College of Obstetriciansand Gynaecologists. Management of Breech Presentation. BJOG 2017\n\n"]

var colorType = ["Black","Green","Orange","Red","White"]


var deliveryFirstBlack = (["title" : "", "des" : "" , "image" : ""])
