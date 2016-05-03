﻿CREATE PROCEDURE [dnt_checkemailandsecques]
@username nchar(20),
@email char(32),
@secques char(8)
AS
SELECT TOP 1 [uid] FROM [dnt_users] WHERE [username]=@username AND [email]=@email AND [secques]=@secques
GO

CREATE PROCEDURE [dnt_checkpasswordandsecques]
@username nchar(20),
@password char(32),
@secques char(8)
AS
SELECT TOP 1 [uid] FROM [dnt_users] WHERE [username]=@username AND [password]=@password AND [secques]=@secques
GO

CREATE PROCEDURE [dnt_checkpasswordbyuid]
@uid int,
@password char(32)
AS
SELECT TOP 1 [uid], [groupid], [adminid] FROM [dnt_users] WHERE [uid]=@uid AND [password]=@password
GO

CREATE PROCEDURE [dnt_checkpasswordbyusername]
@username nchar(20),
@password char(32)
AS
SELECT TOP 1 [uid], [groupid], [adminid] FROM [dnt_users] WHERE [username]=@username AND [password]=@password
GO

CREATE PROCEDURE [dnt_createadmingroup]
	@admingid smallint,
	@alloweditpost tinyint,
	@alloweditpoll tinyint,
	@allowstickthread tinyint,
	@allowmodpost tinyint,
	@allowdelpost tinyint,
	@allowmassprune tinyint,
	@allowrefund tinyint,
	@allowcensorword tinyint,
	@allowviewip tinyint,
	@allowbanip tinyint,
	@allowedituser tinyint,
	@allowmoduser tinyint,
	@allowbanuser tinyint,
	@allowpostannounce tinyint,
	@allowviewlog tinyint,
	@disablepostctrl tinyint,
	@allowviewrealname tinyint
AS
INSERT INTO dnt_admingroups 
	([admingid],[alloweditpost],[alloweditpoll],[allowstickthread],[allowmodpost],[allowdelpost],[allowmassprune],[allowrefund],[allowcensorword],[allowviewip],[allowbanip],[allowedituser],[allowmoduser],[allowbanuser],[allowpostannounce],[allowviewlog],[disablepostctrl],[allowviewrealname])
VALUES
	(@admingid,@alloweditpost,@alloweditpoll,@allowstickthread,@allowmodpost,@allowdelpost,@allowmassprune,@allowrefund,@allowcensorword,@allowviewip,@allowbanip,@allowedituser,@allowmoduser,@allowbanuser,@allowpostannounce,@allowviewlog,@disablepostctrl,@allowviewrealname)
GO

CREATE PROCEDURE [dnt_createattachment]
@uid int,
@tid int,
@pid int,
@postdatetime datetime,
@readperm int,
@filename nchar(200),
@description nchar(200),
@filetype nchar(100),
@filesize int,
@attachment nchar(200),
@downloads int,
@extname nvarchar(50),
@attachprice int,
@width int,
@height int
AS
DECLARE @aid int

INSERT INTO [dnt_attachments]([uid],[tid], [pid], [postdatetime], [readperm], [filename], [description], [filetype], [filesize],  [attachment], [downloads],[attachprice],[width],[height]) VALUES(@uid, @tid, @pid, @postdatetime, @readperm, @filename, @description, @filetype, @filesize,  @attachment, @downloads, @attachprice,@width,@height)
SELECT SCOPE_IDENTITY()  AS 'aid'

set @aid=(SELECT SCOPE_IDENTITY()  AS 'aid')
UPDATE [dnt_posts1] SET [attachment]=1 WHERE [pid]=@pid


INSERT INTO [dnt_myattachments]([aid],[uid],[attachment],[description],[postdatetime],[downloads],[filename],[pid],[tid],[extname]) VALUES(@aid,@uid,@attachment,@description,@postdatetime,@downloads,@filename,@pid,@tid,@extname)
GO

CREATE PROCEDURE [dnt_createdebatepostexpand]
	@tid int,
	@pid int,
	@opinion int,
	@diggs int
AS
BEGIN
	INSERT INTO [dnt_postdebatefields] VALUES(@tid, @pid, @opinion, @diggs)
	IF @opinion = 1
		UPDATE [dnt_debates] SET [positivediggs] = [positivediggs] + 1 WHERE [tid] = @tid
	ELSE IF @opinion = 2
		UPDATE [dnt_debates] SET [negativediggs] = [negativediggs] + 1 WHERE [tid] = @tid
END


GO

CREATE PROCEDURE [dnt_createfavorite]
@uid int,
@tid int,
@type tinyint

AS
	
	INSERT INTO [dnt_favorites] ([uid],[tid],[typeid]) VALUES(@uid,@tid,@type)
	RETURN
GO


CREATE PROCEDURE [dnt_createpm]
@pmid int,
@msgfrom nvarchar(20),
@msgto nvarchar(20),
@msgfromid int,
@msgtoid int,
@folder smallint=0,
@new int=0,
@subject nvarchar(60),
@postdatetime datetime,
@message ntext,
@savetosentbox smallint=1
AS

IF @folder<>0
	BEGIN
		SET @msgfrom=@msgto
	END
ELSE
	BEGIN
		UPDATE [dnt_users] SET [newpmcount]=ABS(ISNULL([newpmcount],0)*1)+1,[newpm] = 1 WHERE [uid]=@msgtoid
	END

	

INSERT INTO [dnt_pms] 
	([msgfrom],[msgfromid],[msgto],[msgtoid],[folder],[new],[subject],[postdatetime],[message])
VALUES
	(@msgfrom,@msgfromid,@msgto,@msgtoid,@folder,@new,@subject,@postdatetime,@message)
	
SELECT SCOPE_IDENTITY() AS 'pmid'

IF @savetosentbox=1 AND @folder=0
	BEGIN
		INSERT INTO [dnt_pms]
			([msgfrom],[msgfromid],[msgto],[msgtoid],[folder],[new],[subject],[postdatetime],[message])
		VALUES
			(@msgfrom,@msgfromid,@msgto,@msgtoid,1,@new,@subject,@postdatetime,@message)
	END
GO

CREATE PROCEDURE [dnt_createpost1]
@fid int,
@tid int,
@parentid int,
@layer int,
@poster varchar(20),
@posterid int,
@title nvarchar(60),
@topictitle nvarchar(60),
@postdatetime char(20),
@message ntext,
@ip varchar(15),
@lastedit varchar(50),
@invisible int,
@usesig int,
@htmlon int,
@smileyoff int,
@bbcodeoff int,
@parseurloff int,
@attachment int,
@rate int,
@ratetimes int

AS


DEClARE @postid int

DELETE FROM [dnt_postid] WHERE DATEDIFF(n, postdatetime, GETDATE()) >5

INSERT INTO [dnt_postid] ([postdatetime]) VALUES(GETDATE())

SELECT @postid=SCOPE_IDENTITY()

INSERT INTO [dnt_posts1]([pid], [fid], [tid], [parentid], [layer], [poster], [posterid], [title], [postdatetime], [message], [ip], [lastedit], [invisible], [usesig], [htmlon], [smileyoff], [bbcodeoff], [parseurloff], [attachment], [rate], [ratetimes]) VALUES(@postid, @fid, @tid, @parentid, @layer, @poster, @posterid, @title, @postdatetime, @message, @ip, @lastedit, @invisible, @usesig, @htmlon, @smileyoff, @bbcodeoff, @parseurloff, @attachment, @rate, @ratetimes)

IF @parentid=0
	BEGIN
		
		UPDATE [dnt_posts1] SET [parentid]=@postid WHERE [pid]=@postid
	END

IF @@ERROR=0
	BEGIN
		IF  @invisible = 0
		BEGIN
		
			UPDATE [dnt_statistics] SET [totalpost]=[totalpost] + 1
		
		
		
			DECLARE @fidlist AS VARCHAR(1000)
			DECLARE @strsql AS VARCHAR(4000)
			
			SET @fidlist = '';
			
			SELECT @fidlist = ISNULL([parentidlist],'') FROM [dnt_forums] WHERE [fid] = @fid
			IF RTRIM(@fidlist)<>''
				BEGIN
					SET @fidlist = RTRIM(@fidlist) + ',' + CAST(@fid AS VARCHAR(10))
				END
			ELSE
				BEGIN
					SET @fidlist = CAST(@fid AS VARCHAR(10))
				END
        
			
			UPDATE [dnt_forums] SET 
									[posts]=[posts] + 1, 
									[todayposts]=CASE 
													WHEN DATEDIFF(day, [lastpost], GETDATE())=0 THEN [todayposts]*1 + 1 
												 ELSE 1 
												 END,
									[lasttid]=@tid,	
									[lasttitle]=@topictitle,
									[lastpost]=@postdatetime,
									[lastposter]=@poster,
									[lastposterid]=@posterid 
							
							WHERE (CHARINDEX(',' + RTRIM([fid]) + ',', ',' + (SELECT @fidlist AS [fid]) + ',') > 0)
			
			
			UPDATE [dnt_users] SET
				[lastpost] = @postdatetime,
				[lastpostid] = @postid,
				[lastposttitle] = @title,
				[posts] = [posts] + 1,
				[lastactivity] = GETDATE()
			WHERE [uid] = @posterid
        
        
			IF @layer<=0
				BEGIN
					UPDATE [dnt_topics] SET [replies]=0,[lastposter]=@poster,[lastpost]=@postdatetime,[lastposterid]=@posterid WHERE [tid]=@tid
				END
			ELSE
				BEGIN
					UPDATE [dnt_topics] SET [replies]=[replies] + 1,[lastposter]=@poster,[lastpost]=@postdatetime,[lastposterid]=@posterid WHERE [tid]=@tid
				END
		END

		UPDATE [dnt_topics] SET [lastpostid]=@postid WHERE [tid]=@tid

		IF @posterid <> -1
		BEGIN
			INSERT [dnt_myposts]([uid], [tid], [pid], [dateline]) VALUES(@posterid, @tid, @postid, @postdatetime)
		END
	END
	
SELECT @postid AS postid
GO

CREATE PROCEDURE [dnt_createsearchcache]
	@keywords varchar(255),
	@searchstring varchar(255),
	@ip varchar(15),
	@uid int,
	@groupid int,
	@postdatetime varchar(19),
	@expiration varchar(19),
	@topics int,
	@tids text
AS
INSERT INTO dnt_searchcaches 
	([keywords],[searchstring],[ip],[uid],[groupid],[postdatetime],[expiration],[topics],[tids])
VALUES
	(@keywords,@searchstring,@ip,@uid,@groupid,@postdatetime,@expiration,@topics,@tids)
SELECT SCOPE_IDENTITY()  AS 'searchid'
GO

CREATE PROCEDURE [dnt_createtags]
@tags nvarchar(55),
@userid int,
@postdatetime datetime
AS
BEGIN	
	INSERT INTO [dnt_tags]([tagname], [userid], [postdatetime], [orderid], [color], [count], [fcount], [pcount], [scount], [vcount]) 
		SELECT [item], @userid, @postdatetime, 0, '', 0, 0, 0, 0, 0 FROM [dnt_split](@tags, ' ') AS [newtags] 
		WHERE NOT EXISTS (SELECT [tagname] FROM [dnt_tags] WHERE [newtags].[item] = [tagname])
END

GO

CREATE PROCEDURE [dnt_createtopic]
@fid smallint,
@iconid smallint,
@title nchar(80),
@typeid smallint,
@readperm int,
@price smallint,
@poster char(20),
@posterid int,
@postdatetime smalldatetime,
@lastpost smalldatetime,
@lastpostid int,
@lastposter char(20),
@views int,
@replies int,
@displayorder int,
@highlight varchar(500),
@digest int,
@rate int,
@hide int,
@attachment int,
@moderated int,
@closed int,
@magic int,
@special tinyint,
@attention int
AS

DECLARE @topicid int

DELETE FROM [dnt_topics] WHERE [tid]>(SELECT ISNULL(max(tid),0)-100 FROM [dnt_topics]) AND [lastpostid]=0

INSERT INTO [dnt_topics]([fid], [iconid], [title], [typeid], [readperm], [price], [poster], [posterid], [postdatetime], [lastpost], [lastpostid], [lastposter], [views], [replies], [displayorder], [highlight], [digest], [rate], [hide], [attachment], [moderated], [closed], [magic], [special],[attention]) VALUES(@fid, @iconid, @title, @typeid, @readperm, @price, @poster, @posterid, @postdatetime, @lastpost, @lastpostid, @lastposter, @views, @replies, @displayorder, @highlight, @digest, @rate, @hide, @attachment, @moderated, @closed, @magic, @special,@attention)

SET @topicid=SCOPE_IDENTITY()

IF @@ERROR=0 AND @displayorder=0
	BEGIN
		UPDATE [dnt_statistics] SET [totaltopic]=[totaltopic] + 1


		UPDATE [dnt_forums] SET [topics] = [topics] + 1,[curtopics] = [curtopics] + 1 WHERE [fid] = @fid
		
		IF @posterid <> -1
		BEGIN
			INSERT INTO [dnt_mytopics]([tid],[uid],[dateline]) VALUES(@topicid,  @posterid,  @postdatetime)
		END
		
	END
	
SELECT @topicid as topicid
GO

CREATE PROCEDURE [dnt_createuser]
@username nchar(20),
@nickname nchar(20),
@password char(32),
@secques char(8),
@gender int,
@adminid int,
@groupid smallint,
@groupexpiry int,
@extgroupids char(60),
@regip char(15),
@joindate char(19),
@lastip char(15),
@lastvisit char(19),
@lastactivity char(19),
@lastpost char(19),
@lastpostid int,
@lastposttitle nchar(60),
@posts int,
@digestposts smallint,
@oltime int,
@pageviews int,
@credits int,
@extcredits1 float,
@extcredits2 float,
@extcredits3 float,
@extcredits4 float,
@extcredits5 float,
@extcredits6 float,
@extcredits7 float,
@extcredits8 float,
@avatarshowid int,
@email char(50),
@bday char(19),
@sigstatus int,
@salt nchar(6),
@tpp int,
@ppp int,
@templateid smallint,
@pmsound int,
@showemail int,
@newsletter int,
@invisible int,
@newpm int,
@accessmasks int,
@website varchar(80),
@icq varchar(12),
@qq varchar(12),
@yahoo varchar(40),
@msn varchar(40),
@skype varchar(40),
@location nvarchar(30),
@customstatus varchar(30),
@avatar varchar(255),
@avatarwidth int,
@avatarheight int,
@medals varchar(300),
@bio nvarchar(500),
@signature nvarchar(500),
@sightml nvarchar(1000),
@authstr varchar(20),
@realname nvarchar(10),
@idcard varchar(20),
@mobile varchar(20),
@phone varchar(20)
AS
DECLARE @uid int

INSERT INTO [dnt_users]([username],[nickname], [password], [secques], [gender], [adminid], [groupid], [groupexpiry], [extgroupids], [regip], [joindate], [lastip], [lastvisit], [lastactivity], [lastpost], [lastpostid], [lastposttitle], [posts], [digestposts], [oltime], [pageviews], [credits], [extcredits1], [extcredits2], [extcredits3], [extcredits4], [extcredits5], [extcredits6], [extcredits7], [extcredits8], [avatarshowid], [email], [bday], [sigstatus], [salt], [tpp], [ppp], [templateid], [pmsound], [showemail], [newsletter], [invisible], [newpm], [accessmasks]) VALUES(@username,@nickname, @password, @secques, @gender, @adminid, @groupid, @groupexpiry, @extgroupids, @regip, @joindate, @lastip, @lastvisit, @lastactivity, @lastpost, @lastpostid, @lastposttitle, @posts, @digestposts, @oltime, @pageviews, @credits, @extcredits1, @extcredits2, @extcredits3, @extcredits4, @extcredits5, @extcredits6, @extcredits7, @extcredits8, @avatarshowid, @email, @bday, @sigstatus, @salt, @tpp, @ppp, @templateid, @pmsound, @showemail, @newsletter, @invisible, @newpm, @accessmasks)
SELECT SCOPE_IDENTITY()  AS 'userid'
SET @uid = SCOPE_IDENTITY()

IF @@ERROR=0
	BEGIN
		UPDATE [dnt_statistics] SET [totalusers]=[totalusers] + 1,[lastusername]=@username,[lastuserid]=@uid
	END

INSERT INTO dnt_userfields 
	([uid],[website],[icq],[qq],[yahoo],[msn],[skype],[location],[customstatus],[avatar],[avatarwidth],[avatarheight],[medals],[bio],[signature],[sightml],[authstr],[realname],[idcard],[mobile],[phone])
VALUES
	(@uid,@website,@icq,@qq,@yahoo,@msn,@skype,@location,@customstatus,@avatar,@avatarwidth,@avatarheight,@medals,@bio,@signature,@sightml,@authstr,@realname,@idcard,@mobile,@phone)	
GO

IF OBJECT_ID('dnt_deletetopicbytidlist1','P') IS NOT NULL
DROP PROCEDURE [dnt_deletetopicbytidlist1]
GO




                    CREATE PROCEDURE [dbo].[dnt_deletetopicbytidlist1]
	                    @tidlist AS VARCHAR(2000),
	                    @chanageposts AS BIT
                    AS

	                    DECLARE @postcount int
	                    DECLARE @topiccount int
	                    DECLARE @todaycount int
	                    DECLARE @sqlstr nvarchar(4000)
	                    DECLARE @fid varchar(2000)
	                    DECLARE @posterid varchar(200)
	                    DECLARE @tempFid int
	                    DECLARE @tempPosterid int
	                    DECLARE @tempLayer int
	                    DECLARE @temppostdatetime datetime

	                    DECLARE @tempfidlist AS VARCHAR(1000)	
				
	                    SET @fid = ''
	                    SET @posterid = ''
	                    SET @postcount=0
	                    SET @topiccount=0
	                    SET @todaycount=0

	                    SET @tempfidlist = '';


	                    IF @tidlist<>''
		                    BEGIN
			                    DECLARE cu_dnt_posts CURSOR FOR SELECT [fid],[posterid],[layer],[postdatetime] FROM [dnt_posts1] WHERE CHARINDEX(','+RTRIM([dnt_posts1].[tid])+',', ','+@tidlist+',') > 0
                    			
			                    OPEN cu_dnt_posts
			                    FETCH NEXT FROM cu_dnt_posts into @tempFid,@tempPosterid,@tempLayer,@temppostdatetime
			                    WHILE @@FETCH_STATUS = 0
				                    BEGIN
					                    SET @postcount = @postcount + 1
					                    IF @tempLayer = 0
						                    BEGIN
							                    SET @topiccount = @topiccount + 1
                    							
						                    END

					                    IF DATEDIFF(d,@temppostdatetime,GETDATE()) = 0
						                    BEGIN
							                    SET @todaycount = @todaycount + 1
						                    END


					                    IF CHARINDEX(',' + LTRIM(STR(@tempFid)) + ',',@fid + ',') = 0
						                    BEGIN
							                    --SET @fid = @fid + ',' + LTRIM(STR(@tempFid))	
							                    SELECT @tempfidlist = ISNULL([parentidlist],'') FROM [dnt_forums] WHERE [fid] = @tempFid
							                    IF RTRIM(@tempfidlist)<>''
								                    BEGIN
									                    SET @fid = RTRIM(@fid) + ',' +  RTRIM(@tempfidlist) + ',' + CAST(@tempFid AS VARCHAR(10))
								                    END
							                    ELSE
								                    BEGIN
									                    SET @fid =RTRIM(@fid) + ',' +  CAST(@tempFid AS VARCHAR(10))
								                    END

                    					
						                    END
					                    IF @chanageposts = 1
						                    BEGIN
							                    UPDATE [dnt_users] SET [posts] = [posts] - 1 WHERE [uid] = @tempPosterid
						                    END
                    				
					                    FETCH NEXT FROM cu_dnt_posts into @tempFid,@tempPosterid,@tempLayer,@temppostdatetime
				                    END

			                    CLOSE cu_dnt_posts
			                    DEALLOCATE cu_dnt_posts

                    	
			                    IF LEN(@fid)>0
				                    BEGIN	

                    			
					                    SET @fid = SUBSTRING(@fid,2,LEN(@fid)-1)
                    		
					                    IF @chanageposts = 1
						                    BEGIN
                    		
							                    UPDATE [dnt_statistics] SET [totaltopic]=[totaltopic] - @topiccount, [totalpost]=[totalpost] - @postcount

							                    UPDATE [dnt_forums] 
							                    SET [posts]=[posts] - @postcount,  
							                    [topics]=[topics] - @topiccount, 
							                    [todayposts] = [todayposts] - @todaycount  
							                    WHERE CHARINDEX(','+RTRIM([fid])+',', ','+@fid+',') > 0
						                    END
                    		
					                    DELETE FROM [dnt_favorites] WHERE CHARINDEX(','+RTRIM([tid])+',', ','+@tidlist+',') > 0 AND [typeid]=0
                    					
					                    DELETE FROM [dnt_polls] WHERE CHARINDEX(','+RTRIM([tid])+',', ','+@tidlist+',') > 0

					                    DELETE FROM [dnt_posts1] WHERE CHARINDEX(','+RTRIM([tid])+',', ','+@tidlist+',') > 0

					                    DELETE FROM [dnt_mytopics] WHERE CHARINDEX(','+RTRIM([tid])+',', ','+@tidlist+',') > 0
				                    END
			                    DELETE FROM [dnt_topics] WHERE CHARINDEX((','+RTRIM([closed])+','), ','+@tidlist+',') > 0 OR CHARINDEX(','+RTRIM([tid])+',', ','+@tidlist+',') > 0
                    			
			                    UPDATE [dnt_tags] SET [count]=[count]-1, [fcount]=[fcount]-1 WHERE [tagid] IN (SELECT [tagid] FROM [dnt_topictags] WHERE CHARINDEX(','+RTRIM([tid])+',', ','+@tidlist+',') > 0) 
                    			
			                    DELETE FROM [dnt_topictags] WHERE CHARINDEX(','+RTRIM([tid])+',', ','+@tidlist+',') > 0
                    			
			                    DELETE FROM [dnt_topictagcaches] WHERE CHARINDEX(','+RTRIM([tid])+',', ','+@tidlist+',') > 0 OR CHARINDEX((','+RTRIM([linktid])+','), ','+@tidlist+',') > 0
		                    
                    	
                    END
