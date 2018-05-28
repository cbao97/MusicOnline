
/******************************************************************************
* DATABASE: MusicOnline
* PROCEDURE NAME: usp_UserSelect
* PROCEDURE DESC: Select User từ table User với IN (User_id) 
**************************************************************************/
GO
CREATE PROC [dbo].[usp_UserSelect] 
    @User_id nvarchar(50)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [Ho_user], [Ten_user], [Password_user],[Ngay_Sinh], [Trang_Thai], [So_Ngay_VIP], [Ref_Anh] 
	FROM   [dbo].[User] 
	WHERE  ([User_id] = @User_id OR @User_id IS NULL) 

	COMMIT
GO
/******************************************************************************
* DATABASE: MusicOnline
* PROCEDURE NAME: usp_UserInsert
* PROCEDURE DESC: Insert user vào table User 
**************************************************************************/

GO
CREATE PROC [dbo].[usp_UserInsert] 
    @User_id nvarchar(50),
    @Ho_user nvarchar(10) = NULL,
    @Ten_user nvarchar(40) = NULL,
    @Password_user nvarchar(50),
    @Ngay_Sinh smalldatetime = NULL,
    @Ref_Anh text = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[User] ([User_id], [Ho_user], [Ten_user], [Password_user], [Ngay_Sinh], [Trang_Thai], [So_Ngay_VIP], [Quyen_Han], [Ref_Anh])
	SELECT @User_id, @Ho_user, @Ten_user, @Password_user, @Ngay_Sinh,1,0,0 , @Ref_Anh
	
	-- Begin Return Select <- do not remove
	SELECT [User_id], [Ho_user], [Ten_user], [Password_user], [Ngay_Sinh], [Trang_Thai], [So_Ngay_VIP], [Quyen_Han], [Ref_Anh]
	FROM   [dbo].[User]
	WHERE  [User_id] = @User_id
	-- End Return Select <- do not remove
               
	COMMIT
GO

/******************************************************************************
* DATABASE: MusicOnline
* PROCEDURE NAME: usp_UserUpdate
* PROCEDURE DESC: Update User vào table User
**************************************************************************/

Go
CREATE PROC [dbo].[usp_UserUpdate] 
    @User_id nvarchar(50),
    @Ho_user nvarchar(10) = NULL,
    @Ten_user nvarchar(40) = NULL,
    @Password_user nvarchar(50),
    @Ngay_Sinh smalldatetime = NULL,
    @Trang_Thai nchar(10)=1,
    @Ref_Anh text = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[User]
	SET    [Ho_user] = @Ho_user, [Ten_user] = @Ten_user, [Password_user] = @Password_user, [Ngay_Sinh] = @Ngay_Sinh, [Trang_Thai] = @Trang_Thai, [Ref_Anh] = @Ref_Anh
	WHERE  [User_id] = @User_id
	
	-- Begin Return Select <- do not remove
	SELECT [User_id], [Ho_user], [Ten_user], [Password_user], [Ngay_Sinh], [Trang_Thai], [So_Ngay_VIP], [Ref_Anh]
	FROM   [dbo].[User]
	WHERE  [User_id] = @User_id	
	-- End Return Select <- do not remove

	COMMIT
GO


/******************************************************************************
* DATABASE: MusicOnline
* PROCEDURE NAME: usp_UserDelete
* PROCEDURE DESC: Delete User từ table User 
**************************************************************************/

GO
CREATE PROC [dbo].[usp_UserDelete] 
    @User_id nvarchar(50)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[User]
	WHERE  [User_id] = @User_id
	
	DELETE
	FROM   [dbo].[User_Log]
	WHERE  [User_id] = @User_id

	COMMIT
GO



/******************************************************************************
* DATABASE: MusicOnline
* PROCEDURE NAME: usp_Disable_User
* PROCEDURE DESC: Disable User từ table User ( Khóa tài khoản)
**************************************************************************/

GO 
CREATE PROC [dbo].[usp_Disable_User] 
    @User_id nvarchar(50)
AS 
	BEGIN TRAN
	UPDATE   [dbo].[User]
	SET Trang_Thai=0 
	WHERE  [User_id] = @User_id
	COMMIT
