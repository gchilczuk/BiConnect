-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2018-03-19 00:25:35.984

-- tables
-- Table: Account
CREATE TABLE Account (
    AccountID int  NOT NULL,
    People_PersonID int  NOT NULL,
    Login varchar(30)  NOT NULL,
    Password varchar(256)  NOT NULL,
    Role smallint  NOT NULL,
    Newsletter boolean  NOT NULL,
    SpeechConfirm boolean  NOT NULL,
    ActiveMember boolean  NOT NULL,
    CONSTRAINT Account_pk PRIMARY KEY (AccountID)
);

-- Table: Categories
CREATE TABLE Categories (
    CategoryID int  NOT NULL,
    Name varchar(30)  NOT NULL,
    CONSTRAINT Categories_pk PRIMARY KEY (CategoryID)
);

-- Table: Companies
CREATE TABLE Companies (
    CompanyID int  NOT NULL,
    Name varchar(30)  NOT NULL,
    Description varchar(300)  NULL,
    CONSTRAINT Companies_pk PRIMARY KEY (CompanyID)
);

-- Table: CompanySubcategories
CREATE TABLE CompanySubcategories (
    CompanyID int  NOT NULL,
    SubcategoryID int  NOT NULL,
    CONSTRAINT CompanySubcategories_pk PRIMARY KEY (CompanyID,SubcategoryID)
);

-- Table: Groups
CREATE TABLE Groups (
    GroupID int  NOT NULL,
    City varchar(30)  NOT NULL,
    CONSTRAINT Groups_pk PRIMARY KEY (GroupID)
);

-- Table: Meetings
CREATE TABLE Meetings (
    MeetingID int  NOT NULL,
    Date date  NOT NULL,
    CountMembers int  NOT NULL,
    CountGuests int  NOT NULL,
    GroupID int  NOT NULL,
    CONSTRAINT Meetings_pk PRIMARY KEY (MeetingID)
);

-- Table: People
CREATE TABLE People (
    PersonID int  NOT NULL,
    Name varchar(30)  NOT NULL,
    Surname varchar(30)  NULL,
    CONSTRAINT People_pk PRIMARY KEY (PersonID)
);

-- Table: PersonCompanies
CREATE TABLE PersonCompanies (
    PersonID int  NOT NULL,
    CompanyID int  NOT NULL,
    CONSTRAINT PersonCompanies_pk PRIMARY KEY (PersonID,CompanyID)
);

-- Table: RecommendationSubcategories
CREATE TABLE RecommendationSubcategories (
    RecommendationID int  NOT NULL,
    SubcategoryID int  NOT NULL,
    CONSTRAINT RecommendationSubcategories_pk PRIMARY KEY (RecommendationID,SubcategoryID)
);

-- Table: Recommendations
CREATE TABLE Recommendations (
    RecommendationID int  NOT NULL,
    Description text  NOT NULL,
    OccurrenceDate date  NOT NULL,
    ExpirationDate date  NULL,
    SpeechID int  NULL,
    CONSTRAINT Recommendations_pk PRIMARY KEY (RecommendationID)
);

-- Table: RequirementSubcategories
CREATE TABLE RequirementSubcategories (
    RequirementID int  NOT NULL,
    SubcategoryID int  NOT NULL,
    CONSTRAINT RequirementSubcategories_pk PRIMARY KEY (RequirementID,SubcategoryID)
);

-- Table: Requirements
CREATE TABLE Requirements (
    RequirementID int  NOT NULL,
    Description text  NOT NULL,
    OccurrenceDate date  NOT NULL,
    ExpirationDate date  NULL,
    FulfilledPositively boolean  NULL,
    SpeechID int  NULL,
    CONSTRAINT Requirements_pk PRIMARY KEY (RequirementID)
);

-- Table: Speeches
CREATE TABLE Speeches (
    SpeechID int  NOT NULL,
    PersonID int  NOT NULL,
    MeetingID int  NULL,
    SoundFilePath text  NULL,
    CONSTRAINT Speeches_pk PRIMARY KEY (SpeechID)
);