GO

CREATE PROCEDURE [dnt_deletepost1bypid]
                        @pid int,
			@chanageposts AS BIT
                    AS

                        DECLARE @fid int
                        DECLARE @tid int
                        DECLARE @posterid int
                        DECLARE @lastforumposterid int
                        DECLARE @layer int
                        DECLARE @postdatetime smalldatetime
                        DECLARE @poster varchar(50)
                        DECLARE @postcount int
                        DECLARE @title nchar(60)
                        DECLARE @lasttid int
                        DECLARE @postid int
                        DECLARE @todaycount int
                    	
                    	
                        SELECT @fid = [fid],@tid = [tid],@posterid = [posterid],@layer = [layer], @postdatetime = [postdatetime] FROM [dnt_posts1] WHERE pid = @pid

                        DECLARE @fidlist AS VARCHAR(1000)
                    	
                        SET @fidlist = '';
                    	
                        SELECT @fidlist = ISNULL([parentidlist],'') FROM [dnt_forums] WHERE [fid] = @fid
                        IF RTRIM(@fidlist)<>''
                            BEGIN
                                SET @fidlist = RTRIM(@fidlist) + ',' + CAST(@fid AS VARCHAR(10))
                            END
                        ELSE
                            BEGIN
                                SET @fidlist = CAST(@fid AS VARCHAR(10))
                            END


                        IF @layer<>0

                            BEGIN
                    			
								IF @chanageposts = 1
									BEGIN
										UPDATE [dnt_statistics] SET [totalpost]=[totalpost] - 1

										UPDATE [dnt_forums] SET 
											[posts]=[posts] - 1, 
											[todayposts]=CASE 
																WHEN DATEPART(yyyy, @postdatetime)=DATEPART(yyyy,GETDATE()) AND DATEPART(mm, @postdatetime)=DATEPART(mm,GETDATE()) AND DATEPART(dd, @postdatetime)=DATEPART(dd,GETDATE()) THEN [todayposts] - 1
																ELSE [todayposts]
														END						
										WHERE (CHARINDEX(',' + RTRIM([fid]) + ',', ',' +
															(SELECT @fidlist AS [fid]) + ',') > 0)
                    			
										UPDATE [dnt_users] SET [posts] = [posts] - 1 WHERE [uid] = @posterid

										UPDATE [dnt_topics] SET [replies]=[replies] - 1 WHERE [tid]=@tid
									END
                    			
                                DELETE FROM [dnt_posts1] WHERE [pid]=@pid
                    			
                            END
                        ELSE
                            BEGIN
                    		
                                SELECT @postcount = COUNT([pid]) FROM [dnt_posts1] WHERE [tid] = @tid
                                SELECT @todaycount = COUNT([pid]) FROM [dnt_posts1] WHERE [tid] = @tid AND DATEDIFF(d, [postdatetime], GETDATE()) = 0
                    			
								IF @chanageposts = 1
									BEGIN
										UPDATE [dnt_statistics] SET [totaltopic]=[totaltopic] - 1, [totalpost]=[totalpost] - @postcount
		                    			
										UPDATE [dnt_forums] SET [posts]=[posts] - @postcount, [topics]=[topics] - 1,[todayposts]=[todayposts] - @todaycount WHERE (CHARINDEX(',' + RTRIM([fid]) + ',', ',' +(SELECT @fidlist AS [fid]) + ',') > 0)
		                    			
										UPDATE [dnt_users] SET [posts] = [posts] - @postcount WHERE [uid] = @posterid
                    			
									END

                                DELETE FROM [dnt_posts1] WHERE [tid] = @tid
                    			
                                DELETE FROM [dnt_topics] WHERE [tid] = @tid
                    			
                            END	
                    		

                        IF @layer<>0
                            BEGIN
                                SELECT TOP 1 @pid = [pid], @posterid = [posterid], @postdatetime = [postdatetime], @title = [title], @poster = [poster] FROM [dnt_posts1] WHERE [tid]=@tid ORDER BY [pid] DESC
                                UPDATE [dnt_topics] SET [lastposter]=@poster,[lastpost]=@postdatetime,[lastpostid]=@pid,[lastposterid]=@posterid WHERE [tid]=@tid
                            END



                        SELECT @lasttid = [lasttid] FROM [dnt_forums] WHERE [fid] = @fid

                    	
                        IF @lasttid = @tid
                            BEGIN

                    			
                    			

                                SELECT TOP 1 @pid = [pid], @tid = [tid],@lastforumposterid = [posterid], @title = [title], @postdatetime = [postdatetime], @poster = [poster] FROM [dnt_posts1] WHERE [fid] = @fid ORDER BY [pid] DESC
                    			
                            
                            
                                UPDATE [dnt_forums] SET 
                    			
	                                [lastpost]=@postdatetime,
	                                [lastposter]=ISNULL(@poster,''),
	                                [lastposterid]=ISNULL(@lastforumposterid,'0')

                                WHERE (CHARINDEX(',' + RTRIM([fid]) + ',', ',' +
					                                (SELECT @fidlist AS [fid]) + ',') > 0)


                    			
                                SELECT TOP 1 @pid = [pid], @tid = [tid],@posterid = [posterid], @postdatetime = [postdatetime], @title = [title], @poster = [poster] FROM [dnt_posts1] WHERE [posterid]=@posterid ORDER BY [pid] DESC
                    			
                                UPDATE [dnt_users] SET
                    			
	                                [lastpost] = @postdatetime,
	                                [lastpostid] = @pid,
	                                [lastposttitle] = ISNULL(@title,'')
                    				
                                WHERE [uid] = @posterid
                    			
                            END
GO

CREATE PROCEDURE [dnt_deletetopictags]
	@tid int
 AS
BEGIN       
	UPDATE [dnt_tags] SET [count]=[count]-1,[fcount]=[fcount]-1 
	WHERE EXISTS (SELECT [tagid] FROM [dnt_topictags] WHERE [tid] = @tid AND [tagid] = [dnt_tags].[tagid])

    DELETE FROM [dnt_topictags] WHERE [tid] = @tid	
END
GO

CREATE PROCEDURE [dnt_getalltopiccount]
@fid int
AS

SELECT COUNT(tid) FROM [dnt_topics] WHERE ([fid]=@fid   OR   [fid]  IN (  SELECT fid  FROM [dnt_forums]  WHERE  CHARINDEX(',' + RTRIM(@fid) + ',', ',' + parentidlist + ',') > 0))  AND [displayorder]>=0


GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID(N'[dnt_getdebatepostlist1]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dnt_getdebatepostlist1]
GO

CREATE PROCEDURE [dnt_getdebatepostlist1] 
	@tid int,
	@opinion int,
	@pagesize int,
	@pageindex int
AS
	DECLARE @startRow int,
			@endRow int
	SET @startRow = (@pageindex - 1) * @pagesize + 1
	SET	@endRow = @startRow + @pagesize - 1

SELECT 
[DEBATEPOST].[attachment],
[DEBATEPOST].[bbcodeoff],
[DEBATEPOST].[fid],
[DEBATEPOST].[htmlon],
[DEBATEPOST].[invisible],
[DEBATEPOST].[ip],
[DEBATEPOST].[lastedit],
[DEBATEPOST].[layer],
[DEBATEPOST].[message],
[DEBATEPOST].[parentid],
[DEBATEPOST].[parseurloff],
[DEBATEPOST].[pid],
[DEBATEPOST].[postdatetime],
[DEBATEPOST].[poster],
[DEBATEPOST].[posterid],
[DEBATEPOST].[rate],
[DEBATEPOST].[ratetimes],
[DEBATEPOST].[smileyoff],
[DEBATEPOST].[tid],
[DEBATEPOST].[title],
[DEBATEPOST].[usesig],
[DEBATEPOST].[accessmasks], 
[DEBATEPOST].[adminid],
[DEBATEPOST].[avatarshowid],
[DEBATEPOST].[bday],
[DEBATEPOST].[credits],
[DEBATEPOST].[digestposts],
[DEBATEPOST].[email],
[DEBATEPOST].[extcredits1],
[DEBATEPOST].[extcredits2],
[DEBATEPOST].[extcredits3],
[DEBATEPOST].[extcredits4],
[DEBATEPOST].[extcredits5],
[DEBATEPOST].[extcredits6],
[DEBATEPOST].[extcredits7],
[DEBATEPOST].[extcredits8],
[DEBATEPOST].[extgroupids],
[DEBATEPOST].[gender],
[DEBATEPOST].[groupexpiry],
[DEBATEPOST].[groupid],
[DEBATEPOST].[joindate],
[DEBATEPOST].[lastactivity],
[DEBATEPOST].[lastip],
[DEBATEPOST].[lastpost],
[DEBATEPOST].[lastpostid],
[DEBATEPOST].[lastposttitle],
[DEBATEPOST].[lastvisit],
[DEBATEPOST].[newpm],
[DEBATEPOST].[newpmcount],
[DEBATEPOST].[newsletter],
[DEBATEPOST].[nickname],
[DEBATEPOST].[oltime],
[DEBATEPOST].[onlinestate],
[DEBATEPOST].[pageviews],
[DEBATEPOST].[password],
[DEBATEPOST].[pmsound],
[DEBATEPOST].[posts],
[DEBATEPOST].[ppp],
[DEBATEPOST].[regip],
[DEBATEPOST].[secques],
[DEBATEPOST].[showemail],
[DEBATEPOST].[sigstatus],
[DEBATEPOST].[spaceid],
[DEBATEPOST].[templateid],
[DEBATEPOST].[tpp],
[DEBATEPOST].[uid],
[DEBATEPOST].[username],
[DEBATEPOST].[authflag],
[DEBATEPOST].[authstr],
[DEBATEPOST].[authtime],
[DEBATEPOST].[avatar],
[DEBATEPOST].[avatarheight],
[DEBATEPOST].[avatarwidth],
[DEBATEPOST].[bio],
[DEBATEPOST].[customstatus],
[DEBATEPOST].[icq],
[DEBATEPOST].[idcard],
[DEBATEPOST].[ignorepm],
[DEBATEPOST].[location],
[DEBATEPOST].[medals],
[DEBATEPOST].[mobile],
[DEBATEPOST].[msn],
[DEBATEPOST].[phone],
[DEBATEPOST].[qq],
[DEBATEPOST].[realname],
[DEBATEPOST].[sightml],
[DEBATEPOST].[signature],
[DEBATEPOST].[skype],
[DEBATEPOST].[website],
[DEBATEPOST].[yahoo] 
FROM ( SELECT ROW_NUMBER() OVER(ORDER BY [pid]) AS ROWID,
[dnt_posts1].[attachment],
[dnt_posts1].[bbcodeoff],
[dnt_posts1].[fid],
[dnt_posts1].[htmlon],
[dnt_posts1].[invisible],
[dnt_posts1].[ip],
[dnt_posts1].[lastedit],
[dnt_posts1].[layer],
[dnt_posts1].[message],
[dnt_posts1].[parentid],
[dnt_posts1].[parseurloff],
[dnt_posts1].[pid],
[dnt_posts1].[postdatetime],
[dnt_posts1].[poster],
[dnt_posts1].[posterid],
[dnt_posts1].[rate],
[dnt_posts1].[ratetimes],
[dnt_posts1].[smileyoff],
[dnt_posts1].[tid],
[dnt_posts1].[title],
[dnt_posts1].[usesig],
[dnt_users].[accessmasks], 
[dnt_users].[adminid],
[dnt_users].[avatarshowid],
[dnt_users].[bday],
[dnt_users].[credits],
[dnt_users].[digestposts],
[dnt_users].[email],
[dnt_users].[extcredits1],
[dnt_users].[extcredits2],
[dnt_users].[extcredits3],
[dnt_users].[extcredits4],
[dnt_users].[extcredits5],
[dnt_users].[extcredits6],
[dnt_users].[extcredits7],
[dnt_users].[extcredits8],
[dnt_users].[extgroupids],
[dnt_users].[gender],
[dnt_users].[groupexpiry],
[dnt_users].[groupid],
[dnt_users].[joindate],
[dnt_users].[lastactivity],
[dnt_users].[lastip],
[dnt_users].[lastpost],
[dnt_users].[lastpostid],
[dnt_users].[lastposttitle],
[dnt_users].[lastvisit],
[dnt_users].[newpm],
[dnt_users].[newpmcount],
[dnt_users].[newsletter],
[dnt_users].[nickname],
[dnt_users].[oltime],
[dnt_users].[onlinestate],
[dnt_users].[pageviews],
[dnt_users].[password],
[dnt_users].[pmsound],
[dnt_users].[posts],
[dnt_users].[ppp],
[dnt_users].[regip],
[dnt_users].[secques],
[dnt_users].[showemail],
[dnt_users].[sigstatus],
[dnt_users].[spaceid],
[dnt_users].[templateid],
[dnt_users].[tpp],
[dnt_users].[uid],
[dnt_users].[username],
[dnt_userfields].[authflag],
[dnt_userfields].[authstr],
[dnt_userfields].[authtime],
[dnt_userfields].[avatar],
[dnt_userfields].[avatarheight],
[dnt_userfields].[avatarwidth],
[dnt_userfields].[bio],
[dnt_userfields].[customstatus],
[dnt_userfields].[icq],
[dnt_userfields].[idcard],
[dnt_userfields].[ignorepm],
[dnt_userfields].[location],
[dnt_userfields].[medals],
[dnt_userfields].[mobile],
[dnt_userfields].[msn],
[dnt_userfields].[phone],
[dnt_userfields].[qq],
[dnt_userfields].[realname],
[dnt_userfields].[sightml],
[dnt_userfields].[signature],
[dnt_userfields].[skype],
[dnt_userfields].[website],
[dnt_userfields].[yahoo]
FROM [dnt_posts1] 
LEFT JOIN [dnt_users] ON [dnt_users].[uid] = [dnt_posts1].[posterid] 
LEFT JOIN [dnt_userfields] ON [dnt_userfields].[uid] = [dnt_posts1].[posterid]
WHERE [dnt_posts1].invisible=0 
AND [dnt_posts1].pid IN (SELECT pid FROM dnt_postdebatefields WHERE opinion=@opinion AND tid=@tid)) AS DEBATEPOST
WHERE ROWID BETWEEN @startRow AND @endRow
GO

CREATE PROCEDURE [dnt_getfavoritescount]
@uid int,
@typeid smallint
AS
     SELECT COUNT(uid)  FROM [dnt_favorites] WHERE [uid]=@uid AND [typeid]=@typeid
GO

IF OBJECT_ID ('dnt_getfavoriteslist','P') IS NOT NULL
DROP PROCEDURE [dnt_getfavoriteslist]
GO

CREATE PROCEDURE [dnt_getfavoriteslist]
@uid int,
@pagesize int,
@pageindex int
AS

--SELECT [f].[uid],[f].[tid],[topics].[title],[topics].[poster],[topics].[postdatetime],[topics].[replies],[topics].[views],[topics].[posterid] FROM [dnt_favorites] [f] LEFT JOIN [dnt_topics] [topics]  ON   [f].[tid]=[topics].[tid] WHERE  [f].[typeid]=0 AND [f].[uid]=@uid
IF @pageindex = 1
	BEGIN
		SELECT TOP(@pagesize) [uid],[tid],[title],[poster],[postdatetime],[replies],[views],[posterid]  
		FROM (SELECT [f].[uid],[f].[tid],[topics].[title],[topics].[poster],[topics].[postdatetime],[topics].[replies],[topics].[views],[topics].[posterid] FROM [dnt_favorites] [f] LEFT JOIN [dnt_topics] [topics]  ON   [f].[tid]=[topics].[tid] WHERE  [f].[typeid]=0 AND [f].[uid]=@uid) favorites ORDER BY [tid] DESC
	END
ELSE
	BEGIN
		SELECT TOP(@pagesize) [uid],[tid],[title],[poster],[postdatetime],[replies],[views],[posterid] 
	    FROM (SELECT [f].[uid],[f].[tid],[topics].[title],[topics].[poster],[topics].[postdatetime],[topics].[replies],[topics].[views],[topics].[posterid] FROM [dnt_favorites] [f] LEFT JOIN [dnt_topics] [topics]  ON   [f].[tid]=[topics].[tid] WHERE  [f].[typeid]=0 AND [f].[uid]=@uid) f1 WHERE [tid] < (SELECT MIN([tid]) FROM (SELECT TOP((@pageindex-1)*@pagesize) [tid] 
	    FROM (SELECT [f].[uid],[f].[tid],[topics].[title],[topics].[poster],[topics].[postdatetime],[topics].[replies],[topics].[views],[topics].[posterid] FROM [dnt_favorites] [f] LEFT JOIN [dnt_topics] [topics]  ON   [f].[tid]=[topics].[tid] WHERE  [f].[typeid]=0 AND [f].[uid]=@uid) f2 ORDER BY [tid] DESC) AS tblTmp)  ORDER BY [tid] DESC
	END
GO

CREATE PROCEDURE [dnt_getlastexecutescheduledeventdatetime]
(
	@key VARCHAR(100),
	@servername VARCHAR(100),
	@lastexecuted DATETIME OUTPUT
)
AS
SELECT @lastexecuted = MAX([lastexecuted]) FROM [dnt_scheduledevents] WHERE [key] = @key AND [servername] = @servername

IF(@lastexecuted IS NULL)
BEGIN
	SET @lastexecuted = DATEADD(YEAR,-1,GETDATE())
END
GO

IF OBJECT_ID ('dnt_getlastpostlist1','P') IS NOT NULL
DROP PROCEDURE [dnt_getlastpostlist1]
GO

CREATE PROCEDURE [dnt_getlastpostlist1]
	@tid int,
	@pageindex int,
	@postnum int
	--@posttablename varchar(20)
AS
DECLARE @startRow int,
		@endRow int
SET @startRow = (@pageIndex - 1) * @postnum +1
SET @endRow = @startRow + @postnum -1

SELECT 
		[POST].[pid],
		[POST].[fid], 
		[POST].[layer],
		[POST].[posterid],
		[POST].[title], 
		[POST].[message], 
		[POST].[postdatetime], 
		[POST].[attachment], 
		[POST].[poster], 
		[POST].[invisible], 
		[POST].[usesig], 
		[POST].[htmlon], 
		[POST].[smileyoff], 
		[POST].[parseurloff], 
		[POST].[bbcodeoff], 
		[POST].[rate], 
		[POST].[ratetimes], 
		[POST].[username], 
		[POST].[email], 
		[POST].[showemail], 
		[POST].[avatar], 
		[POST].[avatarwidth], 
		[POST].[avatarheight], 
		[POST].[signature], 
		[POST].[location], 
		[POST].[customstatus] 
FROM (SELECT ROW_NUMBER() OVER(ORDER BY [pid]) AS ROWID,
		[dnt_posts1].[pid],
		[dnt_posts1].[fid], 
		[dnt_posts1].[layer],
		[dnt_posts1].[posterid],
		[dnt_posts1].[title], 
		[dnt_posts1].[message], 
		[dnt_posts1].[postdatetime], 
		[dnt_posts1].[attachment], 
		[dnt_posts1].[poster], 
		[dnt_posts1].[invisible], 
		[dnt_posts1].[usesig], 
		[dnt_posts1].[htmlon], 
		[dnt_posts1].[smileyoff], 
		[dnt_posts1].[parseurloff], 
		[dnt_posts1].[bbcodeoff], 
		[dnt_posts1].[rate], 
		[dnt_posts1].[ratetimes], 
		[dnt_users].[username], 
		[dnt_users].[email], 
		[dnt_users].[showemail], 
		[dnt_userfields].[avatar], 
		[dnt_userfields].[avatarwidth], 
		[dnt_userfields].[avatarheight], 
		[dnt_userfields].[sightml] AS [signature], 
		[dnt_userfields].[location], 
		[dnt_userfields].[customstatus] 
		FROM [dnt_posts1] 
		LEFT JOIN [dnt_users] ON [dnt_users].[uid]=[dnt_posts1].[posterid]
		LEFT JOIN [dnt_userfields] ON [dnt_userfields].[uid]=[dnt_users].[uid]
		WHERE [dnt_posts1].[tid] = @tid AND [dnt_posts1].[invisible] <=0 AND [dnt_posts1].layer <> 0) AS POST
		WHERE ROWID BETWEEN @startRow AND @endRow
GO

IF OBJECT_ID ('dnt_getmyattachments','P') IS NOT NULL
DROP PROCEDURE [dnt_getmyattachments]
GO

CREATE PROCEDURE [dnt_getmyattachments]
@uid int,
@pageindex int,
@pagesize int
 AS
DECLARE @startRow int,
		@endRow int
SET @startRow=(@pageindex-1) * @pagesize + 1
SET @endRow = @startRow + @pagesize - 1
SELECT 
[ATTACHMENTS].[aid],
[ATTACHMENTS].[uid],
[ATTACHMENTS].[attachment],
[ATTACHMENTS].[description],
[ATTACHMENTS].[downloads],
[ATTACHMENTS].[extname],
[ATTACHMENTS].[filename],
[ATTACHMENTS].[pid],
[ATTACHMENTS].[postdatetime],
[ATTACHMENTS].[tid]
FROM (SELECT ROW_NUMBER() OVER(ORDER BY [aid] DESC) AS ROWID,
[dnt_myattachments].[aid],
[dnt_myattachments].[uid],
[dnt_myattachments].[attachment],
[dnt_myattachments].[description],
[dnt_myattachments].[downloads],
[dnt_myattachments].[extname],
[dnt_myattachments].[filename],
[dnt_myattachments].[pid],
[dnt_myattachments].[postdatetime],
[dnt_myattachments].[tid]
FROM [dnt_myattachments]
WHERE [dnt_myattachments].[uid] = @uid ) AS ATTACHMENTS
WHERE ROWID BETWEEN @startRow AND @endRow
GO

IF OBJECT_ID ('dnt_getmyattachmentsbytype','P') IS NOT NULL
DROP PROCEDURE [dnt_getmyattachmentsbytype]
GO

CREATE PROCEDURE [dnt_getmyattachmentsbytype]
@uid int,
@pageindex int,
@pagesize int,
@extlist as nvarchar(100)
AS
DECLARE @startRow int,
	@endRow int
SET @startRow=(@pageindex - 1) * @pagesize + 1
SET @endRow = @startRow + @pagesize - 1

SELECT 
[ATTACHMENTS].[aid],
[ATTACHMENTS].[uid],
[ATTACHMENTS].[attachment],
[ATTACHMENTS].[description],
[ATTACHMENTS].[downloads],
[ATTACHMENTS].[extname],
[ATTACHMENTS].[filename],
[ATTACHMENTS].[pid],
[ATTACHMENTS].[postdatetime],
[ATTACHMENTS].[tid]
FROM (SELECT ROW_NUMBER() OVER(ORDER BY [aid] DESC) AS ROWID,
[dnt_myattachments].[aid],
[dnt_myattachments].[uid],
[dnt_myattachments].[attachment],
[dnt_myattachments].[description],
[dnt_myattachments].[downloads],
[dnt_myattachments].[extname],
[dnt_myattachments].[filename],
[dnt_myattachments].[pid],
[dnt_myattachments].[postdatetime],
[dnt_myattachments].[tid]
FROM [dnt_myattachments]
WHERE CHARINDEX([dnt_myattachments].[extname], @extlist) > 0 AND [uid] = @uid) AS ATTACHMENTS
WHERE ROWID BETWEEN @startRow AND @endRow
GO


IF OBJECT_ID ('dnt_getmyposts','P') IS NOT NULL
DROP PROCEDURE [dnt_getmyposts]
GO

CREATE PROCEDURE [dnt_getmyposts]
@uid int,
@pageindex int,
@pagesize int
 AS
DECLARE @startRow int,
	@endRow int
SET @startRow = ( @pageindex - 1 ) * @pagesize + 1
SET @endRow = @startRow + @pagesize - 1

SELECT 
[MYPOST].[tid], 
[MYPOST].[fid], 
[MYPOST].[iconid], 
[MYPOST].[typeid], 
[MYPOST].[readperm], 
[MYPOST].[price], 
[MYPOST].[poster], 
[MYPOST].[posterid], 
[MYPOST].[title], 
[MYPOST].[postdatetime], 
[MYPOST].[lastpost], 
[MYPOST].[lastpostid], 
[MYPOST].[lastposter], 
[MYPOST].[lastposterid], 
[MYPOST].[views], 
[MYPOST].[replies], 
[MYPOST].[displayorder], 
[MYPOST].[highlight], 
[MYPOST].[digest], 
[MYPOST].[rate], 
[MYPOST].[hide], 
[MYPOST].[special], 
[MYPOST].[attachment], 
[MYPOST].[moderated], 
[MYPOST].[closed], 
[MYPOST].[magic] 
FROM (SELECT ROW_NUMBER() OVER(ORDER BY [dnt_myposts].[tid] DESC) AS ROWID,
[dnt_topics].[tid], 
[dnt_topics].[fid], 
[dnt_topics].[iconid], 
[dnt_topics].[typeid], 
[dnt_topics].[readperm], 
[dnt_topics].[price], 
[dnt_topics].[poster], 
[dnt_topics].[posterid], 
[dnt_topics].[title], 
[dnt_topics].[postdatetime], 
[dnt_topics].[lastpost], 
[dnt_topics].[lastpostid], 
[dnt_topics].[lastposter], 
[dnt_topics].[lastposterid], 
[dnt_topics].[views], 
[dnt_topics].[replies], 
[dnt_topics].[displayorder], 
[dnt_topics].[highlight], 
[dnt_topics].[digest], 
[dnt_topics].[rate], 
[dnt_topics].[hide], 
[dnt_topics].[special], 
[dnt_topics].[attachment], 
[dnt_topics].[moderated], 
[dnt_topics].[closed], 
[dnt_topics].[magic]
FROM [dnt_topics] 
INNER JOIN [dnt_myposts] ON ([dnt_topics].[tid] = [dnt_myposts].[tid] AND [dnt_myposts].[uid] = @uid)) AS MYPOST
WHERE ROWID BETWEEN @startRow AND @endRow
GO

IF OBJECT_ID ('dnt_getmytopics','P') IS NOT NULL
DROP PROCEDURE [dnt_getmytopics]
GO

CREATE PROCEDURE [dnt_getmytopics]
@uid int,
@pageindex int,
@pagesize int
AS
DECLARE @startRow int,
	@endRow int
SET @startRow = ( @pageindex - 1 ) * @pagesize + 1 
SET @endRow = @startRow + @pagesize - 1

SELECT 
[MYTOPIC].[tid], 
[MYTOPIC].[fid], 
[MYTOPIC].[iconid], 
[MYTOPIC].[typeid], 
[MYTOPIC].[readperm], 
[MYTOPIC].[price], 
[MYTOPIC].[poster], 
[MYTOPIC].[posterid], 
[MYTOPIC].[title], 
[MYTOPIC].[postdatetime], 
[MYTOPIC].[lastpost], 
[MYTOPIC].[lastpostid], 
[MYTOPIC].[lastposter], 
[MYTOPIC].[lastposterid], 
[MYTOPIC].[views], 
[MYTOPIC].[replies], 
[MYTOPIC].[displayorder], 
[MYTOPIC].[highlight], 
[MYTOPIC].[digest], 
[MYTOPIC].[rate], 
[MYTOPIC].[hide], 
[MYTOPIC].[special], 
[MYTOPIC].[attachment], 
[MYTOPIC].[moderated], 
[MYTOPIC].[closed], 
[MYTOPIC].[magic]
FROM (SELECT ROW_NUMBER() OVER(ORDER BY [dnt_topics].[lastpost] DESC) AS ROWID,
[dnt_topics].[tid], 
[dnt_topics].[fid], 
[dnt_topics].[iconid], 
[dnt_topics].[typeid], 
[dnt_topics].[readperm], 
[dnt_topics].[price], 
[dnt_topics].[poster], 
[dnt_topics].[posterid], 
[dnt_topics].[title], 
[dnt_topics].[postdatetime], 
[dnt_topics].[lastpost], 
[dnt_topics].[lastpostid], 
[dnt_topics].[lastposter], 
[dnt_topics].[lastposterid], 
[dnt_topics].[views], 
[dnt_topics].[replies], 
[dnt_topics].[displayorder], 
[dnt_topics].[highlight], 
[dnt_topics].[digest], 
[dnt_topics].[rate], 
[dnt_topics].[hide], 
[dnt_topics].[special], 
[dnt_topics].[attachment], 
[dnt_topics].[moderated], 
[dnt_topics].[closed], 
[dnt_topics].[magic]
FROM [dnt_topics] 
INNER JOIN [dnt_mytopics] ON ([dnt_topics].[tid] = [dnt_mytopics].[tid] AND [dnt_mytopics].[uid] = @uid)) AS MYTOPIC
WHERE ROWID BETWEEN @startRow AND @endRow
GO

CREATE PROCEDURE [dnt_getpmcount]
@userid int,
@folder int=0,
@state int=-1
AS

IF @folder=-1
	BEGIN
	  SELECT COUNT(pmid) AS [pmcount] FROM [dnt_pms] WHERE ([msgtoid] = @userid AND [folder]=0) OR ([msgfromid] = @userid AND [folder] = 1) OR ([msgfromid] = @userid AND [folder] = 2)
	END
ELSE
    BEGIN
		IF @folder=0
			BEGIN
				IF @state=-1
					BEGIN
						SELECT COUNT(pmid) AS [pmcount] FROM [dnt_pms] WHERE [msgtoid] = @userid AND [folder] = @folder
					END
				ELSE IF @state=2
					BEGIN
						SELECT COUNT(pmid) AS [pmcount] FROM [dnt_pms] WHERE [msgtoid] = @userid AND [folder] = @folder AND [new]=1 AND GETDATE()-[postdatetime]<3
					END
				ELSE
					BEGIN
						SELECT COUNT(pmid) AS [pmcount] FROM [dnt_pms] WHERE [msgtoid] = @userid AND [folder] = @folder AND [new] = @state
					END
			END
		ELSE
			BEGIN
				IF @state=-1
					BEGIN
						SELECT COUNT(pmid) AS [pmcount] FROM [dnt_pms] WHERE [msgfromid] = @userid AND [folder] = @folder
					END
				ELSE IF @state=2
					BEGIN
						SELECT COUNT(pmid) AS [pmcount] FROM [dnt_pms] WHERE [msgfromid] = @userid AND [folder] = @folder AND [new]=1 AND GETDATE()-[postdatetime]<3
					END
				ELSE
					BEGIN
						SELECT COUNT(pmid) AS [pmcount] FROM [dnt_pms] WHERE [msgfromid] = @userid AND [folder] = @folder AND [new] = @state
					END
			END
	END
GO

CREATE PROCEDURE [dnt_getnoticecount]
@userid int,
@type int = -1,
@state int=-1
AS

	IF @type = -1
		BEGIN
			IF @state = -1
				BEGIN
					SELECT COUNT(nid) AS [pmcount] FROM [dnt_notices] WHERE [uid]=@userid
				END
			ELSE
				BEGIN
					SELECT COUNT(nid) AS [pmcount] FROM [dnt_notices] WHERE [uid]=@userid AND [new]=@state
				END
		END
	ELSE
		BEGIN
			IF @state = -1
				BEGIN
					SELECT COUNT(nid) AS [pmcount] FROM [dnt_notices] WHERE [uid]=@userid AND [type]=@type
				END
			ELSE
				BEGIN
					SELECT COUNT(nid) AS [pmcount] FROM [dnt_notices] WHERE [uid]=@userid AND [new]=@state AND [type]=@type
				END
		END

GO

IF OBJECT_ID('dnt_getpmlist','P') IS NOT NULL
DROP PROC [dnt_getpmlist]
GO

CREATE PROCEDURE [dnt_getpmlist]
@userid int,
@folder int,
@pagesize int,
@pageindex int,
@inttype int
AS
DECLARE @startRow int,
		@endRow int
SET @startRow = (@pageindex - 1) * @pagesize + 1
SET @endRow = @startRow + @pagesize - 1

IF (@folder <> 0)
BEGIN
	IF (@inttype <> 1)
	BEGIN
		SELECT 
		[PMS].[pmid],
		[PMS].[msgfrom],
		[PMS].[msgfromid],
		[PMS].[msgto],
		[PMS].[msgtoid],
		[PMS].[folder],
		[PMS].[new],
		[PMS].[subject],
		[PMS].[postdatetime],
		[PMS].[message]		
		FROM(SELECT ROW_NUMBER() OVER(ORDER BY [pmid] DESC) AS ROWID,
		[pmid],
		[msgfrom],
		[msgfromid],
		[msgto],
		[msgtoid],
		[folder],
		[new],
		[subject],
		[postdatetime],
		[message]
		FROM [dnt_pms]
		WHERE [msgfromid] = @userid AND [folder] = @folder) AS PMS
		WHERE ROWID BETWEEN @startRow AND @endRow
	END
	
	ELSE
	BEGIN
		SELECT 
		[PMS].[pmid],
		[PMS].[msgfrom],
		[PMS].[msgfromid],
		[PMS].[msgto],
		[PMS].[msgtoid],
		[PMS].[folder],
		[PMS].[new],
		[PMS].[subject],
		[PMS].[postdatetime],
		[PMS].[message]		
		FROM(SELECT ROW_NUMBER() OVER(ORDER BY [pmid] DESC) AS ROWID,
		[pmid],
		[msgfrom],
		[msgfromid],
		[msgto],
		[msgtoid],
		[folder],
		[new],
		[subject],
		[postdatetime],
		[message]
		FROM [dnt_pms]
		WHERE [msgfromid] = @userid AND [folder] = @folder AND [new] = 1) AS PMS
		WHERE ROWID BETWEEN @startRow AND @endRow
	END
END

ELSE
BEGIN
	IF (@inttype <> 1)
	BEGIN
		SELECT 
		[PMS].[pmid],
		[PMS].[msgfrom],
		[PMS].[msgfromid],
		[PMS].[msgto],
		[PMS].[msgtoid],
		[PMS].[folder],
		[PMS].[new],
		[PMS].[subject],
		[PMS].[postdatetime],
		[PMS].[message] 
		FROM(SELECT ROW_NUMBER() OVER(ORDER BY [pmid] DESC) AS ROWID,
		[pmid],
		[msgfrom],
		[msgfromid],
		[msgto],
		[msgtoid],
		[folder],
		[new],
		[subject],
		[postdatetime],
		[message]
		FROM [dnt_pms]
		WHERE [msgtoid] = @userid AND [folder] = @folder) AS PMS
		WHERE ROWID BETWEEN @startRow AND @endRow
	END
	
	ELSE
	BEGIN
		SELECT 
		[PMS].[pmid],
		[PMS].[msgfrom],
		[PMS].[msgfromid],
		[PMS].[msgto],
		[PMS].[msgtoid],
		[PMS].[folder],
		[PMS].[new],
		[PMS].[subject],
		[PMS].[postdatetime],
		[PMS].[message] 
		FROM(SELECT ROW_NUMBER() OVER(ORDER BY [pmid] DESC) AS ROWID,
		[pmid],
		[msgfrom],
		[msgfromid],
		[msgto],
		[msgtoid],
		[folder],
		[new],
		[subject],
		[postdatetime],
		[message]
		FROM [dnt_pms]
		WHERE [msgtoid] = @userid AND [folder] = @folder AND [new] = 1) AS PMS
		WHERE ROWID BETWEEN @startRow AND @endRow
	END
END
GO

CREATE PROCEDURE [dnt_getpost1count]
@tid int
AS
SELECT COUNT(pid) FROM [dnt_posts1] WHERE [tid] = @tid AND [invisible]=0 AND layer>0


GO


CREATE PROCEDURE dnt_getpost1tree
@tid int
AS
SELECT [pid], [layer], [title], [poster], [posterid],[postdatetime],[message] FROM [dnt_posts1] WHERE [tid] = @tid AND [invisible]=0 ORDER BY [parentid];


GO

IF OBJECT_ID('dnt_getpostcountbycondition1','P') IS NOT NULL
DROP PROC [dnt_getpostcountbycondition1]
GO

CREATE PROCEDURE [dnt_getpostcountbycondition1]
@tid int,
@posterid int
AS
SELECT COUNT(pid) FROM [dnt_posts1] WHERE [tid] = @tid AND [posterid] = @posterid  AND [layer]>=0
GO

CREATE PROCEDURE [dnt_getshortuserinfo]
@uid int
AS
SELECT TOP 1 * FROM [dnt_users] WHERE [uid]=@uid
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_getsinglepost1]') and OBJECTPROPERTY(id,N'IsProcedure') = 1)
drop procedure [dnt_getsinglepost1]
GO

CREATE PROCEDURE [dnt_getsinglepost1]
                    @tid int,
                    @pid int
                    AS
                    SELECT [aid], [tid], [pid], [postdatetime], [readperm], [filename], [description], [filetype], [filesize], [attachment], [downloads], [attachprice], [uid], [width], [height] FROM [dnt_attachments] WHERE [tid]=@tid

                    SELECT TOP 1 
	                                [dnt_posts1].[pid], 
	                                [dnt_posts1].[fid], 
	                                [dnt_posts1].[title], 
	                                [dnt_posts1].[layer],
	                                [dnt_posts1].[message], 
	                                [dnt_posts1].[ip], 
	                                [dnt_posts1].[lastedit], 
	                                [dnt_posts1].[postdatetime], 
	                                [dnt_posts1].[attachment], 
	                                [dnt_posts1].[poster], 
	                                [dnt_posts1].[invisible], 
	                                [dnt_posts1].[usesig], 
	                                [dnt_posts1].[htmlon], 
	                                [dnt_posts1].[smileyoff], 
	                                [dnt_posts1].[parseurloff], 
	                                [dnt_posts1].[bbcodeoff], 
	                                [dnt_posts1].[rate], 
	                                [dnt_posts1].[ratetimes], 
	                                [dnt_posts1].[posterid], 
	                                [dnt_users].[nickname],  
	                                [dnt_users].[username], 
	                                [dnt_users].[groupid],
                                    [dnt_users].[spaceid],
									[dnt_users].[gender],
									[dnt_users].[bday], 
	                                [dnt_users].[email], 
	                                [dnt_users].[showemail], 
	                                [dnt_users].[digestposts], 
	                                [dnt_users].[credits], 
	                                [dnt_users].[extcredits1], 
	                                [dnt_users].[extcredits2], 
	                                [dnt_users].[extcredits3], 
	                                [dnt_users].[extcredits4], 
	                                [dnt_users].[extcredits5], 
	                                [dnt_users].[extcredits6], 
	                                [dnt_users].[extcredits7], 
	                                [dnt_users].[extcredits8], 
	                                [dnt_users].[posts], 
	                                [dnt_users].[joindate], 
	                                [dnt_users].[onlinestate], 
	                                [dnt_users].[lastactivity], 
	                                [dnt_users].[invisible], 
	                                [dnt_userfields].[avatar], 
	                                [dnt_userfields].[avatarwidth], 
	                                [dnt_userfields].[avatarheight], 
	                                [dnt_userfields].[medals], 
	                                [dnt_userfields].[sightml] AS signature, 
	                                [dnt_userfields].[location], 
	                                [dnt_userfields].[customstatus], 
	                                [dnt_userfields].[website], 
	                                [dnt_userfields].[icq], 
	                                [dnt_userfields].[qq], 
	                                [dnt_userfields].[msn], 
	                                [dnt_userfields].[yahoo], 
	                                [dnt_userfields].[skype] 
                    FROM [dnt_posts1] LEFT JOIN [dnt_users] ON [dnt_users].[uid]=[dnt_posts1].[posterid] LEFT JOIN [dnt_userfields] ON [dnt_userfields].[uid]=[dnt_users].[uid] WHERE [dnt_posts1].[pid]=@pid

GO


IF OBJECT_ID('dnt_getsitemapnewtopics','P') IS NOT NULL
DROP PROC [dnt_getsitemapnewtopics]
GO

CREATE PROCEDURE [dnt_getsitemapnewtopics]
@fidlist VARCHAR(500)
AS
IF @fidlist<>''
     BEGIN
      DECLARE @strSQL VARCHAR(5000)
      SET @strSQL = 'SELECT TOP 20 [tid], [fid], [title], [poster], [postdatetime], [lastpost], [replies], [views], [digest] FROM [dnt_topics] WHERE [fid] 
NOT IN ('+@fidlist +') ORDER BY [tid] DESC' 
     END
ELSE
     BEGIN
      SET @strSQL = 'SELECT TOP 20 [tid], [fid], [title], [poster], [postdatetime], [lastpost], [replies], [views], [digest] FROM [dnt_topics] ORDER BY [tid] 
DESC'
     END
  EXEC(@strSQL)
GO


CREATE PROCEDURE [dnt_gettopiccount]
@fid int
AS
SELECT [curtopics] FROM [dnt_forums] WHERE [fid] = @fid
GO

IF OBJECT_ID('dnt_gettopiccountbycondition','P') IS NOT NULL
DROP PROC [dnt_gettopiccountbycondition]
GO