GO

/******************************************************************************
* DATABASE: MusicOnline
* PROCEDURE NAME: usp_Disable_User
* PROCEDURE DESC: Enable User từ table User 
**************************************************************************/ 

GO 
CREATE PROC [dbo].[usp_Enable_User] 
    @User_id nvarchar(50)
AS 
	BEGIN TRAN
	UPDATE   [dbo].[User]
	SET Trang_Thai=1
	WHERE  [User_id] = @User_id
	COMMIT
GO


/******************************************************************************
* DATABASE: MusicOnline
* PROCEDURE NAME: usp_NhacSiSelect
* PROCEDURE DESC: Select Nhạc sĩ từ table NhacSi với IN ( Ma_Nhac_Si) 
**************************************************************************/

Go
CREATE PROC [dbo].[usp_NhacSiSelect] 
    @Ma_Nhac_Si int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [Ma_Nhac_Si], [Ten_Nhac_Si], [Tieu_Su], [Que_Quan] 
	FROM   [dbo].[NhacSi] 
	WHERE  ([Ma_Nhac_Si] = @Ma_Nhac_Si OR @Ma_Nhac_Si IS NULL) 

	COMMIT
GO


/******************************************************************************
* DATABASE: MusicOnline
* PROCEDURE NAME: usp_NhacSiInsert
* PROCEDURE DESC: Insert Nhạc sĩ vào table NhacSi 
**************************************************************************/

GO
CREATE PROC [dbo].[usp_NhacSiInsert] 
    @Ten_Nhac_Si nchar(10) = NULL,
    @Tieu_Su text = NULL,
    @Que_Quan nvarchar(50) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[NhacSi] ([Ten_Nhac_Si], [Tieu_Su], [Que_Quan])
	SELECT @Ten_Nhac_Si, @Tieu_Su, @Que_Quan
	
	-- Begin Return Select <- do not remove
	SELECT [Ma_Nhac_Si], [Ten_Nhac_Si], [Tieu_Su], [Que_Quan]
	FROM   [dbo].[NhacSi]
	WHERE  [Ma_Nhac_Si] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO

/******************************************************************************
* DATABASE: MusicOnline
* PROCEDURE NAME: usp_NhacSiUpdate
* PROCEDURE DESC: Update Nhạc sĩ vào table Nhac_Si 
**************************************************************************/

GO
CREATE PROC [dbo].[usp_NhacSiUpdate] 
    @Ma_Nhac_Si int,
    @Ten_Nhac_Si nchar(10) = NULL,
    @Tieu_Su text = NULL,
    @Que_Quan nvarchar(50) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[NhacSi]
	SET    [Ten_Nhac_Si] = @Ten_Nhac_Si, [Tieu_Su] = @Tieu_Su, [Que_Quan] = @Que_Quan
	WHERE  [Ma_Nhac_Si] = @Ma_Nhac_Si
	
	-- Begin Return Select <- do not remove
	SELECT [Ma_Nhac_Si], [Ten_Nhac_Si], [Tieu_Su], [Que_Quan]
	FROM   [dbo].[NhacSi]
	WHERE  [Ma_Nhac_Si] = @Ma_Nhac_Si	
	-- End Return Select <- do not remove

	COMMIT
GO

/******************************************************************************
* DATABASE: MusicOnline
* PROCEDURE NAME: usp_NhacSiDelete
* PROCEDURE DESC: Delete Nhạc sĩ từ table Nhac_Si 
**************************************************************************/

GO
CREATE PROC [dbo].[usp_NhacSiDelete] 
    @Ma_Nhac_Si int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[NhacSi]
	WHERE  [Ma_Nhac_Si] = @Ma_Nhac_Si

	COMMIT
GO

/******************************************************************************
* DATABASE: MusicOnline
* PROCEDURE NAME: usp_Ca_SiSelect
* PROCEDURE DESC: Selec ca sĩ từ table Ca_Si với IN ( Ma_Ca_Si) 
**************************************************************************/

