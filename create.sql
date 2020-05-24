CREATE TABLE Countries (
    country_name VARCHAR(20) NOT NULL PRIMARY KEY
);

CREATE TABLE Ranks (
    university_rank Number(3,0) NOT NULL PRIMARY KEY
);

CREATE TABLE Universities (
     university_name VARCHAR(50) NOT NULL
    ,dynamic_year NUMBER(4,0) NOT NULL
    ,quality_of_faculty NUMBER(4,0) 
    ,country_name VARCHAR(20) NOT NULL REFERENCES Countries(country_name)
    ,CONSTRAINT CHK_Years CHECK (dynamic_year > 0 AND quality_of_faculty > 0)
    ,CONSTRAINT PK_Universities PRIMARY KEY (university_name, dynamic_year, country_name)
);

CREATE TABLE Universities_Ranks (
     university_name VARCHAR(50) NOT NULL
    ,dynamic_year NUMBER(4,0) NOT NULL
    ,university_rank NUMBER(3,0) NOT NULL
    ,country_name VARCHAR(20) NOT NULL
    ,CONSTRAINT PK_Universities_Ranks PRIMARY KEY (university_name, dynamic_year, country_name, university_rank)
    ,CONSTRAINT FK1_Universities_Ranks FOREIGN KEY (university_rank) REFERENCES Ranks(university_rank)
    ,CONSTRAINT FK2_Universities_Ranks FOREIGN KEY (university_name, dynamic_year, country_name) REFERENCES Universities(university_name, dynamic_year, country_name)
);