CREATE PROCEDURE [dnt_gettopiccountbycondition]
@fid int,
@state int=0,
@condition varchar(80)=null
AS
DECLARE @sql varchar(500)
IF @state=-1
	BEGIN
		set @sql ='SELECT COUNT(tid) FROM [dnt_topics] WHERE [fid]='+str(@fid)+' AND [displayorder]>-1 AND [closed]<=1'+@condition
	END
ELSE
	BEGIN
set @sql ='SELECT COUNT(tid) FROM [dnt_topics] WHERE [fid]='+str(@fid)+' AND [displayorder]>-1 AND [closed]='+str(@state)+' AND [closed]<=1'+@condition
	END
exec(@sql)
GO

CREATE PROCEDURE [dnt_gettopiccountbytype]
@condition varchar(4000)
AS
DECLARE @sql varchar(4100)
set @sql ='SELECT COUNT(tid) FROM [dnt_topics] WHERE [displayorder]>-1 AND [closed]<=1 '+@condition
exec(@sql)
GO

IF OBJECT_ID('dnt_gettopiclistbycondition','P') IS NOT NULL
DROP PROC [dnt_gettopiclistbycondition]
GO

CREATE PROCEDURE [dnt_gettopiclistbycondition]
@fid int,
@pagesize int,
@pageindex int,
@startnum int,
@condition varchar(80)
AS
DECLARE @strSQL varchar(5000)

IF @pageindex = 1
	BEGIN
		SET @strSQL = 'SELECT TOP ' + STR(@pagesize) +' [rate],[tid],[iconid],[typeid],[title],[price],[hide],[readperm],

[special],[poster],[posterid],[replies],[views],[postdatetime],[lastpost],[lastposter],

[lastpostid],[lastposterid],[replies],[highlight],[digest],[displayorder],[attachment],[closed],[magic],[special] FROM 

[dnt_topics] WHERE [fid]=' +STR(@fid) + ' AND [displayorder]=0' + @condition + ' ORDER BY [lastpostid] DESC'
	END
ELSE
	BEGIN
		SET @strSQL = 'SELECT TOP ' + STR(@pagesize) +'[rate], [tid],[iconid],[typeid],[title],[price],[hide],[readperm],

[special],[poster],[posterid],[replies],[views],[postdatetime],[lastpost],[lastposter],

[lastpostid],[lastposterid],[replies],[highlight],[digest],[displayorder],[attachment],[closed],[magic],[special] FROM 