GO
CREATE PROC [dbo].[usp_Ca_SiSelect] 
    @Ma_Ca_Si int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [Ma_Ca_Si], [Ten_Ca_Si], [Que_Quan], [Gioi_Thieu], [So_Bai_Hat], [Ref_Anh] 
	FROM   [dbo].[Ca_Si] 
	WHERE  ([Ma_Ca_Si] = @Ma_Ca_Si OR @Ma_Ca_Si IS NULL) 

	COMMIT
GO

/******************************************************************************
* DATABASE: MusicOnline
* PROCEDURE NAME: usp_Ca_SiInsert
* PROCEDURE DESC: insert Nhạc sĩ vào table NhacSi 
**************************************************************************/

GO
CREATE PROC [dbo].[usp_Ca_SiInsert] 
    @Ten_Ca_Si nvarchar(50) = NULL,
    @Que_Quan nvarchar(50) = NULL,
    @Gioi_Thieu text = NULL,
    @So_Bai_Hat tinyint = NULL,
    @Ref_Anh text = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Ca_Si] ([Ten_Ca_Si], [Que_Quan], [Gioi_Thieu], [So_Bai_Hat], [Ref_Anh])
	SELECT @Ten_Ca_Si, @Que_Quan, @Gioi_Thieu, @So_Bai_Hat, @Ref_Anh
	
	-- Begin Return Select <- do not remove
	SELECT [Ma_Ca_Si], [Ten_Ca_Si], [Que_Quan], [Gioi_Thieu], [So_Bai_Hat], [Ref_Anh]
	FROM   [dbo].[Ca_Si]
	WHERE  [Ma_Ca_Si] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO

/******************************************************************************
* DATABASE: MusicOnline
* PROCEDURE NAME: usp_Ca_SiInsert
* PROCEDURE DESC: insert Nhạc sĩ vào table NhacSi 
**************************************************************************/

GO
CREATE PROC [dbo].[usp_Ca_SiUpdate] 
    @Ma_Ca_Si int,
    @Ten_Ca_Si nvarchar(50) = NULL,
    @Que_Quan nvarchar(50) = NULL,
    @Gioi_Thieu text = NULL,
    @So_Bai_Hat tinyint = NULL,
    @Ref_Anh text = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Ca_Si]
	SET    [Ten_Ca_Si] = @Ten_Ca_Si, [Que_Quan] = @Que_Quan, [Gioi_Thieu] = @Gioi_Thieu, [So_Bai_Hat] = @So_Bai_Hat, [Ref_Anh] = @Ref_Anh
	WHERE  [Ma_Ca_Si] = @Ma_Ca_Si
	
	-- Begin Return Select <- do not remove
	SELECT [Ma_Ca_Si], [Ten_Ca_Si], [Que_Quan], [Gioi_Thieu], [So_Bai_Hat], [Ref_Anh]
	FROM   [dbo].[Ca_Si]
	WHERE  [Ma_Ca_Si] = @Ma_Ca_Si	
	-- End Return Select <- do not remove

	COMMIT
GO

/******************************************************************************
* DATABASE: MusicOnline
* PROCEDURE NAME: usp_Ca_SiInsert
* PROCEDURE DESC: insert Nhạc sĩ vào table NhacSi 
**************************************************************************/

GO
CREATE PROC [dbo].[usp_Ca_SiDelete] 
    @Ma_Ca_Si int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Ca_Si]
	WHERE  [Ma_Ca_Si] = @Ma_Ca_Si

	COMMIT
GO


/******************************************************************************
* DATABASE: MusicOnline
* PROCEDURE NAME: usp_Bai_HatSelect
* PROCEDURE DESC: Select bài hát từ table Bai_Hat với IN ( Ma_Bai_Hat) 
**************************************************************************/
GO
alter PROC [dbo].[usp_Bai_HatSelect] 
    @Ten_Bai_Hat nvarchar(50)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [Ten_Bai_Hat], [Ten_Nhac_Si],[Ten_Ca_Si], [Ten_The_Loai], [User_id], Bai_Hat.Ref_Anh,[So_Lan_Nghe]  -- tên 
	FROM   [dbo].[Bai_Hat], [dbo].NhacSi NS , dbo.Ca_Si CS, dbo.The_Loai TL
	WHERE  ([Ten_Bai_Hat] like  @Ten_Bai_Hat + '%'and Bai_Hat.Ma_Ca_Si=CS.Ma_Ca_Si and Bai_Hat.Ma_Nhac_Si=NS.Ma_Nhac_Si and Bai_Hat.Ma_The_Loai=TL.Ten_The_Loai) 

	COMMIT
