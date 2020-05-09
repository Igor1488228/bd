CREATE TABLE Countries (
    country_name VARCHAR(20) NOT NULL PRIMARY KEY
);

CREATE TABLE Rank (
    university_position Number(3,0) NOT NULL PRIMARY KEY
);

CREATE TABLE Universities (
     university_name VARCHAR(50) NOT NULL
    ,dynamic_year NUMBER(4,0) NOT NULL
    ,quality_of_faculty NUMBER(4,0) 
    ,country_name VARCHAR(20) NOT NULL REFERENCES Countries(country_name)
    ,CONSTRAINT CHK_Years CHECK (dynamic_year > 0 AND quality_of_faculty > 0)
    ,CONSTRAINT PK_Universities PRIMARY KEY (university_name, dynamic_year, country_name)
);

CREATE TABLE Universities_Rank (
     university_name VARCHAR(50) NOT NULL
    ,dynamic_year NUMBER(4,0) NOT NULL
    ,university_position NUMBER(3,0) NOT NULL
    ,country_name VARCHAR(20) NOT NULL
    ,CONSTRAINT PK_Universities_Rank PRIMARY KEY (university_name, dynamic_year, country_name, university_position)
    ,CONSTRAINT FK1_Universities_Rank FOREIGN KEY (university_position) REFERENCES Rank(university_position)
    ,CONSTRAINT FK2_Universities_Rank FOREIGN KEY (university_name, dynamic_year, country_name) REFERENCES Universities(university_name, dynamic_year, country_name)
);