[dnt_topics] WHERE [lastpostid] < (SELECT min([lastpostid])  FROM (SELECT TOP ' + STR

((@pageindex-1)*@pagesize-@startnum) + ' [lastpostid] FROM [dnt_topics] WHERE [fid]=' +STR

(@fid) + ' AND [displayorder]=0' + @condition + ' ORDER BY [lastpostid] DESC) AS tblTmp ) 

AND [fid]=' +STR(@fid) + ' AND [displayorder]=0' + @condition + ' ORDER BY [lastpostid] DESC'
	END
EXEC(@strSQL)
GO

IF OBJECT_ID('dnt_gettopiclist','P') IS NOT NULL
DROP PROC [dnt_gettopiclist]
GO

CREATE PROCEDURE [dnt_gettopiclist]
@fid int,
@pagesize int,
@startnum int,
@pageindex int
AS
DECLARE @startRow int,
		@endRow int
SET @startRow = (@pageindex - 1) * @pagesize + 1 - @startnum
SET @endRow = @startRow + @pagesize -1

SELECT 
[TOPICS].[rate], 
[TOPICS].[tid],
[TOPICS].[iconid],
[TOPICS].[typeid],
[TOPICS].[title],
[TOPICS].[price],
[TOPICS].[hide],
[TOPICS].[readperm],
[TOPICS].[poster],
[TOPICS].[posterid],
[TOPICS].[replies],
[TOPICS].[views],
[TOPICS].[postdatetime],
[TOPICS].[lastpost],
[TOPICS].[lastposter],
[TOPICS].[lastpostid],
[TOPICS].[lastposterid],
[TOPICS].[highlight],
[TOPICS].[digest],
[TOPICS].[displayorder],
[TOPICS].[attachment],
[TOPICS].[closed],
[TOPICS].[magic],
[TOPICS].[special] 
FROM(SELECT ROW_NUMBER() OVER(ORDER BY [lastpostid] DESC)AS ROWID,
[dnt_topics].[rate], 
[dnt_topics].[tid],
[dnt_topics].[iconid],
[dnt_topics].[typeid],
[dnt_topics].[title],
[dnt_topics].[price],
[dnt_topics].[hide],
[dnt_topics].[readperm],
[dnt_topics].[poster],
[dnt_topics].[posterid],
[dnt_topics].[replies],
[dnt_topics].[views],
[dnt_topics].[postdatetime],
[dnt_topics].[lastpost],
[dnt_topics].[lastposter],
[dnt_topics].[lastpostid],
[dnt_topics].[lastposterid],
[dnt_topics].[highlight],
[dnt_topics].[digest],
[dnt_topics].[displayorder],
[dnt_topics].[attachment],
[dnt_topics].[closed],
[dnt_topics].[magic],
[dnt_topics].[special] 
FROM [dnt_topics]
WHERE [fid]=@fid AND [displayorder]=0) AS TOPICS
WHERE ROWID BETWEEN @startRow AND @endRow
GO

IF OBJECT_ID('dnt_gettopiclistbydate','P') IS NOT NULL
DROP PROC [dnt_gettopiclistbydate]
GO

CREATE  PROCEDURE [dnt_gettopiclistbydate]
@fid int,
@pagesize int,
@pageindex int,
@startnum int,
@condition varchar(100),
@orderby varchar(100),
@ascdesc int
AS

DECLARE @strsql varchar(5000)
DECLARE @sorttype varchar(5)

IF @ascdesc=0
   SET @sorttype='ASC'
ELSE
   SET @sorttype='DESC'

IF @pageindex = 1
	BEGIN
		SET @strsql = 'SELECT TOP ' + STR(@pagesize) +' [tid],[iconid],[title],[price],[typeid],[readperm],[hide],[special],[poster],[posterid],[replies],[views],[postdatetime],[lastpost],[lastposter],[lastpostid],[lastposterid],[replies],[highlight],[digest],[displayorder],[attachment],[closed],[magic],[rate] FROM [dnt_topics] WHERE [fid]=' +STR(@fid) + ' AND [displayorder]=0'+@condition+' ORDER BY '+@orderby+' '+@sorttype
	END
ELSE
           IF @sorttype='DESC'
	BEGIN
		SET @strSQL = 'SELECT TOP ' + STR(@pagesize) +' [tid],[iconid],[title],[price],[typeid],[hide],[readperm],[special],[poster],[posterid],[replies],[views],[postdatetime],[lastpost],[lastposter],[lastpostid],[lastposterid],[replies],[highlight],[digest],[displayorder],[attachment],[closed],[magic],[rate] FROM [dnt_topics] WHERE ['+@orderby+'] < (SELECT min(['+@orderby+']) FROM (SELECT TOP ' + STR((@pageindex-1)*@pagesize-@startnum) + ' ['+@orderby+']  FROM [dnt_topics] WHERE [fid]=' +STR(@fid) + ' AND [displayorder]=0'+@condition+' ORDER BY  '+@orderby+' '+@sorttype+')AS tblTmp ) AND [fid]=' +STR(@fid) + ' AND [displayorder]=0'+@condition+' ORDER BY  '+@orderby+' '+@sorttype
	END
      ELSE
             BEGIN
		SET @strSQL = 'SELECT TOP ' + STR(@pagesize) +' [tid],[iconid],[title],[price],[hide],[typeid],[readperm],[special],[poster],[posterid],[replies],[views],[postdatetime],[lastpost],[lastposter],[lastpostid],[lastposterid],[replies],[highlight],[digest],[displayorder],[attachment],[closed],[magic],[rate] FROM [dnt_topics] WHERE ['+@orderby+'] > (SELECT MAX(['+@orderby+']) FROM (SELECT TOP ' + STR((@pageindex-1)*@pagesize-@startnum) + ' ['+@orderby+'] FROM [dnt_topics] WHERE [fid]=' +STR(@fid) + ' AND [displayorder]=0'+@condition+' ORDER BY  '+@orderby+' '+@sorttype+')AS tblTmp ) AND [fid]=' +STR(@fid) + ' AND [displayorder]=0'+@condition+' ORDER BY '+@orderby+' '+@sorttype
            END
EXEC(@strsql)
GO

IF OBJECT_ID('dnt_gettopiclistbytag','P') IS NOT NULL
DROP PROC [dnt_gettopiclistbytag]
GO

CREATE PROCEDURE [dnt_gettopiclistbytag]	
	@tagid int,
	@pageindex int,
	@pagesize int
AS
	DECLARE @startRow int,
			@endRow	int
SET @startRow = (@pageindex - 1) * @pagesize + 1
SET @endRow = @startRow + @pagesize -1

SELECT 
[TOPICTAGS].[tid], 
[TOPICTAGS].[title],
[TOPICTAGS].[poster],
[TOPICTAGS].[posterid],
[TOPICTAGS].[fid],
[TOPICTAGS].[postdatetime],
[TOPICTAGS].[replies],
[TOPICTAGS].[views],
[TOPICTAGS].[lastposter],
[TOPICTAGS].[lastposterid],
[TOPICTAGS].[lastpost] 
FROM(SELECT ROW_NUMBER() OVER(ORDER BY [lastpostid]) AS ROWID,
[t].[tid], 
[t].[title],
[t].[poster],
[t].[posterid],
[t].[fid],
[t].[postdatetime],
[t].[replies],
[t].[views],
[t].[lastposter],
[t].[lastposterid],
[t].[lastpost]
FROM [dnt_topictags] AS [tt], [dnt_topics] AS [t]
WHERE [t].[tid] = [tt].[tid] AND [t].[displayorder] >=0 AND [tt].[tagid] = @tagid) AS TOPICTAGS
WHERE ROWID BETWEEN @startRow AND @endRow
GO

CREATE PROCEDURE [dnt_gettopiclistbytype]
@pagesize int,
@pageindex int,
@startnum int,
@condition varchar(1000),
@ascdesc int
AS
DECLARE @strSQL varchar(5000)

DECLARE @sorttype varchar(5)

IF @ascdesc=0
   SET @sorttype='ASC'
ELSE
   SET @sorttype='DESC'

IF @pageindex = 1
	BEGIN
		SET @strSQL = 'SELECT TOP ' + STR(@pagesize) +' [tid],[iconid],[typeid],[title],[price],[hide],[readperm],

[special],[poster],[posterid],[replies],[views],[postdatetime],[lastpost],[lastposter],

[lastpostid],[lastposterid],[replies],[highlight],[digest],[displayorder],[attachment],[closed],[magic],[rate] FROM 

[dnt_topics] WHERE  [displayorder]>=0' + @condition + ' ORDER BY [lastpostid] '+@sorttype +',  [tid] '+@sorttype
	END
ELSE
	BEGIN
		IF @sorttype='DESC'
		BEGIN
			SET @strSQL = 'SELECT TOP ' + STR(@pagesize) +' [tid],[iconid],[typeid],[title],[price],[hide],[readperm],
	
	[special],[poster],[posterid],[replies],[views],[postdatetime],[lastpost],[lastposter],
	
	[lastpostid],[lastposterid],[replies],[highlight],[digest],[displayorder],[attachment],[closed],[magic],[rate] FROM 
	
	[dnt_topics] WHERE [lastpostid] < (SELECT min([lastpostid])  FROM (SELECT TOP ' + STR
	
	((@pageindex-1)*@pagesize-@startnum) + ' [lastpostid] FROM [dnt_topics] WHERE  [displayorder]>=0' + @condition + ' ORDER BY [tid] ' + @sorttype + ' , [lastpostid] ' + @sorttype + ') AS tblTmp ) 
	
	AND  [displayorder]>=0' + @condition +' ORDER BY [lastpostid] '+@sorttype +',  [tid] '+@sorttype
		END
		ELSE
		BEGIN
			SET @strSQL = 'SELECT TOP ' + STR(@pagesize) +' [tid],[iconid],[typeid],[title],[price],[hide],[readperm],
	
	[special],[poster],[posterid],[replies],[views],[postdatetime],[lastpost],[lastposter],
	
	[lastpostid],[lastposterid],[replies],[highlight],[digest],[displayorder],[attachment],[closed],[magic] FROM 
	
	[dnt_topics] WHERE [lastpostid] > (SELECT MAX([lastpostid])  FROM (SELECT TOP ' + STR
	
	((@pageindex-1)*@pagesize-@startnum) + ' [lastpostid] FROM [dnt_topics] WHERE  [displayorder]>=0' + @condition + ' ORDER BY [tid] ' + @sorttype + ' , [lastpostid] ' + @sorttype + ') AS tblTmp ) 
	
	AND  [displayorder]>=0' + @condition +' ORDER BY [lastpostid] '+@sorttype +',  [tid] '+@sorttype
		END
	END
EXEC(@strSQL)

GO

CREATE PROCEDURE [dnt_gettopiclistbytypedate]
@pagesize int,
@pageindex int,
@startnum int,
@condition varchar(1000),
@orderby varchar(100),
@ascdesc int
AS

DECLARE @strsql varchar(5000)
DECLARE @sorttype varchar(5)

IF @ascdesc=0
   SET @sorttype='ASC'
ELSE
   SET @sorttype='DESC'

IF @pageindex = 1
	BEGIN
		SET @strsql = 'SELECT TOP ' + STR(@pagesize) +' [tid],[iconid],[typeid],[title],[special],[price],[hide],[readperm],[poster],[posterid],[replies],[views],[postdatetime],[lastpost],[lastposter],[lastpostid],[lastposterid],[highlight],[digest],[displayorder],[closed],[attachment],[magic],[rate] FROM [dnt_topics] WHERE [displayorder]>=0'+@condition+' ORDER BY '+@orderby+' '+@sorttype
	END
ELSE
           IF @sorttype='DESC'
	BEGIN
		SET @strSQL = 'SELECT TOP ' + STR(@pagesize) +' [tid],[iconid],[typeid],[title],[special],[price],[hide],[readperm],[poster],[posterid],[replies],[views],[postdatetime],[lastpost],[lastposter],[lastpostid],[lastposterid],[highlight],[digest],[displayorder],[closed],[attachment],[magic],[rate] FROM [dnt_topics] WHERE ['+@orderby+'] < (SELECT min(['+@orderby+']) FROM (SELECT TOP ' + STR((@pageindex-1)*@pagesize-@startnum) + ' ['+@orderby+']  FROM [dnt_topics] WHERE  [displayorder]>=0'+@condition+' ORDER BY  '+@orderby+' '+@sorttype+')AS tblTmp ) AND [displayorder]>=0'+@condition+' ORDER BY  '+@orderby+' '+@sorttype
	END
      ELSE
             BEGIN
		SET @strSQL = 'SELECT TOP ' + STR(@pagesize) +' [tid],[iconid],[typeid],[title],[special],[price],[hide],[readperm],[poster],[posterid],[replies],[views],[postdatetime],[lastpost],[lastposter],[lastpostid],[lastposterid],[highlight],[digest],[displayorder],[closed],[attachment],[magic],[rate] FROM [dnt_topics] WHERE ['+@orderby+'] > (SELECT MAX(['+@orderby+']) FROM (SELECT TOP ' + STR((@pageindex-1)*@pagesize-@startnum) + ' ['+@orderby+'] FROM [dnt_topics] WHERE [displayorder]>=0'+@condition+' ORDER BY  '+@orderby+' '+@sorttype+')AS tblTmp ) AND [displayorder]>=0'+@condition+' ORDER BY '+@orderby+' '+@sorttype
            END

EXEC(@strsql)
GO

IF OBJECT_ID('dnt_gettoptopiclist','P') IS NOT NULL
DROP PROCEDURE [dnt_gettoptopiclist]
GO

CREATE PROCEDURE [dnt_gettoptopiclist]
@fid int,
@pagesize int,
@pageindex int,
@tids varchar(500)
AS
DECLARE @startRow int,
		@endRow int
SET @startROW = ( @pageindex - 1 ) * @pagesize + 1
SET @endRow = @startRow +  @pagesize -1

SELECT 
[TOPICS].[rate], 
[TOPICS].[tid],
[TOPICS].[fid],
[TOPICS].[typeid],
[TOPICS].[iconid],
[TOPICS].[title],
[TOPICS].[price],
[TOPICS].[hide],
[TOPICS].[readperm], 
[TOPICS].[special],
[TOPICS].[poster],
[TOPICS].[posterid],
[TOPICS].[views],
[TOPICS].[postdatetime],
[TOPICS].[lastpost],
[TOPICS].[lastposter],
[TOPICS].[lastpostid],
[TOPICS].[lastposterid],
[TOPICS].[replies],
[TOPICS].[highlight],
[TOPICS].[digest],
[TOPICS].[displayorder],
[TOPICS].[closed],
[TOPICS].[attachment],
[TOPICS].[magic] 
FROM (SELECT ROW_NUMBER() OVER(ORDER BY [dnt_topics].[displayorder] DESC,[dnt_topics].[lastpost] DESC) AS ROWID,
[dnt_topics].[rate], 
[dnt_topics].[tid],
[dnt_topics].[fid],
[dnt_topics].[typeid],
[dnt_topics].[iconid],
[dnt_topics].[title],
[dnt_topics].[price],
[dnt_topics].[hide],
[dnt_topics].[readperm], 
[dnt_topics].[special],
[dnt_topics].[poster],
[dnt_topics].[posterid],
[dnt_topics].[views],
[dnt_topics].[postdatetime],
[dnt_topics].[lastpost],
[dnt_topics].[lastposter],
[dnt_topics].[lastpostid],
[dnt_topics].[lastposterid],
[dnt_topics].[replies],
[dnt_topics].[highlight],
[dnt_topics].[digest],
[dnt_topics].[displayorder],
[dnt_topics].[closed],
[dnt_topics].[attachment],
[dnt_topics].[magic]
FROM [dnt_topics]
WHERE [displayorder]>0 AND CHARINDEX(','+RTRIM([dnt_topics].[tid])+',', ','+@tids+',')>0)AS TOPICS
WHERE ROWID BETWEEN @startRow AND @endRow 
GO

IF OBJECT_ID ('dnt_getuserinfo','P') IS NOT NULL
DROP PROCEDURE [dnt_getuserinfo]
GO

CREATE PROCEDURE [dnt_getuserinfo]
@uid int
AS
SELECT TOP 1 
[dnt_users].[accessmasks], 
[dnt_users].[adminid],
[dnt_users].[avatarshowid],
[dnt_users].[bday],
[dnt_users].[credits],
[dnt_users].[digestposts],
[dnt_users].[email],
[dnt_users].[extcredits1],
[dnt_users].[extcredits2],
[dnt_users].[extcredits3],
[dnt_users].[extcredits4],
[dnt_users].[extcredits5],
[dnt_users].[extcredits6],
[dnt_users].[extcredits7],
[dnt_users].[extcredits8],
[dnt_users].[extgroupids],
[dnt_users].[gender],
[dnt_users].[groupexpiry],
[dnt_users].[groupid],
[dnt_users].[invisible],
[dnt_users].[joindate],
[dnt_users].[lastactivity],
[dnt_users].[lastip],
[dnt_users].[lastpost],
[dnt_users].[lastpostid],
[dnt_users].[lastposttitle],
[dnt_users].[lastvisit],
[dnt_users].[newpm],
[dnt_users].[newpmcount],
[dnt_users].[newsletter],
[dnt_users].[nickname],
[dnt_users].[oltime],
[dnt_users].[onlinestate],
[dnt_users].[pageviews],
[dnt_users].[password],
[dnt_users].[pmsound],
[dnt_users].[posts],
[dnt_users].[ppp],
[dnt_users].[regip],
[dnt_users].[secques],
[dnt_users].[showemail],
[dnt_users].[sigstatus],
[dnt_users].[spaceid],
[dnt_users].[templateid],
[dnt_users].[tpp],
[dnt_users].[uid],
[dnt_users].[username],
[dnt_users].[salt],
[dnt_userfields].[authflag],
[dnt_userfields].[authstr],
[dnt_userfields].[authtime],
[dnt_userfields].[avatar],
[dnt_userfields].[avatarheight],
[dnt_userfields].[avatarwidth],
[dnt_userfields].[bio],
[dnt_userfields].[customstatus],
[dnt_userfields].[icq],
[dnt_userfields].[idcard],
[dnt_userfields].[ignorepm],
[dnt_userfields].[location],
[dnt_userfields].[medals],
[dnt_userfields].[mobile],
[dnt_userfields].[msn],
[dnt_userfields].[phone],
[dnt_userfields].[qq],
[dnt_userfields].[realname],
[dnt_userfields].[sightml],
[dnt_userfields].[signature],
[dnt_userfields].[skype],
[dnt_userfields].[uid],
[dnt_userfields].[website],
[dnt_userfields].[yahoo]
FROM [dnt_users] LEFT JOIN [dnt_userfields] ON [dnt_users].[uid]=[dnt_userfields].[uid] 
WHERE [dnt_users].[uid]=@uid
GO

IF OBJECT_ID('dnt_getuserlist','P') IS NOT NULL
DROP PROCEDURE [dnt_getuserlist]
GO

CREATE PROCEDURE [dnt_getuserlist]
@pagesize int,
@pageindex int,
@column varchar(20),
@ordertype AS varchar(5)
AS
DECLARE @startRow int,
		@endRow	int
SET @startRow = (@pageindex - 1) * @pagesize + 1
SET @endRow = @startRow + @pagesize - 1

IF (@ordertype = 'DESC')
BEGIN
	IF (@column = 'username')
	BEGIN
		SELECT 
			[USERS].[uid], 
			[USERS].[groupid], 
			[USERS].[username], 
			[USERS].[nickname], 
			[USERS].[joindate], 
			[USERS].[credits], 
			[USERS].[posts], 
			[USERS].[email], 
			[USERS].[lastactivity], 
			[USERS].[oltime], 
			[USERS].[location] 
		FROM (SELECT ROW_NUMBER() OVER(ORDER BY [dnt_users].[username] DESC ) AS ROWID,
			[dnt_users].[uid], 
			[dnt_users].[groupid], 
			[dnt_users].[username], 
			[dnt_users].[nickname], 
			[dnt_users].[joindate], 
			[dnt_users].[credits], 
			[dnt_users].[posts], 
			[dnt_users].[email], 
			[dnt_users].[lastactivity], 
			[dnt_users].[oltime], 
			[dnt_userfields].[location]
		FROM [dnt_users]
		LEFT JOIN [dnt_userfields] ON [dnt_userfields].[uid] = [dnt_users].[uid]) AS USERS
		WHERE ROWID BETWEEN @startRow AND @endRow
	END
	ELSE IF (@column = 'credits')
	BEGIN
		SELECT 
			[USERS].[uid], 
			[USERS].[groupid], 
			[USERS].[username], 
			[USERS].[nickname], 
			[USERS].[joindate], 
			[USERS].[credits], 
			[USERS].[posts], 
			[USERS].[email], 
			[USERS].[lastactivity], 
			[USERS].[oltime], 
			[USERS].[location] 
		FROM (SELECT ROW_NUMBER() OVER(ORDER BY [dnt_users].[credits] DESC ) AS ROWID,
			[dnt_users].[uid], 
			[dnt_users].[groupid], 
			[dnt_users].[username], 
			[dnt_users].[nickname], 
			[dnt_users].[joindate], 
			[dnt_users].[credits], 
			[dnt_users].[posts], 
			[dnt_users].[email], 
			[dnt_users].[lastactivity], 
			[dnt_users].[oltime], 
			[dnt_userfields].[location]
		FROM [dnt_users]
		LEFT JOIN [dnt_userfields] ON [dnt_userfields].[uid] = [dnt_users].[uid]) AS USERS
		WHERE ROWID BETWEEN @startRow AND @endRow
	END
	ELSE IF (@column = 'posts')
	BEGIN
		SELECT 
			[USERS].[uid], 
			[USERS].[groupid], 
			[USERS].[username], 
			[USERS].[nickname], 
			[USERS].[joindate], 
			[USERS].[credits], 
			[USERS].[posts], 
			[USERS].[email], 
			[USERS].[lastactivity], 
			[USERS].[oltime], 
			[USERS].[location] 
		FROM (SELECT ROW_NUMBER() OVER(ORDER BY [dnt_users].[posts] DESC ) AS ROWID,
			[dnt_users].[uid], 
			[dnt_users].[groupid], 
			[dnt_users].[username], 
			[dnt_users].[nickname], 
			[dnt_users].[joindate], 
			[dnt_users].[credits], 
			[dnt_users].[posts], 
			[dnt_users].[email], 
			[dnt_users].[lastactivity], 
			[dnt_users].[oltime], 
			[dnt_userfields].[location]
		FROM [dnt_users]
		LEFT JOIN [dnt_userfields] ON [dnt_userfields].[uid] = [dnt_users].[uid]) AS USERS
		WHERE ROWID BETWEEN @startRow AND @endRow
	END
	ELSE IF (@column = 'admin')
	BEGIN
		SELECT 
			[USERS].[uid], 
			[USERS].[groupid], 
			[USERS].[username], 
			[USERS].[nickname], 
			[USERS].[joindate], 
			[USERS].[credits], 
			[USERS].[posts], 
			[USERS].[email], 
			[USERS].[lastactivity], 
			[USERS].[oltime], 
			[USERS].[location] 
		FROM (SELECT ROW_NUMBER() OVER(ORDER BY [dnt_users].[adminid] ASC ) AS ROWID,
			[dnt_users].[uid], 
			[dnt_users].[groupid], 
			[dnt_users].[username], 
			[dnt_users].[nickname], 
			[dnt_users].[joindate], 
			[dnt_users].[credits], 
			[dnt_users].[posts], 
			[dnt_users].[email], 
			[dnt_users].[lastactivity], 
			[dnt_users].[oltime], 
			[dnt_userfields].[location]
		FROM [dnt_users]
		LEFT JOIN [dnt_userfields] ON [dnt_userfields].[uid] = [dnt_users].[uid] WHERE [dnt_users].[adminid] > 0) AS USERS
		WHERE ROWID BETWEEN @startRow AND @endRow
	END
	ELSE IF (@column = 'lastactivity')
	BEGIN
		SELECT 
			[USERS].[uid], 
			[USERS].[groupid], 
			[USERS].[username], 
			[USERS].[nickname], 
			[USERS].[joindate], 
			[USERS].[credits], 
			[USERS].[posts], 
			[USERS].[email], 
			[USERS].[lastactivity], 
			[USERS].[oltime], 
			[USERS].[location] 
		FROM (SELECT ROW_NUMBER() OVER(ORDER BY [dnt_users].[lastactivity] DESC ) AS ROWID,
			[dnt_users].[uid], 
			[dnt_users].[groupid], 
			[dnt_users].[username], 
			[dnt_users].[nickname], 
			[dnt_users].[joindate], 
			[dnt_users].[credits], 
			[dnt_users].[posts], 
			[dnt_users].[email], 
			[dnt_users].[lastactivity], 
			[dnt_users].[oltime], 
			[dnt_userfields].[location]
		FROM [dnt_users]
		LEFT JOIN [dnt_userfields] ON [dnt_userfields].[uid] = [dnt_users].[uid]) AS USERS
		WHERE ROWID BETWEEN @startRow AND @endRow
	END
	ELSE IF (@column = 'joindate')
	BEGIN
		SELECT 
			[USERS].[uid], 
			[USERS].[groupid], 
			[USERS].[username], 
			[USERS].[nickname], 
			[USERS].[joindate], 
			[USERS].[credits], 
			[USERS].[posts], 
			[USERS].[email], 
			[USERS].[lastactivity], 
			[USERS].[oltime], 
			[USERS].[location] 
		FROM (SELECT ROW_NUMBER() OVER(ORDER BY [dnt_users].[joindate] DESC ) AS ROWID,
			[dnt_users].[uid], 
			[dnt_users].[groupid], 
			[dnt_users].[username], 
			[dnt_users].[nickname], 
			[dnt_users].[joindate], 
			[dnt_users].[credits], 
			[dnt_users].[posts], 
			[dnt_users].[email], 
			[dnt_users].[lastactivity], 
			[dnt_users].[oltime], 
			[dnt_userfields].[location]
		FROM [dnt_users]
		LEFT JOIN [dnt_userfields] ON [dnt_userfields].[uid] = [dnt_users].[uid]) AS USERS
		WHERE ROWID BETWEEN @startRow AND @endRow
	END
	ELSE IF (@column = 'oltime')
	BEGIN
		SELECT 
			[USERS].[uid], 
			[USERS].[groupid], 
			[USERS].[username], 
			[USERS].[nickname], 
			[USERS].[joindate], 
			[USERS].[credits], 
			[USERS].[posts], 
			[USERS].[email], 
			[USERS].[lastactivity], 
			[USERS].[oltime], 
			[USERS].[location] 
		FROM (SELECT ROW_NUMBER() OVER(ORDER BY [dnt_users].[oltime] DESC ) AS ROWID,
			[dnt_users].[uid], 
			[dnt_users].[groupid], 
			[dnt_users].[username], 
			[dnt_users].[nickname], 
			[dnt_users].[joindate], 
			[dnt_users].[credits], 
			[dnt_users].[posts], 
			[dnt_users].[email], 
			[dnt_users].[lastactivity], 
			[dnt_users].[oltime], 
			[dnt_userfields].[location]
		FROM [dnt_users]
		LEFT JOIN [dnt_userfields] ON [dnt_userfields].[uid] = [dnt_users].[uid]) AS USERS
		WHERE ROWID BETWEEN @startRow AND @endRow
	END
	ELSE
	BEGIN
		SELECT 
			[USERS].[uid], 
			[USERS].[groupid], 
			[USERS].[username], 
			[USERS].[nickname], 
			[USERS].[joindate], 
			[USERS].[credits], 
			[USERS].[posts], 
			[USERS].[email], 
			[USERS].[lastactivity], 
			[USERS].[oltime], 
			[USERS].[location] 
		FROM (SELECT ROW_NUMBER() OVER(ORDER BY [dnt_users].[uid] DESC ) AS ROWID,
			[dnt_users].[uid], 
			[dnt_users].[groupid], 
			[dnt_users].[username], 
			[dnt_users].[nickname], 
			[dnt_users].[joindate], 
			[dnt_users].[credits], 
			[dnt_users].[posts], 
			[dnt_users].[email], 
			[dnt_users].[lastactivity], 
			[dnt_users].[oltime], 
			[dnt_userfields].[location]
		FROM [dnt_users]
		LEFT JOIN [dnt_userfields] ON [dnt_userfields].[uid] = [dnt_users].[uid]) AS USERS
		WHERE ROWID BETWEEN @startRow AND @endRow
	END
END
ELSE
BEGIN
	IF (@column = 'username')
	BEGIN
		SELECT 
			[USERS].[uid], 
			[USERS].[groupid], 
			[USERS].[username], 
			[USERS].[nickname], 
			[USERS].[joindate], 
			[USERS].[credits], 
			[USERS].[posts], 
			[USERS].[email], 
			[USERS].[lastactivity], 
			[USERS].[oltime], 
			[USERS].[location] 
		FROM (SELECT ROW_NUMBER() OVER(ORDER BY [dnt_users].[username] ASC ) AS ROWID,
			[dnt_users].[uid], 
			[dnt_users].[groupid], 
			[dnt_users].[username], 
			[dnt_users].[nickname], 
			[dnt_users].[joindate], 
			[dnt_users].[credits], 
			[dnt_users].[posts], 
			[dnt_users].[email], 
			[dnt_users].[lastactivity], 
			[dnt_users].[oltime], 
			[dnt_userfields].[location]
		FROM [dnt_users]
		LEFT JOIN [dnt_userfields] ON [dnt_userfields].[uid] = [dnt_users].[uid]) AS USERS
		WHERE ROWID BETWEEN @startRow AND @endRow
	END
	ELSE IF (@column = 'credits')
	BEGIN
		SELECT 
			[USERS].[uid], 
			[USERS].[groupid], 
			[USERS].[username], 
			[USERS].[nickname], 
			[USERS].[joindate], 
			[USERS].[credits], 
			[USERS].[posts], 
			[USERS].[email], 
			[USERS].[lastactivity], 
			[USERS].[oltime], 
			[USERS].[location] 
		FROM (SELECT ROW_NUMBER() OVER(ORDER BY [dnt_users].[credits] ASC ) AS ROWID,
			[dnt_users].[uid], 
			[dnt_users].[groupid], 
			[dnt_users].[username], 
			[dnt_users].[nickname], 
			[dnt_users].[joindate], 
			[dnt_users].[credits], 
			[dnt_users].[posts], 
			[dnt_users].[email], 
			[dnt_users].[lastactivity], 
			[dnt_users].[oltime], 
			[dnt_userfields].[location]
		FROM [dnt_users]
		LEFT JOIN [dnt_userfields] ON [dnt_userfields].[uid] = [dnt_users].[uid]) AS USERS
		WHERE ROWID BETWEEN @startRow AND @endRow
	END
	ELSE IF (@column = 'posts')
	BEGIN
		SELECT 
			[USERS].[uid], 
			[USERS].[groupid], 
			[USERS].[username], 
			[USERS].[nickname], 
			[USERS].[joindate], 
			[USERS].[credits], 
			[USERS].[posts], 
			[USERS].[email], 
			[USERS].[lastactivity], 
			[USERS].[oltime], 
			[USERS].[location] 
		FROM (SELECT ROW_NUMBER() OVER(ORDER BY [dnt_users].[posts] ASC ) AS ROWID,
			[dnt_users].[uid], 
			[dnt_users].[groupid], 
			[dnt_users].[username], 
			[dnt_users].[nickname], 
			[dnt_users].[joindate], 
			[dnt_users].[credits], 
			[dnt_users].[posts], 
			[dnt_users].[email], 
			[dnt_users].[lastactivity], 
			[dnt_users].[oltime], 
			[dnt_userfields].[location]
		FROM [dnt_users]
		LEFT JOIN [dnt_userfields] ON [dnt_userfields].[uid] = [dnt_users].[uid]) AS USERS
		WHERE ROWID BETWEEN @startRow AND @endRow
	END
	ELSE IF (@column = 'admin')
	BEGIN
		SELECT 
			[USERS].[uid], 
			[USERS].[groupid], 
			[USERS].[username], 
			[USERS].[nickname], 
			[USERS].[joindate], 
			[USERS].[credits], 
			[USERS].[posts], 
			[USERS].[email], 
			[USERS].[lastactivity], 
			[USERS].[oltime], 
			[USERS].[location] 
		FROM (SELECT ROW_NUMBER() OVER(ORDER BY [dnt_users].[adminid] DESC ) AS ROWID,
			[dnt_users].[uid], 
			[dnt_users].[groupid], 
			[dnt_users].[username], 
			[dnt_users].[nickname], 
			[dnt_users].[joindate], 
			[dnt_users].[credits], 
			[dnt_users].[posts], 
			[dnt_users].[email], 
			[dnt_users].[lastactivity], 
			[dnt_users].[oltime], 
			[dnt_userfields].[location]
		FROM [dnt_users]
		LEFT JOIN [dnt_userfields] ON [dnt_userfields].[uid] = [dnt_users].[uid] WHERE [dnt_users].[adminid] > 0) AS USERS
		WHERE ROWID BETWEEN @startRow AND @endRow
	END
	ELSE IF (@column = 'lastactivity')
	BEGIN
		SELECT 
			[USERS].[uid], 
			[USERS].[groupid], 
			[USERS].[username], 
			[USERS].[nickname], 
			[USERS].[joindate], 
			[USERS].[credits], 
			[USERS].[posts], 
			[USERS].[email], 
			[USERS].[lastactivity], 
			[USERS].[oltime], 
			[USERS].[location] 
		FROM (SELECT ROW_NUMBER() OVER(ORDER BY [dnt_users].[lastactivity] ASC ) AS ROWID,
			[dnt_users].[uid], 
			[dnt_users].[groupid], 
			[dnt_users].[username], 
			[dnt_users].[nickname], 
			[dnt_users].[joindate], 
			[dnt_users].[credits], 
			[dnt_users].[posts], 
			[dnt_users].[email], 
			[dnt_users].[lastactivity], 
			[dnt_users].[oltime], 
			[dnt_userfields].[location]
		FROM [dnt_users]
		LEFT JOIN [dnt_userfields] ON [dnt_userfields].[uid] = [dnt_users].[uid]) AS USERS
		WHERE ROWID BETWEEN @startRow AND @endRow
	END
	ELSE IF (@column = 'joindate')
	BEGIN
		SELECT 
			[USERS].[uid], 
			[USERS].[groupid], 
			[USERS].[username], 
			[USERS].[nickname], 
			[USERS].[joindate], 
			[USERS].[credits], 
			[USERS].[posts], 
			[USERS].[email], 
			[USERS].[lastactivity], 
			[USERS].[oltime], 
			[USERS].[location] 
		FROM (SELECT ROW_NUMBER() OVER(ORDER BY [dnt_users].[joindate] ASC ) AS ROWID,
			[dnt_users].[uid], 
			[dnt_users].[groupid], 
			[dnt_users].[username], 
			[dnt_users].[nickname], 
			[dnt_users].[joindate], 
			[dnt_users].[credits], 
			[dnt_users].[posts], 
			[dnt_users].[email], 
			[dnt_users].[lastactivity], 
			[dnt_users].[oltime], 
			[dnt_userfields].[location]
		FROM [dnt_users]
		LEFT JOIN [dnt_userfields] ON [dnt_userfields].[uid] = [dnt_users].[uid]) AS USERS
		WHERE ROWID BETWEEN @startRow AND @endRow
	END
	ELSE IF (@column = 'oltime')
	BEGIN
		SELECT 
			[USERS].[uid], 
			[USERS].[groupid], 
			[USERS].[username], 
			[USERS].[nickname], 
			[USERS].[joindate], 
			[USERS].[credits], 
			[USERS].[posts], 
			[USERS].[email], 
			[USERS].[lastactivity], 
			[USERS].[oltime], 
			[USERS].[location] 
		FROM (SELECT ROW_NUMBER() OVER(ORDER BY [dnt_users].[oltime] ASC ) AS ROWID,
			[dnt_users].[uid], 
			[dnt_users].[groupid], 
			[dnt_users].[username], 
			[dnt_users].[nickname], 
			[dnt_users].[joindate], 
			[dnt_users].[credits], 
			[dnt_users].[posts], 
			[dnt_users].[email], 
			[dnt_users].[lastactivity], 
			[dnt_users].[oltime], 
			[dnt_userfields].[location]
		FROM [dnt_users]
		LEFT JOIN [dnt_userfields] ON [dnt_userfields].[uid] = [dnt_users].[uid]) AS USERS
		WHERE ROWID BETWEEN @startRow AND @endRow
	END
	ELSE
	BEGIN
		SELECT 
			[USERS].[uid], 
			[USERS].[groupid], 
			[USERS].[username], 
			[USERS].[nickname], 
			[USERS].[joindate], 
			[USERS].[credits], 
			[USERS].[posts], 
			[USERS].[email], 
			[USERS].[lastactivity], 
			[USERS].[oltime], 
			[USERS].[location] 
		FROM (SELECT ROW_NUMBER() OVER(ORDER BY [dnt_users].[uid] ASC ) AS ROWID,
			[dnt_users].[uid], 
			[dnt_users].[groupid], 
			[dnt_users].[username], 
			[dnt_users].[nickname], 
			[dnt_users].[joindate], 
			[dnt_users].[credits], 
			[dnt_users].[posts], 
			[dnt_users].[email], 
			[dnt_users].[lastactivity], 
			[dnt_users].[oltime], 
			[dnt_userfields].[location]
		FROM [dnt_users]
		LEFT JOIN [dnt_userfields] ON [dnt_userfields].[uid] = [dnt_users].[uid]) AS USERS
		WHERE ROWID BETWEEN @startRow AND @endRow
	END
END
GO

CREATE PROCEDURE [dnt_neatenrelatetopic]
AS
BEGIN
	DECLARE @tagid int
	DECLARE [tag_cursor] CURSOR FOR	
	SELECT DISTINCT [tagid] FROM [dnt_topictags]
	OPEN [tag_cursor]
	FETCH NEXT FROM [tag_cursor] INTO @tagid
	WHILE @@FETCH_STATUS = 0
		BEGIN
			INSERT INTO [dnt_topictagcaches] 
			SELECT [t1].[tid],[t2].[tid],[t2].[title] FROM (SELECT [tid] FROM [dnt_topictags]
				WHERE [tagid] = @tagid) AS [t1],(SELECT [t].[tid],[t].[title] FROM [dnt_topics] AS [t],[dnt_topictags] AS [tt] 
				WHERE [tt].[tagid] = @tagid AND [t].[tid] = [tt].[tid] AND [t].[displayorder] >=0) AS [t2] 
			WHERE [t1].[tid] <> [t2].[tid] AND NOT EXISTS (SELECT 1 FROM [dnt_topictagcaches] WHERE [tid]=[t1].[tid] AND [linktid]=[t2].[tid])
			

			FETCH NEXT FROM [tag_cursor] INTO @tagid
		END
	CLOSE [tag_cursor]
	DEALLOCATE [tag_cursor]

END

GO


CREATE PROCEDURE [dnt_revisedebatetopicdiggs]
	@tid int,
	@opinion int,
	@count int out
AS
BEGIN
	SELECT @count=COUNT(1) FROM [dnt_postdebatefields] WHERE [tid] = @tid AND [opinion] = @opinion
	
	IF @opinion=1
	BEGIN
		UPDATE [dnt_debates] SET [positivediggs]=(SELECT SUM(diggs + 1) FROM [dnt_postdebatefields] WHERE [tid] = @tid AND [opinion] = @opinion) WHERE [tid] = @tid
	END
	ELSE
	BEGIN
		UPDATE [dnt_debates] SET [negativediggs]=(SELECT SUM(diggs + 1) FROM [dnt_postdebatefields] WHERE [tid] = @tid AND [opinion] = @opinion) WHERE [tid] = @tid
	END
END
GO


CREATE PROCEDURE [dnt_setlastexecutescheduledeventdatetime]
(
	@key VARCHAR(100),
	@servername VARCHAR(100),
	@lastexecuted DATETIME
)
AS
DELETE FROM [dnt_scheduledevents] WHERE ([key]=@key) AND ([lastexecuted] < DATEADD([day], - 7, GETDATE()))

INSERT [dnt_scheduledevents] ([key], [servername], [lastexecuted]) Values (@key, @servername, @lastexecuted)

GO


CREATE PROCEDURE [dnt_shrinklog]  
@DBName  nchar(50) 
AS
Begin
	exec('BACKUP LOG ['+@DBName+']  WITH NO_LOG')
	exec('DBCC  SHRINKDATABASE(['+@DBName+'])')
End


GO


CREATE PROCEDURE [dnt_updateadmingroup]
	@admingid smallint,
	@alloweditpost tinyint,
	@alloweditpoll tinyint,
	@allowstickthread tinyint,
	@allowmodpost tinyint,
	@allowdelpost tinyint,
	@allowmassprune tinyint,
	@allowrefund tinyint,
	@allowcensorword tinyint,
	@allowviewip tinyint,
	@allowbanip tinyint,
	@allowedituser tinyint,
	@allowmoduser tinyint,
	@allowbanuser tinyint,
	@allowpostannounce tinyint,
	@allowviewlog tinyint,
	@disablepostctrl tinyint,
	@allowviewrealname tinyint
AS
UPDATE [dnt_admingroups] SET 
	[alloweditpost]=@alloweditpost,
	[alloweditpoll]=@alloweditpoll,
	[allowstickthread]=@allowstickthread,
	[allowmodpost]=@allowmodpost,
	[allowdelpost]=@allowdelpost,
	[allowmassprune]=@allowmassprune,
	[allowrefund]=@allowrefund,
	[allowcensorword]=@allowcensorword,
	[allowviewip]=@allowviewip,
	[allowbanip]=@allowbanip,
	[allowedituser]=@allowedituser,
	[allowmoduser]=@allowmoduser,
	[allowbanuser]=@allowbanuser,
	[allowpostannounce]=@allowpostannounce,
	[allowviewlog]=@allowviewlog,
	[disablepostctrl]=@disablepostctrl,
	[allowviewrealname]=@allowviewrealname
WHERE [admingid]=@admingid
GO


CREATE PROCEDURE [dnt_updatepost1]
	@pid int,
	@title nvarchar(160),
	@message ntext,
	@lastedit nvarchar(50),
	@invisible int,
	@usesig int,
	@htmlon int,
	@smileyoff int,
	@bbcodeoff int,
	@parseurloff int
AS
UPDATE [dnt_posts1] SET 
	[title]=@title,
	[message]=@message,
	[lastedit]=@lastedit,
	[invisible]=@invisible,
	[usesig]=@usesig,
	[htmlon]=@htmlon,
	[smileyoff]=@smileyoff,
	[bbcodeoff]=@bbcodeoff,
	[parseurloff]=@parseurloff WHERE [pid]=@pid
GO

CREATE PROCEDURE [dnt_updatetopic]
	@tid int,
	@fid smallint,
	@iconid smallint,
	@title nchar(60),
	@typeid smallint,
	@readperm int,
	@price smallint,
	@poster char(20),
	@posterid int,
	@postdatetime smalldatetime,
	@lastpostid int,
	@lastpost smalldatetime,
	@lastposter char(20),
	@replies int,
	@displayorder int,
	@highlight varchar(500),
	@digest int,
	@rate int,
	@hide int,
	@special int,
	@attachment int,
	@moderated int,
	@closed int,
	@magic int
AS
UPDATE [dnt_topics] SET
	[fid]=@fid,
	[iconid]=@iconid,
	[title]=@title,
	[typeid]=@typeid,
	[readperm]=@readperm,
	[price]=@price,
	[poster]=@poster,
	[posterid]=@posterid,
	[postdatetime]=@postdatetime,
	[lastpostid]=@lastpostid,
	[lastpost]=@lastpost,
	[lastposter]=@lastposter,
	[replies]=@replies,
	[displayorder]=@displayorder,
	[highlight]=@highlight,
	[digest]=@digest,
	[rate]=@rate,
	[hide]=@hide,
	[special]=@special,
	[attachment]=@attachment,
	[moderated]=@moderated,
	[closed]=@closed,
	[magic]=@magic WHERE [tid]=@tid 
GO

CREATE PROCEDURE [dnt_updatetopicviewcount]
@tid int,
@viewcount int
AS
UPDATE [dnt_topics]  SET [views]= [views] + @viewcount WHERE [tid]=@tid
GO

CREATE PROCEDURE [dnt_updateuserauthstr]
	@uid int,
	@authstr char(20),
	@authflag int =1
AS
UPDATE [dnt_userfields] SET [authstr]=@authstr, [authtime] = GETDATE(), [authflag]=@authflag WHERE [uid]=@uid
GO

CREATE PROCEDURE [dnt_updateuserforumsetting]
	@uid int,
	@tpp int,
	@ppp int,
	@invisible int,
	@customstatus varchar(30)
AS
UPDATE [dnt_users] SET [tpp]=@tpp, [ppp]=@ppp, [invisible]=@invisible WHERE [uid]=@uid
UPDATE [dnt_userfields] SET [customstatus]=@customstatus WHERE [uid]=@uid
GO

CREATE PROCEDURE [dnt_updateuserpassword]
	@uid int,
	@password char(44)
AS
UPDATE [dnt_users] SET [password]=@password WHERE [uid]=@uid
GO

CREATE PROCEDURE [dnt_updateuserpreference]
	@uid int,
	@avatar varchar(255),
	@avatarwidth int,
	@avatarheight int,
	@templateid int
AS
UPDATE [dnt_userfields] SET [avatar]=@avatar, [avatarwidth]=@avatarwidth, [avatarheight]=@avatarheight WHERE [uid]=@uid
UPDATE [dnt_users] SET [templateid]=@templateid WHERE [uid]=@uid
GO

CREATE PROCEDURE [dnt_updateuserprofile]
	@uid int,
	@nickname nchar(20),
	@gender int,
	@email char(50),
	@bday char(10),
	@showemail int,
	@website nvarchar(80),
	@icq varchar(12),
	@qq varchar(12),
	@yahoo varchar(40),
	@msn varchar(40),
	@skype varchar(40),
	@location nvarchar(30),
	@bio nvarchar(500),
	@signature nvarchar(500),
	@sigstatus int,
	@sightml nvarchar(1000),
	@realname nvarchar(10),
	@idcard varchar(20),
	@mobile varchar(20),
	@phone varchar(20)
AS
UPDATE [dnt_users] SET [nickname]=@nickname, [gender]=@gender , [email]=@email , [bday]=@bday, [sigstatus]=@sigstatus, [showemail]=@showemail WHERE [uid]=@uid
UPDATE [dnt_userfields] SET [website]=@website , [icq]=@icq , [qq]=@qq , [yahoo]=@yahoo , [msn]=@msn , [skype]=@skype , [location]=@location , [bio]=@bio, [signature]=@signature, [sightml]=@sightml, [realname]=@realname,[idcard]=@idcard,[mobile]=@mobile,[phone]=@phone  WHERE [uid]=@uid
GO

CREATE PROCEDURE dnt_getforumnewtopics
@fid int
AS
DECLARE @strSQL VARCHAR(5000)
DECLARE @strMaxPostTableId VARCHAR(3)
SELECT @strMaxPostTableId=max([id]) FROM [dnt_tablelist]
					
SET @strSQL = 'SELECT TOP 20 [dnt_topics].[tid],[dnt_topics].[title],[dnt_topics].[poster],[dnt_topics].[postdatetime],[dnt_posts'+@strMaxPostTableId+'].[message] FROM [dnt_topics] LEFT JOIN [dnt_posts'+@strMaxPostTableId+'] ON [dnt_topics].[tid]=[dnt_posts'+@strMaxPostTableId+'].[tid]  WHERE [dnt_posts'+@strMaxPostTableId+'].[layer]=0 AND  [dnt_topics].[fid]='+LTRIM(STR(@fid))+' ORDER BY [lastpost] DESC'
EXEC(@strSQL)
GO

CREATE PROCEDURE [dnt_createtopictags]
@tags nvarchar(55),
@tid int,
@userid int,
@postdatetime datetime
AS
BEGIN
	EXEC [dnt_createtags] @tags, @userid, @postdatetime

	UPDATE [dnt_tags] SET [fcount]=[fcount]+1,[count]=[count]+1
	WHERE EXISTS (SELECT [item] FROM [dnt_split](@tags, ' ') AS [newtags] WHERE [newtags].[item] = [tagname])

	INSERT INTO [dnt_topictags] (tagid, tid)
	SELECT tagid, @tid FROM [dnt_tags] WHERE EXISTS (SELECT [item] FROM [dnt_split](@tags, ' ') WHERE [item] = [dnt_tags].[tagname])
END
GO

CREATE PROCEDURE [dnt_getfavoriteslistbyalbum]
@uid int,
@pagesize int,
@pageindex int
AS
DECLARE @strSQL varchar(5000)


SET @strSQL='SELECT [f].[tid], [f].[uid], [albumid], [albumcateid], [userid] AS [posterid], [username] AS [poster], [title], [description], [logo], [password], [imgcount], [views], [type], [createdatetime] AS [postdatetime] FROM [dnt_favorites] [f],[dnt_albums] [albums] WHERE [f].[tid]=[albums].[albumid] AND [f].[typeid]=1 AND [f].[uid]=' + STR(@uid)

IF @pageindex = 1
	BEGIN
		SET @strSQL = 'SELECT TOP ' + STR(@pagesize) +'  [tid], [uid], [albumid], [albumcateid], [posterid], [poster], [title], [description], [logo], [password], [imgcount], [views], [type], [postdatetime]  FROM (' + @strSQL + ') f' + '  ORDER BY [tid] DESC'
	END
ELSE
	BEGIN
		SET @strSQL = 'SELECT TOP ' + STR(@pagesize) +'  [tid], [uid], [albumid], [albumcateid], [posterid], [poster], [title], [description], [logo], [password], [imgcount], [views], [type], [postdatetime]  FROM (' + @strSQL + ') f1 WHERE [tid] < (SELECT MIN([tid]) FROM (SELECT TOP ' + STR((@pageindex-1)*@pagesize) + ' [tid] FROM (' + @strSQL + ') f2' + '  ORDER BY [tid] DESC) AS tblTmp)' + '  ORDER BY [tid] DESC'
	END

EXEC(@strSQL)
GO

IF OBJECT_ID('dnt_getnewtopics1','P') IS NOT NULL
DROP PROCEDURE [dnt_getnewtopics1]
GO

CREATE PROCEDURE [dnt_getnewtopics1]
	@fidlist VARCHAR(500)
	AS
	IF @fidlist <> ''
	BEGIN
	SELECT TOP(20) 
		[dnt_posts1].[tid], 
        [dnt_posts1].[title], 
        [dnt_posts1].[poster], 
        [dnt_posts1].[postdatetime], 
        [dnt_posts1].[message],
        [dnt_forums].[name] 
        FROM [dnt_posts1]  
        LEFT JOIN [dnt_forums] ON [dnt_posts1].[fid]=[dnt_forums].[fid]
        LEFT JOIN [dnt_topics] ON [dnt_posts1].[tid]=[dnt_topics].[tid]
        WHERE CHARINDEX(','+RTRIM([dnt_forums].[fid])+',', ','+@fidlist+',') > 0 
        AND [dnt_posts1].[layer]=0 AND [dnt_topics].[displayorder] >= 0
        ORDER BY [dnt_posts1].[tid] DESC
    END 
    ELSE
    BEGIN
	SELECT TOP(20) 
		[dnt_posts1].[tid], 
        [dnt_posts1].[title], 
        [dnt_posts1].[poster], 
        [dnt_posts1].[postdatetime], 
        [dnt_posts1].[message],
        [dnt_forums].[name] 
        FROM [dnt_posts1]
        LEFT JOIN [dnt_forums] ON [dnt_posts1].[fid]=[dnt_forums].[fid]
        LEFT JOIN [dnt_topics] ON [dnt_posts1].[tid]=[dnt_topics].[tid]
        WHERE [dnt_posts1].[layer]=0 AND [dnt_topics].[displayorder] >= 0
        ORDER BY [dnt_posts1].[tid] DESC
    END
GO


IF OBJECT_ID('dnt_getpostlistbycondition1','P') IS NOT NULL
DROP PROC [dnt_getpostlistbycondition1]
GO

CREATE PROCEDURE [dnt_getpostlistbycondition1]
@tid int,
@pagesize int,
@pageindex int,
@posterid int
AS
DECLARE @startRow int,
		@endRow int

SET @startRow = (@pageindex-1)*@pagesize
SET @endRow = @startRow + @pagesize - 1

SELECT 
POSTS.[pid], 
POSTS.[fid], 
POSTS.[title], 
POSTS.[layer],
POSTS.[message], 
POSTS.[ip], 
POSTS.[lastedit], 
POSTS.[postdatetime], 
POSTS.[attachment], 
POSTS.[poster], 
POSTS.[posterid], 
POSTS.[invisible], 
POSTS.[usesig], 
POSTS.[htmlon], 
POSTS.[smileyoff], 
POSTS.[parseurloff], 
POSTS.[bbcodeoff], 
POSTS.[rate], 
POSTS.[ratetimes], 
POSTS.[nickname],  
POSTS.[username], 
POSTS.[groupid], 
POSTS.[spaceid],
POSTS.[gender],
POSTS.[bday],
POSTS.[email], 
POSTS.[showemail], 
POSTS.[digestposts], 
POSTS.[credits], 
POSTS.[extcredits1], 
POSTS.[extcredits2], 
POSTS.[extcredits3], 
POSTS.[extcredits4], 
POSTS.[extcredits5], 
POSTS.[extcredits6], 
POSTS.[extcredits7], 
POSTS.[extcredits8], 
POSTS.[posts], 
POSTS.[joindate], 
POSTS.[onlinestate],
POSTS.[lastactivity],  
POSTS.[invisible] AS usersinvisible, 
POSTS.[avatar], 
POSTS.[avatarwidth],
POSTS.[avatarheight],
POSTS.[medals],
POSTS.[signature], 
POSTS.[location], 
POSTS.[customstatus], 
POSTS.[website], 
POSTS.[icq], 
POSTS.[qq], 
POSTS.[msn], 
POSTS.[yahoo], 
POSTS.[skype] 
FROM(SELECT ROW_NUMBER() OVER(ORDER BY [pid]) AS ROWID,
[dnt_posts1].[pid], 
[dnt_posts1].[fid], 
[dnt_posts1].[title], 
[dnt_posts1].[layer],
[dnt_posts1].[message], 
[dnt_posts1].[ip], 
[dnt_posts1].[lastedit], 
[dnt_posts1].[postdatetime], 
[dnt_posts1].[attachment], 
[dnt_posts1].[poster], 
[dnt_posts1].[posterid], 
[dnt_posts1].[invisible], 
[dnt_posts1].[usesig], 
[dnt_posts1].[htmlon], 
[dnt_posts1].[smileyoff], 
[dnt_posts1].[parseurloff], 
[dnt_posts1].[bbcodeoff], 
[dnt_posts1].[rate], 
[dnt_posts1].[ratetimes], 
[dnt_users].[nickname],  
[dnt_users].[username], 
[dnt_users].[groupid], 
[dnt_users].[spaceid],
[dnt_users].[gender],
[dnt_users].[bday],
[dnt_users].[email], 
[dnt_users].[showemail], 
[dnt_users].[digestposts], 
[dnt_users].[credits], 
[dnt_users].[extcredits1], 
[dnt_users].[extcredits2], 
[dnt_users].[extcredits3], 
[dnt_users].[extcredits4], 
[dnt_users].[extcredits5], 
[dnt_users].[extcredits6], 
[dnt_users].[extcredits7], 
[dnt_users].[extcredits8], 
[dnt_users].[posts], 
[dnt_users].[joindate], 
[dnt_users].[onlinestate],
[dnt_users].[lastactivity],  
[dnt_users].[invisible] AS usersinvisible, 
[dnt_userfields].[avatar], 
[dnt_userfields].[avatarwidth],
[dnt_userfields].[avatarheight],
[dnt_userfields].[medals],
[dnt_userfields].[sightml] AS signature, 
[dnt_userfields].[location], 
[dnt_userfields].[customstatus], 
[dnt_userfields].[website], 
[dnt_userfields].[icq], 
[dnt_userfields].[qq], 
[dnt_userfields].[msn], 
[dnt_userfields].[yahoo], 
[dnt_userfields].[skype]
FROM [dnt_posts1] 
LEFT JOIN [dnt_users] ON [dnt_users].[uid]=[dnt_posts1].[posterid] 
LEFT JOIN [dnt_userfields] ON [dnt_userfields].[uid]=[dnt_users].[uid]
WHERE [dnt_posts1].[tid]=@tid AND [dnt_posts1].[invisible]=0 AND [posterid]=@posterid) AS POSTS
WHERE ROWID BETWEEN @startROW AND @endROW
GO

CREATE PROCEDURE [dnt_getattentiontopics] 

@fid varchar(255)='',
@tpp int,
@pageid int,
@condition nvarchar(255)=''
AS

DECLARE @pagetop int,@strSQL varchar(5000)

SET @pagetop = (@pageid-1)*@tpp
IF @pageid = 1
	BEGIN
		SET @strSQL = 'SELECT TOP  ' +STR( @tpp) + '  * FROM [dnt_topics] WHERE [displayorder]>=0  AND [attention]=1'
                     	
		IF @fid<>'0'
                            SELECT  @strSQL=@strSQL+'  AND [fid] IN ('+@fid+')'


                            IF @condition<>''
                            SELECT  @strSQL=@strSQL+@condition

                           SELECT @strSQL=@strSQL+'  ORDER BY [lastpost] DESC'
                            

      
	END
ELSE
	BEGIN
		SET @strSQL = 'SELECT TOP  ' +STR( @tpp) + '  * FROM [dnt_topics]  WHERE [tid] < (SELECT MIN([tid])  FROM (SELECT TOP '+STR(@pagetop)+' [tid] FROM [dnt_topics]   WHERE [displayorder]>=0  AND [attention]=1'
		

		 IF @fid<>'0'
 
                            SELECT  @strSQL=@strSQL+'  AND [fid] IN ('+@fid+')'
                          


                            IF @condition<>''
                            SELECT  @strSQL=@strSQL+@condition
                     

                          SELECT @strSQL=@strSQL+'   ORDER BY [tid] DESC'


                          SELECT @strSQL=@strSQL+'  )  AS T) '

		 IF @fid<>'0'
 
                           SELECT  @strSQL=@strSQL+'  AND [fid] IN ('+@fid+')'

			    IF @condition<>''
                            SELECT  @strSQL=@strSQL+@condition


                           SELECT @strSQL=@strSQL+'  AND [displayorder]>=0  AND [attention]=1 ORDER BY [tid] DESC'

                                 
	END
EXEC(@strSQL)
GO

CREATE PROCEDURE [dnt_updateuser]
@username nchar(20),
@nickname nchar(20),
@password char(32),
@secques char(8),
@spaceid int,
@gender int,
@adminid int,
@groupid smallint,
@groupexpiry int,
@extgroupids char(60),
@regip char(15),
@joindate char(19),
@lastip char(15),
@lastvisit char(19),
@lastactivity char(19),
@lastpost char(19),
@lastpostid int,
@lastposttitle nchar(60),
@posts int,
@digestposts smallint,
@oltime int,
@pageviews int,
@credits int,
@extcredits1 float,
@extcredits2 float,
@extcredits3 float,
@extcredits4 float,
@extcredits5 float,
@extcredits6 float,
@extcredits7 float,
@extcredits8 float,
@avatarshowid int,
@email char(50),
@bday char(19),
@sigstatus int,
@tpp int,
@ppp int,
@templateid smallint,
@pmsound int,
@showemail int,
@newsletter int,
@invisible int,
@newpm int,
@newpmcount int,
@accessmasks int,
@onlinestate int,
@website varchar(80),
@icq varchar(12),
@qq varchar(12),
@yahoo varchar(40),
@msn varchar(40),
@skype varchar(40),
@location nvarchar(30),
@customstatus varchar(30),
@avatar varchar(255),
@avatarwidth int,
@avatarheight int,
@medals varchar(300),
@bio nvarchar(500),
@signature nvarchar(500),
@sightml nvarchar(1000),
@authstr varchar(20),
@authtime smalldatetime,
@authflag tinyint,
@realname nvarchar(10),
@idcard varchar(20),
@mobile varchar(20),
@phone varchar(20),
@ignorepm nvarchar(1000),
@uid int
AS

UPDATE [dnt_users] SET [username]=@username,[nickname]=@nickname, [password]=@password, [secques]=@secques, [spaceid]=@spaceid, [gender]=@gender, [adminid]=@adminid, [groupid]=@groupid, [groupexpiry]=@groupexpiry, 
[extgroupids]=@extgroupids, [regip]= @regip, [joindate]= @joindate, [lastip]=@lastip, [lastvisit]=@lastvisit, [lastactivity]=@lastactivity, [lastpost]=@lastpost, 
[lastpostid]=@lastpostid, [lastposttitle]=@lastposttitle, [posts]=@posts, [digestposts]=@digestposts, [oltime]=@oltime, [pageviews]=@pageviews, [credits]=@credits, 
[extcredits1]=@extcredits1, [extcredits2]=@extcredits2, [extcredits3]=@extcredits3, [extcredits4]=@extcredits4, [extcredits5]=@extcredits5, [extcredits6]=@extcredits6, 
[extcredits7]=@extcredits7, [extcredits8]=@extcredits8, [avatarshowid]=@avatarshowid, [email]=@email, [bday]=@bday, [sigstatus]=@sigstatus, [tpp]=@tpp, [ppp]=@ppp, 
[templateid]=@templateid, [pmsound]=@pmsound, [showemail]=@showemail, [newsletter]=@newsletter, [invisible]=@invisible, [newpm]=@newpm, [newpmcount]=@newpmcount, [accessmasks]=@accessmasks, [onlinestate]=@onlinestate 
WHERE [uid]=@uid

UPDATE [dnt_userfields] SET [website]=@website,[icq]=@icq,[qq]=@qq,[yahoo]=@yahoo,[msn]=@msn,[skype]=@skype,[location]=@location,[customstatus]=@customstatus,
[avatar]=@avatar,[avatarwidth]=@avatarwidth,[avatarheight]=@avatarheight,[medals]=@medals,[bio]=@bio,[signature]=@signature,[sightml]=@sightml,[authstr]=@authstr,
[authtime]=@authtime,[authflag]=@authflag,[realname]=@realname,[idcard]=@idcard,[mobile]=@mobile,[phone]=@phone,[ignorepm]=@ignorepm 
WHERE [uid]=@uid
GO

CREATE FUNCTION [dnt_split]
(
 @splitstring NVARCHAR(4000),
 @separator CHAR(1) = ','
)
RETURNS @splitstringstable TABLE
(
 [item] NVARCHAR(200)
)
AS
BEGIN
    DECLARE @currentindex INT
    DECLARE @nextindex INT
    DECLARE @returntext NVARCHAR(200)

    SELECT @currentindex=1

    WHILE(@currentindex<=datalength(@splitstring)/2)
    BEGIN
        SELECT @nextindex=charindex(@separator,@splitstring,@currentindex)
        IF(@nextindex=0 OR @nextindex IS NULL)
            SELECT @nextindex=datalength(@splitstring)/2+1
        
        SELECT @returntext=substring(@splitstring,@currentindex,@nextindex-@currentindex)

        INSERT INTO @splitstringstable([item])
        VALUES(@returntext)
        
        SELECT @currentindex=@nextindex+1
    END
    RETURN
END

GO

if exists (select * from sysobjects where id = object_id(N'[dnt_getindexforumlist]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_getindexforumlist]
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_getonlineuser]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_getonlineuser]
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_getonlineuserlist]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_getonlineuserlist]
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_getonlineuserlistbyfid]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_getonlineuserlistbyfid]
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_getrelatedtopics]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_getrelatedtopics]
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_gettopicinfo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_gettopicinfo]
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_createonlineuser]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_createonlineuser]
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_deleteonlineusers]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_deleteonlineusers]
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_updateuseronlinestates]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_updateuseronlinestates]
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_updateonlineaction]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_updateonlineaction]
GO