GO
exec usp_Bai_HatSelect 'sha'
select * from bai_hat where Ten_Bai_Hat like 'sha%'

/******************************************************************************
* DATABASE: MusicOnline
* PROCEDURE NAME: usp_Bai_HatInsert
* PROCEDURE DESC: Insert bài hát vào table Bai_Hat 
**************************************************************************/

Go
CREATE PROC [dbo].[usp_Bai_HatInsert] 
    @Ten_Bai_Hat nvarchar(50) = NULL,
    @Ma_Nhac_Si int = NULL,
    @Ma_The_Loai int = NULL,
	@Ma_Ca_Si int = NULL,
    @User_id nvarchar(50) = NULL,
    @Lyric text = NULL,
    @Ref_Anh text = NULL,
	@Ref_file text = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Bai_Hat] ([Ten_Bai_Hat], [Ref_file], [Ma_Nhac_Si], [Ma_The_Loai], [User_id], [Ma_Ca_Si], [Lyric], [So_Lan_Nghe], [Ref_Anh])
	SELECT @Ten_Bai_Hat, @Ref_file, @Ma_Nhac_Si, @Ma_The_Loai, @User_id, @Ma_Ca_Si, @Lyric, 0, @Ref_Anh
	
	-- Begin Return Select <- do not remove
	SELECT [Ma_Bai_Hat], [Ten_Bai_Hat], [Ref_file], [Ma_Nhac_Si], [Ma_The_Loai], [User_id], [Ma_Ca_Si], [Lyric], [So_Lan_Nghe], [Ref_Anh]
	FROM   [dbo].[Bai_Hat]
	WHERE  [Ma_Bai_Hat] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO

/******************************************************************************
* DATABASE: MusicOnline
* PROCEDURE NAME: usp_Bai_HatUpdate
* PROCEDURE DESC: Update bài hát vào table Bai_Hat 
**************************************************************************/

GO
CREATE PROC [dbo].[usp_Bai_HatUpdate] 
    @Ma_Bai_Hat int,
    @Ten_Bai_Hat nvarchar(50) = NULL,
    @Ref_file text = NULL,
    @Ma_Nhac_Si int = NULL,
    @Ma_The_Loai int = NULL,
    @Ma_Ca_Si int = NULL,
    @Lyric text = NULL,
    @So_Lan_Nghe int = NULL,
    @Ref_Anh text = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	UPDATE [dbo].[Bai_Hat]
	SET    [Ten_Bai_Hat] = @Ten_Bai_Hat, [Ref_file] = @Ref_file, [Ma_Nhac_Si] = @Ma_Nhac_Si, [Ma_The_Loai] = @Ma_The_Loai, [Ma_Ca_Si] = @Ma_Ca_Si, [Lyric] = @Lyric, [So_Lan_Nghe] = @So_Lan_Nghe, [Ref_Anh] = @Ref_Anh
	WHERE  [Ma_Bai_Hat] = @Ma_Bai_Hat
	
	-- Begin Return Select <- do not remove
	SELECT [Ma_Bai_Hat], [Ten_Bai_Hat], [Ref_file], [Ma_Nhac_Si], [Ma_The_Loai], [User_id], [Ma_Ca_Si], [Lyric], [So_Lan_Nghe], [Ref_Anh]
	FROM   [dbo].[Bai_Hat]
	WHERE  [Ma_Bai_Hat] = @Ma_Bai_Hat	
	-- End Return Select <- do not remove

	COMMIT
GO