-- Table: Subcategories
CREATE TABLE Subcategories (
    SubcategoryID int  NOT NULL,
    ParentCategoryID int  NOT NULL,
    Name varchar(30)  NOT NULL,
    CONSTRAINT Subcategories_pk PRIMARY KEY (SubcategoryID)
);

-- foreign keys
-- Reference: Account_People (table: Account)
ALTER TABLE Account ADD CONSTRAINT Account_People
    FOREIGN KEY (People_PersonID)
    REFERENCES People (PersonID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: CompanySubcategories_Companies (table: CompanySubcategories)
ALTER TABLE CompanySubcategories ADD CONSTRAINT CompanySubcategories_Companies
    FOREIGN KEY (CompanyID)
    REFERENCES Companies (CompanyID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: CompanySubcategories_Subcategories (table: CompanySubcategories)
ALTER TABLE CompanySubcategories ADD CONSTRAINT CompanySubcategories_Subcategories
    FOREIGN KEY (SubcategoryID)
    REFERENCES Subcategories (SubcategoryID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Meetings_Groups (table: Meetings)
ALTER TABLE Meetings ADD CONSTRAINT Meetings_Groups
    FOREIGN KEY (GroupID)
    REFERENCES Groups (GroupID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: PersonCompanies_Companies (table: PersonCompanies)
ALTER TABLE PersonCompanies ADD CONSTRAINT PersonCompanies_Companies
    FOREIGN KEY (CompanyID)
    REFERENCES Companies (CompanyID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: PersonCompanies_People (table: PersonCompanies)
ALTER TABLE PersonCompanies ADD CONSTRAINT PersonCompanies_People
    FOREIGN KEY (PersonID)
    REFERENCES People (PersonID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: RecommendationSubcategories_Recommendations (table: RecommendationSubcategories)
ALTER TABLE RecommendationSubcategories ADD CONSTRAINT RecommendationSubcategories_Recommendations
    FOREIGN KEY (RecommendationID)
    REFERENCES Recommendations (RecommendationID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: RecommendationSubcategories_Subcategories (table: RecommendationSubcategories)
ALTER TABLE RecommendationSubcategories ADD CONSTRAINT RecommendationSubcategories_Subcategories
    FOREIGN KEY (SubcategoryID)
    REFERENCES Subcategories (SubcategoryID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Recommendations_Speeches (table: Recommendations)
ALTER TABLE Recommendations ADD CONSTRAINT Recommendations_Speeches
    FOREIGN KEY (SpeechID)
    REFERENCES Speeches (SpeechID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: RequirementSubcategories_Subcategories (table: RequirementSubcategories)
ALTER TABLE RequirementSubcategories ADD CONSTRAINT RequirementSubcategories_Subcategories
    FOREIGN KEY (SubcategoryID)
    REFERENCES Subcategories (SubcategoryID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: RequirementSubcategory_Requirements (table: RequirementSubcategories)
ALTER TABLE RequirementSubcategories ADD CONSTRAINT RequirementSubcategory_Requirements
    FOREIGN KEY (RequirementID)
    REFERENCES Requirements (RequirementID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Requirements_Speeches (table: Requirements)
ALTER TABLE Requirements ADD CONSTRAINT Requirements_Speeches
    FOREIGN KEY (SpeechID)
    REFERENCES Speeches (SpeechID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Speeches_Meetings (table: Speeches)
ALTER TABLE Speeches ADD CONSTRAINT Speeches_Meetings
    FOREIGN KEY (MeetingID)
    REFERENCES Meetings (MeetingID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Speeches_People (table: Speeches)
ALTER TABLE Speeches ADD CONSTRAINT Speeches_People
    FOREIGN KEY (PersonID)
    REFERENCES People (PersonID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Subcategories_Categories (table: Subcategories)
ALTER TABLE Subcategories ADD CONSTRAINT Subcategories_Categories
    FOREIGN KEY (ParentCategoryID)
    REFERENCES Categories (CategoryID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