CREATE PROCEDURE [dnt_updateonlineaction] 
@action smallint,
@lastupdatetime datetime,
@forumid int,
@forumname nvarchar(100),
@titleid int,
@title nvarchar(160),
@olid int
AS

IF (@action =5 OR @action =6)
BEGIN
   UPDATE [dnt_online] SET [lastactivity]=[action],[action]=@action,[lastupdatetime]=@lastupdatetime,[lastposttime]= @lastupdatetime,[forumid]=@forumid,[forumname]=@forumname,[titleid]=@titleid,[title]=@title WHERE [olid]=@olid
END
ELSE
BEGIN
   UPDATE [dnt_online] SET [lastactivity]=[action],[action]=@action,[lastupdatetime]=@lastupdatetime,[forumid]=@forumid,[forumname]=@forumname,[titleid]=@titleid,[title]=@title WHERE [olid]=@olid
END
GO

IF OBJECT_ID('dnt_getindexforumlist','P') IS NOT NULL
DROP PROC [dnt_getindexforumlist]
GO

CREATE PROCEDURE [dnt_getindexforumlist]
AS
SELECT CASE WHEN DATEDIFF(n, [lastpost], GETDATE())<600 THEN 'new' ELSE 'old' END AS [havenew],
[dnt_forums].[allowbbcode],
[dnt_forums].[allowblog],
[dnt_forums].[alloweditrules],
[dnt_forums].[allowhtml],
[dnt_forums].[allowimgcode],
[dnt_forums].[allowpostspecial],
[dnt_forums].[allowrss],
[dnt_forums].[allowsmilies],
[dnt_forums].[allowspecialonly],
[dnt_forums].[allowtag],
[dnt_forums].[allowthumbnail],	
[dnt_forums].[autoclose],	
[dnt_forums].[colcount],
[dnt_forums].[curtopics],
[dnt_forums].[disablewatermark],
[dnt_forums].[displayorder],
[dnt_forums].[fid],
[dnt_forums].[inheritedmod],
[dnt_forums].[istrade],
[dnt_forums].[jammer],
[dnt_forums].[lastpost],
[dnt_forums].[lastposter],
[dnt_forums].[lastposterid],
[dnt_forums].[lasttid],
[dnt_forums].[lasttitle],
[dnt_forums].[layer],
[dnt_forums].[modnewposts],
[dnt_forums].[name],
[dnt_forums].[parentid],
[dnt_forums].[parentidlist],
[dnt_forums].[pathlist],
[dnt_forums].[posts],
[dnt_forums].[recyclebin],
[dnt_forums].[status],
[dnt_forums].[subforumcount],
[dnt_forums].[templateid],
[dnt_forums].[todayposts],
[dnt_forums].[topics],
[dnt_forumfields].[applytopictype],
[dnt_forumfields].[attachextensions],
[dnt_forumfields].[description],
[dnt_forumfields].[fid],
[dnt_forumfields].[getattachperm],
[dnt_forumfields].[icon],
[dnt_forumfields].[moderators],
[dnt_forumfields].[password],
[dnt_forumfields].[permuserlist],
[dnt_forumfields].[postattachperm],
[dnt_forumfields].[postbytopictype],
[dnt_forumfields].[postcredits],
[dnt_forumfields].[postperm],
[dnt_forumfields].[redirect],
[dnt_forumfields].[replycredits],
[dnt_forumfields].[replyperm],
[dnt_forumfields].[rewritename],
[dnt_forumfields].[rules],
[dnt_forumfields].[seodescription],
[dnt_forumfields].[seokeywords],
[dnt_forumfields].[topictypeprefix],
[dnt_forumfields].[topictypes],
[dnt_forumfields].[viewbytopictype],
[dnt_forumfields].[viewperm]
FROM [dnt_forums] 
LEFT JOIN [dnt_forumfields] ON [dnt_forums].[fid]=[dnt_forumfields].[fid] 
WHERE [dnt_forums].[parentid] NOT IN (SELECT [fid] FROM [dnt_forums] WHERE [status] < 1 AND [layer] = 0) 
AND [dnt_forums].[status] > 0 AND [layer] <= 1 ORDER BY [displayorder]
GO