/******************************************************************************
* DATABASE: MusicOnline
* PROCEDURE NAME: usp_Bai_HatDelete
* PROCEDURE DESC: Delete bài hát từ table Bai_Hat 
**************************************************************************/
GO
CREATE PROC [dbo].[usp_Bai_HatDelete] 
    @Ma_Bai_Hat int
AS 
	BEGIN TRAN
	DELETE
	FROM   [dbo].[Bai_Hat]
	WHERE  [Ma_Bai_Hat] = @Ma_Bai_Hat
	COMMIT
GO


/******************************************************************************
* DATABASE: MusicOnline
* PROCEDURE NAME: usp_The_LoaiSelect
* PROCEDURE DESC: Select Thể loại từ table The_Loai với IN ( Ma_The_Loai) 
**************************************************************************/

GO
CREATE PROC [dbo].[usp_The_LoaiSelect] 
    @Ma_The_Loai int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [Ma_The_Loai], [Ma_Quoc_GIa], [Ten_The_Loai] 
	FROM   [dbo].[The_Loai] 
	WHERE  ([Ma_The_Loai] = @Ma_The_Loai OR @Ma_The_Loai IS NULL) 

	COMMIT
GO

/******************************************************************************
* DATABASE: MusicOnline
* PROCEDURE NAME: usp_The_LoaiInsert
* PROCEDURE DESC: Insert Thể loại vào table The_Loai 
**************************************************************************/
Go
CREATE PROC [dbo].[usp_The_LoaiInsert] 
    @Ten_The_Loai nvarchar(50) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[The_Loai] ([Ten_The_Loai])
	SELECT @Ten_The_Loai
	
	-- Begin Return Select <- do not remove
	SELECT [Ma_The_Loai], [Ten_The_Loai]
	FROM   [dbo].[The_Loai]
	WHERE  [Ma_The_Loai] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
/******************************************************************************
* DATABASE: MusicOnline
* PROCEDURE NAME: usp_The_LoaiUpdate
* PROCEDURE DESC: Update Thể loại vào table The_Loai
**************************************************************************/

CREATE PROC [dbo].[usp_The_LoaiUpdate] 
    @Ma_The_Loai int,
    @Ten_The_Loai nvarchar(50) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[The_Loai]
	SET    [Ten_The_Loai] = @Ten_The_Loai
	WHERE  [Ma_The_Loai] = @Ma_The_Loai
	
	-- Begin Return Select <- do not remove
	SELECT [Ma_The_Loai], [Ten_The_Loai]
	FROM   [dbo].[The_Loai]
	WHERE  [Ma_The_Loai] = @Ma_The_Loai	
	-- End Return Select <- do not remove

	COMMIT
GO

/******************************************************************************
* DATABASE: MusicOnline
* PROCEDURE NAME: usp_The_LoaiDelete
* PROCEDURE DESC: Delete Thể loại từ table The_Loai 
**************************************************************************/

GO
CREATE PROC [dbo].[usp_The_LoaiDelete] 
    @Ma_The_Loai int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[The_Loai]
	WHERE  [Ma_The_Loai] = @Ma_The_Loai

	COMMIT
GO


/******************************************************************************
* DATABASE: MusicOnline
* PROCEDURE NAME: usp_User_LogSelect
* PROCEDURE DESC: Select Lịch sử user từ table user_log với IN ( user_id) 
**************************************************************************/

GO
CREATE PROC [dbo].[usp_User_LogSelect] 
    @User_id nvarchar(50)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [User_id], [Login_time], [Logout_time] 
	FROM   [dbo].[User_Log] 
	WHERE  ([User_id] = @User_id OR @User_id IS NULL) 

	COMMIT
GO
 
/******************************************************************************
* DATABASE: MusicOnline
* PROCEDURE NAME: usp_User_LogInsert_Login
* PROCEDURE DESC: Insert lịch sử user vào table user_log 
**************************************************************************/

CREATE PROC [dbo].[usp_User_LogInsert] 
    @User_id nvarchar(50),
    @Login_time smalldatetime = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[User_Log] ([User_id], [Login_time])
	SELECT @User_id, @Login_time
	
	-- Begin Return Select <- do not remove
	SELECT [User_id], [Login_time]
	FROM   [dbo].[User_Log]
	WHERE  [User_id] = @User_id
	-- End Return Select <- do not remove
               
	COMMIT
