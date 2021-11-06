/**
Load data for States, Counties, and Cases



**/

INSERT INTO States VALUES (18, 'IN')
INSERT INTO States VALUES (21, 'KY')
INSERT INTO States VALUES (39, 'OH')
INSERT INTO States VALUES (47, 'TN')
GO

INSERT INTO Counties VALUES (18001, 'Adams')
INSERT INTO Counties VALUES (18003, 'Allen')
INSERT INTO Counties VALUES (18005, 'Barholomew')
Go


INSERT INTO Cases (YrMo, StateID, CountyID, AgeGroup, CaseType) VALUES 
('2020-08',18,18001,'18 to 49 years','Laboratory-confirmed case'),
('2020-08',18,18001,'18 to 49 years','Laboratory-confirmed case'),
('2020-08',18,18001,'18 to 49 years','Laboratory-confirmed case'),
('2020-08',18,18001,'18 to 49 years','Probable Case'),
('2020-08',18,18001,'18 to 49 years','Laboratory-confirmed case')

Go