CREATE PROCEDURE [dnt_getonlineuser]
@userid int,
@password char(32)
AS
SELECT TOP 1 [olid]
      ,[userid]
      ,[ip]
      ,[username]
      ,[nickname]
      ,[password]
      ,[groupid]
      ,[olimg]
      ,[adminid]
      ,[invisible]
      ,[action]
      ,[lastactivity]
      ,[lastposttime]
      ,[lastpostpmtime]
      ,[lastsearchtime]
      ,[lastupdatetime]
      ,[forumid]
      ,[forumname]
      ,[titleid]
      ,[title]
      ,[verifycode]
      ,[newpms]
      ,[newnotices] FROM [dnt_online] WHERE [userid]=@userid AND [password]=@password
GO

CREATE PROCEDURE [dnt_getonlineuserlist]
AS
SELECT [olid]
      ,[userid]
      ,[ip]
      ,[username]
      ,[nickname]
      ,[password]
      ,[groupid]
      ,[olimg]
      ,[adminid]
      ,[invisible]
      ,[action]
      ,[lastactivity]
      ,[lastposttime]
      ,[lastpostpmtime]
      ,[lastsearchtime]
      ,[lastupdatetime]
      ,[forumid]
      ,[forumname]
      ,[titleid]
      ,[title]
      ,[verifycode]
      ,[newpms]
      ,[newnotices] FROM [dnt_online]
GO

CREATE PROCEDURE [dnt_getonlineuserlistbyfid]
@fid int
AS
SELECT [olid]
      ,[userid]
      ,[ip]
      ,[username]
      ,[nickname]
      ,[password]
      ,[groupid]
      ,[olimg]
      ,[adminid]
      ,[invisible]
      ,[action]
      ,[lastactivity]
      ,[lastposttime]
      ,[lastpostpmtime]
      ,[lastsearchtime]
      ,[lastupdatetime]
      ,[forumid]
      ,[forumname]
      ,[titleid]
      ,[title]
      ,[verifycode]
      ,[newpms]
      ,[newnotices] FROM [dnt_online] WHERE [forumid]=@fid
GO

IF OBJECT_ID('dnt_getrelatedtopics','P') IS NOT NULL
DROP PROCEDURE [dnt_getrelatedtopics]
GO

CREATE PROCEDURE [dnt_getrelatedtopics]
@count int,
@tid int
AS

SELECT TOP(@count) 
[dnt_topictagcaches].[linktid],
[dnt_topictagcaches].[linktitle],
[dnt_topictagcaches].[tid]
FROM [dnt_topictagcaches] WHERE [tid]=@tid ORDER BY [linktid] DESC
GO

CREATE PROCEDURE [dnt_gettopicinfo]
@tid int,
@fid int,
@mode int
AS
IF @mode = 1
	BEGIN
       SELECT TOP 1 [tid]
      ,[fid]
      ,[iconid]
      ,[readperm]
      ,[price]
      ,[poster]
      ,[posterid]
      ,[title]
      ,[postdatetime]
      ,[lastpost]
      ,[lastpostid]
      ,[lastposter]
      ,[lastposterid]
      ,[views]
      ,[replies]
      ,[displayorder]
      ,[highlight]
      ,[digest]
      ,[hide]
      ,[attachment]
      ,[moderated]
      ,[closed]
      ,[magic]
      ,[identify]
      ,[special]
      ,[typeid]
      ,[rate]
      ,[attention] FROM [dnt_topics] WHERE [fid]=@fid AND [tid]<@tid AND [displayorder]>=0 ORDER BY [tid] DESC
	END
ELSE IF @mode = 2
	BEGIN
       SELECT TOP 1 [tid]
      ,[fid]
      ,[iconid]
      ,[readperm]
      ,[price]
      ,[poster]
      ,[posterid]
      ,[title]
      ,[postdatetime]
      ,[lastpost]
      ,[lastpostid]
      ,[lastposter]
      ,[lastposterid]
      ,[views]
      ,[replies]
      ,[displayorder]
      ,[highlight]
      ,[digest]
      ,[hide]
      ,[attachment]
      ,[moderated]
      ,[closed]
      ,[magic]
      ,[identify]
      ,[special]
      ,[typeid]
      ,[rate]
      ,[attention] FROM [dnt_topics] WHERE [fid]=@fid AND [tid]>@tid AND [displayorder]>=0 ORDER BY [tid] ASC
	END
ELSE
	BEGIN
       SELECT TOP 1 [tid]
      ,[fid]
      ,[iconid]
      ,[readperm]
      ,[price]
      ,[poster]
      ,[posterid]
      ,[title]
      ,[postdatetime]
      ,[lastpost]
      ,[lastpostid]
      ,[lastposter]
      ,[lastposterid]
      ,[views]
      ,[replies]
      ,[displayorder]
      ,[highlight]
      ,[digest]
      ,[hide]
      ,[attachment]
      ,[moderated]
      ,[closed]
      ,[magic]
      ,[identify]
      ,[special]
      ,[typeid]
      ,[rate]
      ,[attention] FROM [dnt_topics] WHERE [tid]=@tid
	END
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_gettopictags]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_gettopictags]
GO

CREATE PROCEDURE [dnt_gettopictags]
@topicid int
AS

SELECT 
t.[color],
t.[count],
t.[fcount],
t.[gcount],
t.[orderid],
t.[pcount],
t.[postdatetime],
t.[scount],
t.[tagid],
t.[tagname],
t.[userid],
t.[vcount]
FROM [dnt_tags] t, [dnt_topictags] tt 
WHERE tt.[tagid] = t.[tagid] AND tt.[tid] = @topicid 
ORDER BY [orderid]
GO

CREATE PROCEDURE [dnt_createonlineuser] 
@onlinestate int,
@userid int,
@ip varchar(15),
@username nvarchar(40),
@nickname nvarchar(40),
@password char(32),
@groupid smallint,
@olimg varchar(80),
@adminid smallint,
@invisible smallint,
@action smallint,
@lastactivity smallint,
@lastposttime datetime,
@lastpostpmtime datetime,
@lastsearchtime datetime,
@lastupdatetime datetime,
@forumid int,
@forumname nvarchar(50),
@titleid int,
@title nvarchar(80),
@verifycode varchar(10),
@newpms smallint,
@newnotices smallint

AS

IF @onlinestate = 0
BEGIN
	UPDATE [dnt_users] SET [onlinestate]=1 WHERE [uid]=@userid
END


INSERT INTO [dnt_online] ([userid],[ip],[username],[nickname],[password],[groupid],[olimg],[adminid],[invisible],[action],[lastactivity],[lastposttime],[lastpostpmtime],[lastsearchtime],[lastupdatetime],[forumid],[forumname],[titleid],[title],[verifycode],[newpms],[newnotices])VALUES(@userid,@ip,@username,@nickname,@password,@groupid,@olimg,@adminid,@invisible,@action,@lastactivity,@lastposttime,@lastpostpmtime,@lastsearchtime,@lastupdatetime,@forumid,@forumname,@titleid,@title,@verifycode,@newpms,@newnotices);SELECT SCOPE_IDENTITY()
GO

IF OBJECT_ID('dnt_deleteonlineusers','P') IS NOT NULL
DROP PROCEDURE [dnt_deleteonlineusers]
GO

CREATE PROCEDURE [dnt_deleteonlineusers] 
@olidlist varchar(5000) = ''
AS

DELETE FROM [dnt_online] WHERE CHARINDEX(','+RTRIM([olid])+',', ','+@olidlist+',') > 0
GO

IF OBJECT_ID('dnt_getindexforumlist','P') IS NOT NULL
DROP PROC [dnt_getindexforumlist]
GO

CREATE PROCEDURE [dnt_getindexforumlist]
AS
SELECT CASE WHEN DATEDIFF(n, [lastpost], GETDATE())<600 THEN 'new' ELSE 'old' END AS [havenew],
[dnt_forums].[allowbbcode],
[dnt_forums].[allowblog],
[dnt_forums].[alloweditrules],
[dnt_forums].[allowhtml],
[dnt_forums].[allowimgcode],
[dnt_forums].[allowpostspecial],
[dnt_forums].[allowrss],
[dnt_forums].[allowsmilies],
[dnt_forums].[allowspecialonly],
[dnt_forums].[allowtag],
[dnt_forums].[allowthumbnail],	
[dnt_forums].[autoclose],	
[dnt_forums].[colcount],
[dnt_forums].[curtopics],
[dnt_forums].[disablewatermark],
[dnt_forums].[displayorder],
[dnt_forums].[fid],
[dnt_forums].[inheritedmod],
[dnt_forums].[istrade],
[dnt_forums].[jammer],
[dnt_forums].[lastpost],
[dnt_forums].[lastposter],
[dnt_forums].[lastposterid],
[dnt_forums].[lasttid],
[dnt_forums].[lasttitle],
[dnt_forums].[layer],
[dnt_forums].[modnewposts],
[dnt_forums].[name],
[dnt_forums].[parentid],
[dnt_forums].[parentidlist],
[dnt_forums].[pathlist],
[dnt_forums].[posts],
[dnt_forums].[recyclebin],
[dnt_forums].[status],
[dnt_forums].[subforumcount],
[dnt_forums].[templateid],
[dnt_forums].[todayposts],
[dnt_forums].[topics],
[dnt_forumfields].[applytopictype],
[dnt_forumfields].[attachextensions],
[dnt_forumfields].[description],
[dnt_forumfields].[fid],
[dnt_forumfields].[getattachperm],
[dnt_forumfields].[icon],
[dnt_forumfields].[moderators],
[dnt_forumfields].[password],
[dnt_forumfields].[permuserlist],
[dnt_forumfields].[postattachperm],
[dnt_forumfields].[postbytopictype],
[dnt_forumfields].[postcredits],
[dnt_forumfields].[postperm],
[dnt_forumfields].[redirect],
[dnt_forumfields].[replycredits],
[dnt_forumfields].[replyperm],
[dnt_forumfields].[rewritename],
[dnt_forumfields].[rules],
[dnt_forumfields].[seodescription],
[dnt_forumfields].[seokeywords],
[dnt_forumfields].[topictypeprefix],
[dnt_forumfields].[topictypes],
[dnt_forumfields].[viewbytopictype],
[dnt_forumfields].[viewperm]
FROM [dnt_forums] 
LEFT JOIN [dnt_forumfields] ON [dnt_forums].[fid]=[dnt_forumfields].[fid] 
WHERE [dnt_forums].[parentid] NOT IN (SELECT [fid] FROM [dnt_forums] WHERE [status] < 1 AND [layer] = 0) 
AND [dnt_forums].[status] > 0 AND [layer] <= 1 ORDER BY [displayorder]
GO

IF OBJECT_ID('dnt_updateuseronlinestates','P') IS NOT NULL
DROP PROCEDURE [dnt_updateuseronlinestates]
GO

CREATE PROCEDURE [dnt_updateuseronlinestates] 
@uidlist varchar(5000) = '' 
AS

UPDATE [dnt_users] SET [onlinestate]=0,[lastactivity]=GETDATE() WHERE CHARINDEX(','+RTRIM([uid])+',', ','+@uidlist+',') > 0
GO

IF OBJECT_ID('dnt_getonlineuserbyip','P') IS NOT NULL
DROP PROCEDURE [dnt_getonlineuserbyip]
GO

CREATE PROCEDURE [dnt_getonlineuserbyip]
@userid int,
@ip varchar(15)
AS

SELECT TOP 1 [olid]
      ,[userid]
      ,[ip]
      ,[username]
      ,[nickname]
      ,[password]
      ,[groupid]
      ,[olimg]
      ,[adminid]
      ,[invisible]
      ,[action]
      ,[lastactivity]
      ,[lastposttime]
      ,[lastpostpmtime]
      ,[lastsearchtime]
      ,[lastupdatetime]
      ,[forumid]
      ,[forumname]
      ,[titleid]
      ,[title]
      ,[verifycode]
      ,[newpms]
      ,[newnotices] FROM [dnt_online] WHERE [userid]=@userid AND [ip]=@ip
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_gettodayuploadedfilesize]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_gettodayuploadedfilesize]
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_getuseridbyemail]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_getuseridbyemail]
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_getuserinfobyip]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_getuserinfobyip]
GO

IF OBJECT_ID('dnt_getreplypid1','P') IS NOT NULL
DROP PROCEDURE [dnt_getreplypid1]
GO

CREATE PROCEDURE [dnt_getreplypid1]
@uid int,
@tid int

AS
SELECT TOP 1 [pid] FROM [dnt_posts1] WHERE [tid] =@tid AND [posterid]=@uid
GO

CREATE PROCEDURE [dnt_gettodayuploadedfilesize] 
@uid int

AS

SELECT SUM([filesize]) AS [todaysize] FROM [dnt_attachments] WHERE [uid]=@uid AND DATEDIFF(d,[postdatetime],GETDATE())=0
GO

CREATE PROCEDURE [dnt_getuseridbyemail]
@email char(50)
AS

SELECT TOP 1 [uid] FROM [dnt_users] WHERE [email]=@email
GO

CREATE PROCEDURE [dnt_getuserinfobyip]
@regip char(15)
AS

SELECT TOP 1 [u].[uid], [u].[username], [u].[nickname], [u].[password], [u].[secques], [u].[spaceid], [u].[gender], [u].[adminid], [u].[groupid], [u].[groupexpiry], [u].[extgroupids], [u].[regip], [u].[joindate], [u].[lastip], [u].[lastvisit], [u].[lastactivity], [u].[lastpost], [u].[lastpostid], [u].[lastposttitle], [u].[posts], [u].[digestposts], [u].[oltime], [u].[pageviews], [u].[credits], [u].[extcredits1], [u].[extcredits2], [u].[extcredits3], [u].[extcredits4], [u].[extcredits5], [u].[extcredits6], [u].[extcredits7], [u].[extcredits8], [u].[avatarshowid], [u].[email], [u].[bday], [u].[sigstatus], [u].[tpp], [u].[ppp], [u].[templateid], [u].[pmsound], [u].[showemail], [u].[invisible], [u].[newpm], [u].[newpmcount], [u].[accessmasks], [u].[onlinestate], [u].[newsletter],[u].[salt], [uf].[website], [uf].[icq], [uf].[qq], [uf].[yahoo], [uf].[msn], [uf].[skype], [uf].[location], [uf].[customstatus], [uf].[avatar], [uf].[avatarwidth], [uf].[avatarheight], [uf].[medals], [uf].[bio], [uf].[signature], [uf].[sightml], [uf].[authstr], [uf].[authtime], [uf].[authflag], [uf].[realname], [uf].[idcard], [uf].[mobile], [uf].[phone], [uf].[ignorepm] FROM [dnt_users] [u] LEFT JOIN [dnt_userfields] [uf] ON [u].[uid]=[uf].[uid] WHERE [u].[regip]=@regip ORDER BY [u].[uid] DESC
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_getnoticebyuid]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_getnoticebyuid]
GO