GO


/******************************************************************************
* DATABASE: MusicOnline
* PROCEDURE NAME: usp_User_LogInsert_Logout
* PROCEDURE DESC: Insert lịch sử user vào table user_log 
**************************************************************************/

GO
CREATE PROC [dbo].[usp_User_LogInsert_Logout] 
    @User_id nvarchar(50),
    @Logout_time smalldatetime = NULL
AS 
	
	BEGIN TRAN

	UPDATE [dbo].[User_Log]
	SET    [Logout_time] = @Logout_time
	WHERE  [User_id] = @User_id
	
	-- Begin Return Select <- do not remove
	SELECT [User_id], [Logout_time]
	FROM   [dbo].[User_Log]
	WHERE  [User_id] = @User_id	
	-- End Return Select <- do not remove

	COMMIT
GO


/******************************************************************************
* DATABASE: MusicOnline
* PROCEDURE NAME: usp_User_LogUpdate
* PROCEDURE DESC: Update Nhạc sĩ vào table Nhac_Si 
**************************************************************************/

GO
CREATE PROC [dbo].[usp_User_LogUpdate] 
    @User_id nvarchar(50),
    @Login_time smalldatetime = NULL,
    @Logout_time smalldatetime = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[User_Log]
	SET    [Login_time] = @Login_time, [Logout_time] = @Logout_time
	WHERE  [User_id] = @User_id
	
	-- Begin Return Select <- do not remove
	SELECT [User_id], [Login_time], [Logout_time]
	FROM   [dbo].[User_Log]
	WHERE  [User_id] = @User_id	
	-- End Return Select <- do not remove

	COMMIT
GO




/******************************************************************************
* DATABASE: MusicOnline
* PROCEDURE NAME: usp_Bai_Hat_Yeu_ThichSelect
* PROCEDURE DESC: Select tên bài hát yêu thích của user từ table Bai_Hat_Yeu_Thich với IN ( Ma_Bai_Hat,  User_id) 
**************************************************************************/
GO
CREATE PROC [dbo].[usp_Bai_Hat_Yeu_ThichSelect] 
    @User_id nvarchar(50),
    @Ma_Bai_Hat int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT BH.Ten_Bai_Hat
	FROM   [dbo].[Bai_Hat_Yeu_Thich] YT ,dbo.[Bai_Hat] BH
	WHERE  (YT.User_id = @User_id OR @User_id IS NULL) 
	       AND (YT.Ma_Bai_Hat = @Ma_Bai_Hat OR @Ma_Bai_Hat IS NULL) and YT.Ma_Bai_Hat=BH.Ma_Bai_Hat

	COMMIT
GO



/******************************************************************************
* DATABASE: MusicOnline
* PROCEDURE NAME: usp_Bai_Hat_Yeu_ThichInsert
* PROCEDURE DESC: Insert 1 bài hát yêu thích vào table Bai_Hat_Yeu_Thich 
**************************************************************************/

CREATE PROC [dbo].[usp_Bai_Hat_Yeu_ThichInsert] 
    @User_id nvarchar(50),
    @Ma_Bai_Hat int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Bai_Hat_Yeu_Thich] ([User_id], [Ma_Bai_Hat])
	SELECT @User_id, @Ma_Bai_Hat
	
	-- Begin Return Select <- do not remove
	SELECT [User_id], [Ma_Bai_Hat]
	FROM   [dbo].[Bai_Hat_Yeu_Thich]
	WHERE  [User_id] = @User_id
	       AND [Ma_Bai_Hat] = @Ma_Bai_Hat
	-- End Return Select <- do not remove
               
	COMMIT
GO



/******************************************************************************
* DATABASE: MusicOnline
* PROCEDURE NAME: usp_Bai_Hat_Yeu_ThichDelete
* PROCEDURE DESC: Delete 1 bài hát yêu thích từ table Bai_Hat_Yeu_Thich 
**************************************************************************/

