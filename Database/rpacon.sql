----------------------------------------------------------------------------
CREATE TABLE "INVOKARIMAN"."VIDEO" 
    (	"TITLE" VARCHAR2(4000 BYTE), 
    "CHANNELNAME" VARCHAR2(4000 BYTE), 
    "VIDEOURL" VARCHAR2(4000 BYTE), 
    "VIEWS" NUMBER(31,0), 
    "DESCRIPTION" VARCHAR2(4000 BYTE)
    );
ALTER TABLE "INVOKARIMAN"."VIDEO" MODIFY ("TITLE" NOT NULL ENABLE);
ALTER TABLE "INVOKARIMAN"."VIDEO" MODIFY ("CHANNELNAME" NOT NULL ENABLE);
ALTER TABLE "INVOKARIMAN"."VIDEO" MODIFY ("VIEWS" NOT NULL ENABLE);
ALTER TABLE "INVOKARIMAN"."VIDEO" ADD PRIMARY KEY ("VIDEOURL")
USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
TABLESPACE "USERS"  ENABLE;
----------------------------------------------------------------------------
CREATE TABLE "INVOKARIMAN"."ARTICLE" 
    (	"SOURCENAME" VARCHAR2(4000 BYTE), 
    "AUTHOR" VARCHAR2(4000 BYTE), 
    "TITLE" VARCHAR2(4000 BYTE), 
    "DESCRIPTION" VARCHAR2(4000 BYTE), 
    "URL" VARCHAR2(4000 BYTE), 
    "URLTOIMAGE" VARCHAR2(4000 BYTE), 
    "PUBLISHEDAT" DATE, 
    "CONTENT" VARCHAR2(4000 BYTE)
    );
ALTER TABLE "INVOKARIMAN"."ARTICLE" ADD PRIMARY KEY ("URL")
USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
TABLESPACE "USERS"  ENABLE;
----------------------------------------------------------------------------
CREATE TABLE request(
        RequestDate DATE,
        Keywords VARCHAR2(4000) NOT NULL
    );
ALTER TABLE request ADD CONSTRAINT pk_request PRIMARY KEY(RequestDate);
----------------------------------------------------------------------------
CREATE TABLE person(
        Email VARCHAR2(4000)
    );
ALTER TABLE person ADD CONSTRAINT pk_person PRIMARY KEY(Email);
----------------------------------------------------------------------------
CREATE TABLE person_request(
        Email VARCHAR2(4000) NOT NULL,
        RequestDate DATE NOT NULL
    );  
ALTER TABLE person_request ADD CONSTRAINT fk_request_date_1 FOREIGN KEY(RequestDate) REFERENCES request(RequestDate);
ALTER TABLE person_request ADD CONSTRAINT fk_person_email FOREIGN KEY(Email) REFERENCES person(Email);
ALTER TABLE person_request ADD CONSTRAINT pk_person_request PRIMARY KEY(Email, RequestDate);
----------------------------------------------------------------------------
CREATE TABLE article_request(
        ArticleURL VARCHAR2(4000) NOT NULL,
        RequestDate DATE NOT NULL
    );
ALTER TABLE article_request ADD CONSTRAINT fk_article_url FOREIGN KEY(ArticleURL) REFERENCES article(URL);
ALTER TABLE article_request ADD CONSTRAINT fk_request_date FOREIGN KEY(RequestDate) REFERENCES request(RequestDate);
ALTER TABLE article_request ADD CONSTRAINT pk_article_request PRIMARY KEY(ArticleURL, RequestDate);
----------------------------------------------------------------------------
CREATE TABLE video_request(
        VideoURL VARCHAR2(4000) NOT NULL,
        RequestDate DATE NOT NULL
    );
ALTER TABLE video_request ADD CONSTRAINT fk_video_url FOREIGN KEY(VideoURL) REFERENCES video(VideoURL);
ALTER TABLE video_request ADD CONSTRAINT fk_request_date_2 FOREIGN KEY(RequestDate) REFERENCES request(RequestDate);
ALTER TABLE video_request ADD CONSTRAINT pk_request_video PRIMARY KEY(RequestDate, VideoURL);
----------------------------------------------------------------------------
-- truncate table article_request;
-- truncate table video_request;
-- truncate table person_request;
-- truncate table request;
-- truncate table article;
-- truncate table person;
-- truncate table video;

-- drop table article_request;
-- drop table video_request;
-- drop table person_request;
-- drop table request;
-- drop table article;
-- drop table person;
-- drop table video;