CREATE PROCEDURE [dnt_getnoticebyuid]
@uid int,
@type int

AS

IF @type = 0
     SELECT nid, uid, type, new, posterid, poster, note, postdatetime FROM [dnt_notices] WHERE [uid] = @uid  ORDER BY [postdatetime] DESC
ELSE
    SELECT nid, uid, type, new, posterid, poster, note, postdatetime  FROM [dnt_notices] WHERE [uid] = @uid AND [type] = @type ORDER BY [postdatetime] DESC
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_createnotice]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_createnotice]
GO

CREATE PROCEDURE [dnt_createnotice]
@uid int,
@type int,
@new  int,
@posterid int,
@poster nchar(20),
@note ntext,
@postdatetime datetime

AS

INSERT INTO [dnt_notices] ([uid], [type], [new], [posterid], [poster], [note], [postdatetime]) VALUES (@uid, @type, @new, @posterid, @poster, @note, @postdatetime);

SELECT SCOPE_IDENTITY()  AS 'nid'
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_getnewnoticecountbyuid]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_getnewnoticecountbyuid]
GO

CREATE PROCEDURE [dnt_getnewnoticecountbyuid]
@uid int
AS

SELECT COUNT(nid) FROM [dnt_notices] WHERE [uid] =  @uid  AND [new] = 1
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_getnoticecountbyuid]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_getnoticecountbyuid]
GO

CREATE PROCEDURE [dnt_getnoticecountbyuid]
@uid int,
@type int
AS
IF @type = -1
   SELECT COUNT(nid) FROM [dnt_notices] WHERE [uid] = @uid
ELSE
    SELECT COUNT(nid) FROM [dnt_notices] WHERE [uid] = @uid AND [type]=@type
GO

IF OBJECT_ID ('dnt_getpostlist1','P') IS NOT NULL
DROP PROCEDURE [dnt_getpostlist1]
GO

CREATE PROCEDURE [dnt_getpostlist1]
@tid int,
@pagesize int,
@pageindex int
AS
DECLARE @startRow int,
		@endRow int
SET @startRow = (@pageIndex - 1) * @pageSize +1
SET @endRow = @startRow + @pageSize -1 

SELECT 
[POSTS].[pid],
[POSTS].[fid], 
[POSTS].[title], 
[POSTS].[layer],
[POSTS].[message], 
[POSTS].[ip], 
[POSTS].[lastedit], 
[POSTS].[postdatetime], 
[POSTS].[attachment], 
[POSTS].[poster], 
[POSTS].[posterid], 
[POSTS].[invisible], 
[POSTS].[usesig], 
[POSTS].[htmlon], 
[POSTS].[smileyoff], 
[POSTS].[parseurloff], 
[POSTS].[bbcodeoff], 
[POSTS].[rate], 
[POSTS].[ratetimes],	 
[POSTS].[nickname],  
[POSTS].[username], 
[POSTS].[groupid], 
[POSTS].[spaceid],
[POSTS].[gender],
[POSTS].[bday],
[POSTS].[email], 
[POSTS].[showemail], 
[POSTS].[digestposts], 
[POSTS].[credits], 
[POSTS].[extcredits1], 
[POSTS].[extcredits2], 
[POSTS].[extcredits3], 
[POSTS].[extcredits4], 
[POSTS].[extcredits5], 
[POSTS].[extcredits6], 
[POSTS].[extcredits7], 
[POSTS].[extcredits8], 
[POSTS].[posts], 
[POSTS].[joindate], 
[POSTS].[onlinestate],
[POSTS].[lastactivity],  
[POSTS].[userinvisible], 
[POSTS].[avatar], 
[POSTS].[avatarwidth], 
[POSTS].[avatarheight], 
[POSTS].[medals],
[POSTS].[signature], 
[POSTS].[location], 
[POSTS].[customstatus], 
[POSTS].[website], 
[POSTS].[icq], 
[POSTS].[qq], 
[POSTS].[msn], 
[POSTS].[yahoo], 
[POSTS].[skype] 
FROM (SELECT ROW_NUMBER() OVER(ORDER BY pid)AS ROWID,
[dnt_posts1].[pid],
[dnt_posts1].[fid], 
[dnt_posts1].[title], 
[dnt_posts1].[layer],
[dnt_posts1].[message], 
[dnt_posts1].[ip], 
[dnt_posts1].[lastedit], 
[dnt_posts1].[postdatetime], 
[dnt_posts1].[attachment], 
[dnt_posts1].[poster], 
[dnt_posts1].[posterid], 
[dnt_posts1].[invisible], 
[dnt_posts1].[usesig], 
[dnt_posts1].[htmlon], 
[dnt_posts1].[smileyoff], 
[dnt_posts1].[parseurloff], 
[dnt_posts1].[bbcodeoff], 
[dnt_posts1].[rate], 
[dnt_posts1].[ratetimes],	 
[dnt_users].[nickname],  
[dnt_users].[username], 
[dnt_users].[groupid], 
[dnt_users].[spaceid],
[dnt_users].[gender],
[dnt_users].[bday],
[dnt_users].[email], 
[dnt_users].[showemail], 
[dnt_users].[digestposts], 
[dnt_users].[credits], 
[dnt_users].[extcredits1], 
[dnt_users].[extcredits2], 
[dnt_users].[extcredits3], 
[dnt_users].[extcredits4], 
[dnt_users].[extcredits5], 
[dnt_users].[extcredits6], 
[dnt_users].[extcredits7], 
[dnt_users].[extcredits8], 
[dnt_users].[posts], 
[dnt_users].[joindate], 
[dnt_users].[onlinestate],
[dnt_users].[lastactivity],  
[dnt_users].[invisible] AS [userinvisible], 
[dnt_userfields].[avatar], 
[dnt_userfields].[avatarwidth], 
[dnt_userfields].[avatarheight], 
[dnt_userfields].[medals],
[dnt_userfields].[sightml] AS [signature], 
[dnt_userfields].[location], 
[dnt_userfields].[customstatus], 
[dnt_userfields].[website], 
[dnt_userfields].[icq], 
[dnt_userfields].[qq], 
[dnt_userfields].[msn], 
[dnt_userfields].[yahoo], 
[dnt_userfields].[skype]
FROM [dnt_posts1] LEFT JOIN [dnt_users] ON [dnt_users].[uid]=[dnt_posts1].[posterid] LEFT JOIN [dnt_userfields] ON [dnt_userfields].[uid]=[dnt_users].[uid] 
WHERE [tid] = @tid AND [dnt_posts1].[invisible] <=0) AS POSTS 
WHERE ROWID BETWEEN @startRow AND @endRow
GO

if exists (select * from sysobjects where id = object_id(N'[dnt_getexpiredonlineuserlist]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dnt_getexpiredonlineuserlist]
GO

CREATE PROCEDURE [dnt_getexpiredonlineuserlist]
@expires datetime
AS

SELECT [olid], [userid] FROM [dnt_online] WHERE [lastupdatetime]<@expires
GO

IF OBJECT_ID('dnt_getfirstpost1id','P') IS NOT NULL
DROP PROC dnt_getfirstpost1id
GO

CREATE PROCEDURE dnt_getfirstpost1id
@tid int
AS
SELECT TOP 1 [pid] FROM [dnt_posts1] WHERE [tid]=@tid ORDER BY [pid]
GO

IF OBJECT_ID('dnt_getattachpaymentlogbyaid','P') IS NOT NULL
DROP PROC [dnt_getattachpaymentlogbyaid]
GO

CREATE PROCEDURE [dnt_getattachpaymentlogbyaid]
@aid int
AS
SELECT 
[id],
[uid],
[username],
[aid],
[authorid],
[postdatetime],
[amount],
[netamount]
FROM [dnt_attachpaymentlog]
WHERE [aid] = @aid
GO

IF OBJECT_ID('dnt_getonlineuercount','P') IS NOT NULL
DROP PROC [dnt_getonlineuercount]
GO

CREATE PROCEDURE [dnt_getonlineuercount]
AS
SELECT COUNT(olid) FROM [dnt_online]
GO

IF OBJECT_ID('dnt_getalltoptopiclist','P') IS NOT NULL
DROP PROC [dnt_getalltoptopiclist]
GO

CREATE PROCEDURE [dnt_getalltoptopiclist]
AS
SELECT 
[tid],
[displayorder],
[fid] 
FROM [dnt_topics] 
WHERE [displayorder] > 0 ORDER BY [fid]
GO

IF OBJECT_ID('dnt_getattachpaymentlogbyuid','P') IS NOT NULL
DROP PROC [dnt_getattachpaymentlogbyuid]
GO

CREATE PROCEDURE [dnt_getattachpaymentlogbyuid]
@attachidlist varchar(500),
@uid int
AS
SELECT 
[aid]
FROM [dnt_attachpaymentlog] 
WHERE [uid] = @uid AND CHARINDEX(','+RTRIM([dnt_attachpaymentlog].[aid])+',', ','+@attachidlist+',')>0
GO

IF OBJECT_ID('dnt_getnousedforumattachment','P') IS NOT NULL
DROP PROC [dnt_getnousedforumattachment]
GO

CREATE PROCEDURE [dnt_getnousedforumattachment]
AS
SELECT 
[aid],
[uid],
[tid],
[pid],
[postdatetime],
[readperm],
[filename],
[description],
[filetype],
[filesize],
[attachment],
[downloads],
[attachprice],
[width],
[height]
FROM [dnt_attachments] 
WHERE [tid]= 0 AND [pid]=0 AND DATEDIFF(n, postdatetime, GETDATE()) > 30 
GO

IF OBJECT_ID('dnt_deletenousedforumattachment','P') IS NOT NULL
DROP PROC [dnt_deletenousedforumattachment]
GO

CREATE PROCEDURE [dnt_deletenousedforumattachment]
AS
DELETE FROM [dnt_attachments] 
WHERE [tid]= 0 AND [pid]=0 AND DATEDIFF(n, postdatetime, GETDATE()) > 30
GO

IF OBJECT_ID('dnt_getnousedattachmentlistbytid','P') IS NOT NULL
DROP PROC [dnt_getnousedattachmentlistbytid]
GO

CREATE PROCEDURE [dnt_getnousedattachmentlistbytid]
@uid INT
AS
SELECT 
[aid], 
[attachment] 
FROM [dnt_attachments] 
WHERE [uid]= @uid AND [tid]=0 AND [pid]=0
GO

IF OBJECT_ID('dnt_updateattachmenttidtoanothertopic','P') IS NOT NULL
DROP PROC [dnt_updateattachmenttidtoanothertopic]
GO

CREATE PROCEDURE [dnt_updateattachmenttidtoanothertopic]
@tid INT,
@oldtid INT
AS
UPDATE [dnt_attachments] SET [tid]=@tid WHERE [tid]=@oldtid
GO

IF OBJECT_ID('dnt_getfirstimageattachbytid','P') IS NOT NULL
DROP PROC [dnt_getfirstimageattachbytid]
GO

CREATE PROCEDURE [dnt_getfirstimageattachbytid]
@tid INT
AS
SELECT TOP 1 
[aid],
[uid],
[tid],
[pid],
[postdatetime],
[readperm],
[filename],
[description],
[filetype],
[filesize],
[attachment],
[downloads],
[attachprice],
[width],
[height] 
FROM [dnt_attachments] 
WHERE [tid]=@tid AND LEFT([filetype], 5)='image' ORDER BY [aid]
GO

IF OBJECT_ID('dnt_getattachmentlistbypid','P') IS NOT NULL
DROP PROC [dnt_getattachmentlistbypid]
GO

CREATE PROCEDURE [dnt_getattachmentlistbypid]
@pidlist varchar(500)
AS
SELECT 
[aid],
[uid],
[tid],
[pid],
[postdatetime],
[readperm],
[filename],
[description],
[filetype],
[filesize],
[attachment],
[downloads],
[attachprice],
[width],
[height] 
FROM [dnt_attachments] 
WHERE CHARINDEX(','+RTRIM([dnt_attachments].[pid])+',', ','+@pidlist+',')>0
GO

IF OBJECT_ID('dnt_getattachmentlistbyaid','P') IS NOT NULL
DROP PROC [dnt_getattachmentlistbyaid]
GO

CREATE PROCEDURE [dnt_getattachmentlistbyaid]
@aidlist varchar(500)
AS
SELECT 
[aid],
[tid],
[pid],
[filename]
FROM [dnt_attachments] 
WHERE CHARINDEX(','+RTRIM([dnt_attachments].[aid])+',', ','+@aidlist+',')>0
GO

IF OBJECT_ID('dnt_updateattachment','P') IS NOT NULL
DROP PROC [dnt_updateattachment]
GO

CREATE PROCEDURE [dnt_updateattachment]
@readperm INT,
@description NCHAR(100),
@attachprice INT,
@aid INT
AS
UPDATE [dnt_attachments] 
SET [readperm] = @readperm, [description] = @description, [attachprice] = @attachprice 
WHERE [aid] = @aid
GO

IF OBJECT_ID('dnt_updateattachmentinfo','P') IS NOT NULL
DROP PROC [dnt_updateattachmentinfo]
GO

CREATE PROCEDURE [dnt_updateattachmentinfo]
@readperm INT,
@description NCHAR(100),
@aid INT
AS
UPDATE [dnt_attachments] 
SET [readperm] = @readperm, [description] = @description 
WHERE [aid] = @aid
GO

IF OBJECT_ID('dnt_updateallfieldattachmentinfo','P') IS NOT NULL
DROP PROC [dnt_updateallfieldattachmentinfo]
GO

CREATE PROCEDURE [dnt_updateallfieldattachmentinfo]
@postdatetime DATETIME,
@readperm INT,
@filename NCHAR(100),
@filetype NCHAR(50),
@description NCHAR(100),
@filesize INT,
@attachment NCHAR(100),
@downloads INT,
@tid INT,
@pid INT,
@aid INT,
@attachprice INT,
@width INT,
@height INT
AS
UPDATE [dnt_attachments] 
SET 
[postdatetime] = @postdatetime, 
[readperm] = @readperm, 
[filename] = @filename, 
[description] = @description, 
[filetype] = @filetype, 
[filesize] = @filesize, 
[attachment] = @attachment, 
[downloads] = @downloads, 
[tid]=@tid, 
[pid]=@pid, 
[attachprice]=@attachprice, 
[width]=@width, 
[height]=@height 
WHERE [aid]=@aid
GO

IF OBJECT_ID('dnt_deleteattachmentbypid','P') IS NOT NULL
DROP PROC [dnt_deleteattachmentbypid]
GO

CREATE PROCEDURE [dnt_deleteattachmentbypid]
@pid INT
AS
DELETE FROM [dnt_attachments] 
WHERE [pid]=@pid
GO

IF OBJECT_ID('dnt_deleteattachmentbyaidlist','P') IS NOT NULL
DROP PROC [dnt_deleteattachmentbyaidlist]
GO

CREATE PROCEDURE [dnt_deleteattachmentbyaidlist]
@aidlist VARCHAR(500)
AS
DELETE FROM [dnt_attachments] WHERE CHARINDEX(','+RTRIM([aid])+',',','+@aidlist+',') > 0
GO

IF OBJECT_ID('dnt_deleteattachmentbyaid','P') IS NOT NULL
DROP PROC [dnt_deleteattachmentbyaid]
GO

CREATE PROCEDURE [dnt_deleteattachmentbyaid]
@aid INT
AS
DELETE FROM [dnt_attachments] 
WHERE [aid]=@aid
GO

IF OBJECT_ID('dnt_deleteattachmentbytid','P') IS NOT NULL
DROP PROC [dnt_deleteattachmentbytid]
GO

CREATE PROCEDURE [dnt_deleteattachmentbytid]
@tid INT
AS
DELETE FROM [dnt_attachments] WHERE [tid] = @tid
GO

IF OBJECT_ID('dnt_deleteattachmentbytidlist','P') IS NOT NULL
DROP PROC [dnt_deleteattachmentbytidlist]
GO

CREATE PROCEDURE [dnt_deleteattachmentbytidlist]
@tidlist VARCHAR(500)
AS
DELETE FROM [dnt_attachments] WHERE CHARINDEX(','+RTRIM([tid])+',',','+@tidlist+',') > 0
GO

IF OBJECT_ID('dnt_getattachmentlistbytidlist','P') IS NOT NULL
DROP PROC [dnt_getattachmentlistbytidlist]
GO

CREATE PROCEDURE [dnt_getattachmentlistbytidlist]
@tidlist VARCHAR(500)
AS
SELECT 
[aid],
[filename] 
FROM [dnt_attachments] 
WHERE CHARINDEX(','+RTRIM([tid])+',',''+@tidlist+',') > 0
GO

IF OBJECT_ID('dnt_getattachmentlistbytid','P') IS NOT NULL
DROP PROC [dnt_getattachmentlistbytid]
GO

CREATE PROCEDURE [dnt_getattachmentlistbytid]
@tid INT
AS
SELECT 
[aid],
[filename] 
FROM [dnt_attachments] 
WHERE [tid]	= @tid
GO

IF OBJECT_ID('dnt_updateattachmentdownloads','P') IS NOT NULL
DROP PROC [dnt_updateattachmentdownloads]
GO

CREATE PROCEDURE [dnt_updateattachmentdownloads]
@aid INT
AS
UPDATE [dnt_attachments] SET [downloads]=[downloads]+1 WHERE [aid]=@aid
GO

IF OBJECT_ID('dnt_getattachenmtlistbypid','P') IS NOT NULL
DROP PROC [dnt_getattachenmtlistbypid]
GO

CREATE PROCEDURE [dnt_getattachenmtlistbypid]
@pid INT
AS
SELECT 
[aid],
[uid],
[tid],
[pid],
[postdatetime],
[readperm],
[filename],
[description],
[filetype],
[filesize],
[attachment],
[downloads],
[attachprice],
[width],
[height] 
FROM [dnt_attachments] 
WHERE [pid]=@pid
GO

IF OBJECT_ID('dnt_getattachmentcountbytid','P') IS NOT NULL
DROP PROC [dnt_getattachmentcountbytid]
GO

CREATE PROCEDURE [dnt_getattachmentcountbytid]
@tid INT
AS
SELECT COUNT([aid]) AS [acount] FROM [dnt_attachments] WHERE [tid]=@tid
GO

IF OBJECT_ID('dnt_getattachmentcountbypid','P') IS NOT NULL
DROP PROC [dnt_getattachmentcountbypid]
GO

CREATE PROCEDURE [dnt_getattachmentcountbypid]
@pid INT
AS
SELECT COUNT([aid]) AS [acount] FROM [dnt_attachments] WHERE [pid]=@pid
GO

IF OBJECT_ID('dnt_getattachenmtinfobyaid','P') IS NOT NULL
DROP PROC [dnt_getattachenmtinfobyaid]
GO

CREATE PROCEDURE [dnt_getattachenmtinfobyaid]
@aid INT
AS
SELECT TOP 1
[aid],
[uid],
[tid],
[pid],
[postdatetime],
[readperm],
[filename],
[description],
[filetype],
[filesize],
[attachment],
[downloads],
[attachprice],
[width],
[height] 
FROM [dnt_attachments] 
WHERE [aid]=@aid
GO

IF OBJECT_ID('dnt_getpolllist','P') IS NOT NULL
DROP PROC [dnt_getpolllist]
GO

CREATE PROCEDURE [dnt_getpolllist]
@tid int
AS
SELECT 
[pollid],
[tid],
[displayorder],
[multiple],
[visible],
[maxchoices],
[expiration],
[uid],
[voternames] 
FROM [dnt_polls] 
WHERE [tid]=@tid
GO

IF OBJECT_ID('dnt_gettaginfo','P') IS NOT NULL
DROP PROC [dnt_gettaginfo]
GO

CREATE PROCEDURE [dnt_gettaginfo]
@tagid int
AS
SELECT 
[tagid],
[tagname],
[userid],
[postdatetime],
[orderid],
[color],
[count],
[fcount],
[pcount],
[scount],
[vcount],
[gcount] 
FROM [dnt_tags] 
WHERE [tagid]=@tagid
GO

IF OBJECT_ID('dnt_setcurrenttopics','P') IS NOT NULL
DROP PROC [dnt_setcurrenttopics]
GO

CREATE PROCEDURE [dnt_setcurrenttopics]
@fid int
AS
UPDATE 
[dnt_forums] 
SET [curtopics] = (SELECT COUNT(tid) FROM [dnt_topics] WHERE [displayorder] >= 0 AND [fid]=@fid) WHERE [fid]=@fid