GO
CREATE PROC [dbo].[usp_Bai_Hat_Yeu_ThichDelete] 
    @User_id nvarchar(50),
    @Ma_Bai_Hat int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Bai_Hat_Yeu_Thich]
	WHERE  [User_id] = @User_id
	       AND [Ma_Bai_Hat] = @Ma_Bai_Hat

	COMMIT
GO


/******************************************************************************
* DATABASE: MusicOnline
* PROCEDURE NAME: usp_SelectBaiHat_CaSi
* PROCEDURE DESC: Lấy toàn bộ bài hát của một ca sĩ với in(Te_Ca_Si) 
**************************************************************************/

GO
CREATE PROC [dbo].[usp_SelectBaiHat_CaSi] 
    @Ma_Ca_Si int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	select  CS.Ten_Ca_Si,BH.Ten_Bai_Hat, Ns.Ten_Nhac_Si 
	from Bai_Hat BH ,Ca_Si CS , NhacSi NS
	where BH.Ma_Nhac_Si= NS.Ma_Nhac_Si and CS.Ma_Ca_Si=BH.Ma_Ca_Si and BH.Ma_Ca_Si=@Ma_Ca_Si

	COMMIT
GO


set dateformat dmy
exec usp_UserInsert 'tess','Ta Van','Ga','30/09/1998','https://upload.wikimedia.org/wikipedia/commons/c/c2/Katy_Perry_UNICEF_2012.jpg'

SELECT 'DROP PROCEDURE [' + SCHEMA_NAME(p.schema_id) + '].[' + p.NAME + '];'
FROM sys.procedures p 
DROP PROCEDURE [dbo].[usp_Bai_HatSelect];
DROP PROCEDURE [dbo].[usp_Bai_HatInsert];
DROP PROCEDURE [dbo].[usp_Bai_HatUpdate];
DROP PROCEDURE [dbo].[usp_Bai_HatDelete];
DROP PROCEDURE [dbo].[usp_Disable_BaiHat];
DROP PROCEDURE [dbo].[usp_Enable_BaiHat];
DROP PROCEDURE [dbo].[usp_Ca_SiSelect];
DROP PROCEDURE [dbo].[usp_Ca_SiInsert];
DROP PROCEDURE [dbo].[usp_Ca_SiUpdate];
DROP PROCEDURE [dbo].[usp_Ca_SiDelete];
DROP PROCEDURE [dbo].[usp_NhacSiSelect];
DROP PROCEDURE [dbo].[usp_NhacSiInsert];
DROP PROCEDURE [dbo].[usp_NhacSiUpdate];
DROP PROCEDURE [dbo].[usp_NhacSiDelete];
DROP PROCEDURE [dbo].[usp_UserSelect];
DROP PROCEDURE [dbo].[usp_UserInsert];
DROP PROCEDURE [dbo].[usp_UserUpdate];
DROP PROCEDURE [dbo].[usp_UserDelete];
DROP PROCEDURE [dbo].[usp_Disable_User];
DROP PROCEDURE [dbo].[usp_Enable_User];
DROP PROCEDURE [dbo].[usp_The_LoaiSelect];
DROP PROCEDURE [dbo].[usp_The_LoaiInsert];
DROP PROCEDURE [dbo].[usp_The_LoaiUpdate];
DROP PROCEDURE [dbo].[usp_The_LoaiDelete];
DROP PROCEDURE [dbo].[usp_User_LogSelect];
DROP PROCEDURE [dbo].[usp_User_LogInsert];
DROP PROCEDURE [dbo].[usp_User_LogInsert_Logout];
DROP PROCEDURE [dbo].[usp_User_LogUpdate];
DROP PROCEDURE [dbo].[usp_User_LogDelete];
DROP PROCEDURE [dbo].[usp_Bai_Hat_Yeu_ThichSelect];
DROP PROCEDURE [dbo].[usp_Bai_Hat_Yeu_ThichInsert];
DROP PROCEDURE [dbo].[usp_Bai_Hat_Yeu_ThichDelete];
DROP PROCEDURE [dbo].[usp_DeleteUser];
DROP PROCEDURE [dbo].[usp_SelectBaiHat_CaSi];
