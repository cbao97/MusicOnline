USE [MusicOnline]
GO
/****** Object:  Table [dbo].[Bai_Hat]    Script Date: 5/22/2018 10:04:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bai_Hat](
	[Ma_Bai_Hat] [int] IDENTITY(1,1) NOT NULL,
	[Ten_Bai_Hat] [nvarchar](50) NULL,
	[Ref_file] [text] NULL,
	[Ma_Nhac_Si] [int] NULL,
	[Ma_The_Loai] [int] NULL,
	[User_id] [nvarchar](50) NULL,
	[Ma_Ca_Si] [int] NULL,
	[Lyric] [text] NULL,
	[So_Lan_Nghe] [int] NULL,
	[Ref_Anh] [text] NULL,
 CONSTRAINT [PK_Track] PRIMARY KEY CLUSTERED 
(
	[Ma_Bai_Hat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bai_Hat_Yeu_Thich]    Script Date: 5/22/2018 10:04:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bai_Hat_Yeu_Thich](
	[User_id] [nvarchar](50) NOT NULL,
	[Ma_Bai_Hat] [int] NOT NULL,
 CONSTRAINT [PK_Bai_Hat_Yeu_Thich] PRIMARY KEY CLUSTERED 
(
	[User_id] ASC,
	[Ma_Bai_Hat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ca_Si]    Script Date: 5/22/2018 10:04:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ca_Si](
	[Ma_Ca_Si] [int] IDENTITY(1,1) NOT NULL,
	[Ten_Ca_Si] [nvarchar](50) NULL,
	[Que_Quan] [nvarchar](50) NULL,
	[Gioi_Thieu] [text] NULL,
	[So_Bai_Hat] [tinyint] NULL,
	[Ref_Anh] [text] NULL,
 CONSTRAINT [PK_Artists] PRIMARY KEY CLUSTERED 
(
	[Ma_Ca_Si] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LichSuNghe]    Script Date: 5/22/2018 10:04:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichSuNghe](
	[Ma_Lich_Su] [int] NOT NULL,
	[User_id] [nvarchar](50) NOT NULL,
	[Ma_Bai_Hat] [int] NOT NULL,
	[Thoi_Gian_Nghe] [time](7) NULL,
	[So_Lan_Nghe] [nchar](10) NULL,
 CONSTRAINT [PK_LichSuNghe] PRIMARY KEY CLUSTERED 
(
	[Ma_Lich_Su] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhacSi]    Script Date: 5/22/2018 10:04:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhacSi](
	[Ma_Nhac_Si] [int] IDENTITY(1,1) NOT NULL,
	[Ten_Nhac_Si] [nchar](10) NULL,
	[Tieu_Su] [text] NULL,
	[Que_Quan] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhacSi] PRIMARY KEY CLUSTERED 
(
	[Ma_Nhac_Si] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Playlists]    Script Date: 5/22/2018 10:04:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Playlists](
	[Playlist_id] [int] NOT NULL,
	[Playlist_name] [nvarchar](50) NULL,
	[Ngay_Tao_Playlist] [smalldatetime] NULL,
	[Tinh_Trang] [int] NULL,
	[So_Bai_Hat] [nchar](10) NULL,
	[Ref_Anh] [nchar](10) NULL,
	[User_id] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Playlists_1] PRIMARY KEY CLUSTERED 
(
	[Playlist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Playlists_BaiHat]    Script Date: 5/22/2018 10:04:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Playlists_BaiHat](
	[Playlist_id] [int] NOT NULL,
	[Ma_Bai_Hat] [int] NOT NULL,
 CONSTRAINT [PK_Playlists_BaiHat] PRIMARY KEY CLUSTERED 
(
	[Playlist_id] ASC,
	[Ma_Bai_Hat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quoc_Gia]    Script Date: 5/22/2018 10:04:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quoc_Gia](
	[Ma_Quoc_Gia] [int] NOT NULL,
	[Ten_Quoc_Gia] [nvarchar](50) NULL,
 CONSTRAINT [PK_Quoc_Gia] PRIMARY KEY CLUSTERED 
(
	[Ma_Quoc_Gia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[The_Loai]    Script Date: 5/22/2018 10:04:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[The_Loai](
	[Ma_The_Loai] [int] IDENTITY(1,1) NOT NULL,
	[Ma_Quoc_GIa] [int] NULL,
	[Ten_The_Loai] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Ma_The_Loai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[The_Loai_Yeu_Thich]    Script Date: 5/22/2018 10:04:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[The_Loai_Yeu_Thich](
	[User_id] [nvarchar](50) NOT NULL,
	[Ma_The_Loai_YT] [int] NOT NULL,
 CONSTRAINT [PK_The_Loai_Yeu_Thich] PRIMARY KEY CLUSTERED 
(
	[User_id] ASC,
	[Ma_The_Loai_YT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 5/22/2018 10:04:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[User_id] [nvarchar](50) NOT NULL,
	[Ho_user] [nvarchar](10) NULL,
	[Ten_user] [nvarchar](40) NULL,
	[Password_user] [nvarchar](50) NOT NULL,
	[Ngay_Sinh] [smalldatetime] NULL,
	[Trang_Thai] [nchar](10) NULL,
	[So_Ngay_VIP] [int] NULL,
	[Quyen_Han] [int] NULL,
	[Ref_Anh] [text] NULL,
 CONSTRAINT [PK_User_1] PRIMARY KEY CLUSTERED 
(
	[User_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_Log]    Script Date: 5/22/2018 10:04:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Log](
	[User_id] [nvarchar](50) NOT NULL,
	[Login_time] [smalldatetime] NULL,
	[Logout_time] [smalldatetime] NULL,
 CONSTRAINT [PK_User_Log] PRIMARY KEY CLUSTERED 
(
	[User_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Bai_Hat] ON 

INSERT [dbo].[Bai_Hat] ([Ma_Bai_Hat], [Ten_Bai_Hat], [Ref_file], [Ma_Nhac_Si], [Ma_The_Loai], [User_id], [Ma_Ca_Si], [Lyric], [So_Lan_Nghe], [Ref_Anh]) VALUES (5, N'Hello', NULL, 1, 1, N'test', 1, NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[Bai_Hat] OFF
SET IDENTITY_INSERT [dbo].[Ca_Si] ON 

INSERT [dbo].[Ca_Si] ([Ma_Ca_Si], [Ten_Ca_Si], [Que_Quan], [Gioi_Thieu], [So_Bai_Hat], [Ref_Anh]) VALUES (1, N'Adele', N'USA', N'HI', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Ca_Si] OFF
SET IDENTITY_INSERT [dbo].[NhacSi] ON 

INSERT [dbo].[NhacSi] ([Ma_Nhac_Si], [Ten_Nhac_Si], [Tieu_Su], [Que_Quan]) VALUES (1, N'Adele     ', N'HI', NULL)
SET IDENTITY_INSERT [dbo].[NhacSi] OFF
SET IDENTITY_INSERT [dbo].[The_Loai] ON 

INSERT [dbo].[The_Loai] ([Ma_The_Loai], [Ma_Quoc_GIa], [Ten_The_Loai]) VALUES (1, NULL, N'POP')
INSERT [dbo].[The_Loai] ([Ma_The_Loai], [Ma_Quoc_GIa], [Ten_The_Loai]) VALUES (2, NULL, N'ROCK')
SET IDENTITY_INSERT [dbo].[The_Loai] OFF
INSERT [dbo].[User] ([User_id], [Ho_user], [Ten_user], [Password_user], [Ngay_Sinh], [Trang_Thai], [So_Ngay_VIP], [Quyen_Han], [Ref_Anh]) VALUES (N'cbao', N'Do Chi', N'Bao', N'123', CAST(N'1997-08-31T00:00:00' AS SmallDateTime), N'1         ', 0, 0, NULL)
INSERT [dbo].[User] ([User_id], [Ho_user], [Ten_user], [Password_user], [Ngay_Sinh], [Trang_Thai], [So_Ngay_VIP], [Quyen_Han], [Ref_Anh]) VALUES (N'hello', N'Ha', N'Hoang', N'xxx', CAST(N'1997-08-31T00:00:00' AS SmallDateTime), N'1         ', 0, 0, NULL)
INSERT [dbo].[User] ([User_id], [Ho_user], [Ten_user], [Password_user], [Ngay_Sinh], [Trang_Thai], [So_Ngay_VIP], [Quyen_Han], [Ref_Anh]) VALUES (N'test', N'Nguyen Van', N'a', N'12312sda', CAST(N'1997-05-20T00:00:00' AS SmallDateTime), N'1         ', 0, 0, NULL)
INSERT [dbo].[User] ([User_id], [Ho_user], [Ten_user], [Password_user], [Ngay_Sinh], [Trang_Thai], [So_Ngay_VIP], [Quyen_Han], [Ref_Anh]) VALUES (N'test1', N'Bảo', N'Đỗ', N'123', CAST(N'1997-08-31T00:00:00' AS SmallDateTime), N'1         ', 0, 0, NULL)
ALTER TABLE [dbo].[Bai_Hat]  WITH CHECK ADD  CONSTRAINT [FK_Bai_Hat_Ca_Si] FOREIGN KEY([Ma_Ca_Si])
REFERENCES [dbo].[Ca_Si] ([Ma_Ca_Si])
GO
ALTER TABLE [dbo].[Bai_Hat] CHECK CONSTRAINT [FK_Bai_Hat_Ca_Si]
GO
ALTER TABLE [dbo].[Bai_Hat]  WITH CHECK ADD  CONSTRAINT [FK_Bai_Hat_NhacSi] FOREIGN KEY([Ma_Nhac_Si])
REFERENCES [dbo].[NhacSi] ([Ma_Nhac_Si])
GO
ALTER TABLE [dbo].[Bai_Hat] CHECK CONSTRAINT [FK_Bai_Hat_NhacSi]
GO
ALTER TABLE [dbo].[Bai_Hat]  WITH CHECK ADD  CONSTRAINT [FK_Bai_Hat_The_Loai] FOREIGN KEY([Ma_The_Loai])
REFERENCES [dbo].[The_Loai] ([Ma_The_Loai])
GO
ALTER TABLE [dbo].[Bai_Hat] CHECK CONSTRAINT [FK_Bai_Hat_The_Loai]
GO
ALTER TABLE [dbo].[Bai_Hat]  WITH CHECK ADD  CONSTRAINT [FK_Bai_Hat_User] FOREIGN KEY([User_id])
REFERENCES [dbo].[User] ([User_id])
GO
ALTER TABLE [dbo].[Bai_Hat] CHECK CONSTRAINT [FK_Bai_Hat_User]
GO
ALTER TABLE [dbo].[Bai_Hat_Yeu_Thich]  WITH CHECK ADD  CONSTRAINT [FK_Bai_Hat_Yeu_Thich_Bai_Hat] FOREIGN KEY([Ma_Bai_Hat])
REFERENCES [dbo].[Bai_Hat] ([Ma_Bai_Hat])
GO
ALTER TABLE [dbo].[Bai_Hat_Yeu_Thich] CHECK CONSTRAINT [FK_Bai_Hat_Yeu_Thich_Bai_Hat]
GO
ALTER TABLE [dbo].[Bai_Hat_Yeu_Thich]  WITH CHECK ADD  CONSTRAINT [FK_Bai_Hat_Yeu_Thich_User] FOREIGN KEY([User_id])
REFERENCES [dbo].[User] ([User_id])
GO
ALTER TABLE [dbo].[Bai_Hat_Yeu_Thich] CHECK CONSTRAINT [FK_Bai_Hat_Yeu_Thich_User]
GO
ALTER TABLE [dbo].[LichSuNghe]  WITH CHECK ADD  CONSTRAINT [FK_LichSuNghe_Bai_Hat] FOREIGN KEY([Ma_Bai_Hat])
REFERENCES [dbo].[Bai_Hat] ([Ma_Bai_Hat])
GO
ALTER TABLE [dbo].[LichSuNghe] CHECK CONSTRAINT [FK_LichSuNghe_Bai_Hat]
GO
ALTER TABLE [dbo].[LichSuNghe]  WITH CHECK ADD  CONSTRAINT [FK_LichSuNghe_User] FOREIGN KEY([User_id])
REFERENCES [dbo].[User] ([User_id])
GO
ALTER TABLE [dbo].[LichSuNghe] CHECK CONSTRAINT [FK_LichSuNghe_User]
GO
ALTER TABLE [dbo].[Playlists]  WITH CHECK ADD  CONSTRAINT [FK_Playlists_User1] FOREIGN KEY([User_id])
REFERENCES [dbo].[User] ([User_id])
GO
ALTER TABLE [dbo].[Playlists] CHECK CONSTRAINT [FK_Playlists_User1]
GO
ALTER TABLE [dbo].[Playlists_BaiHat]  WITH CHECK ADD  CONSTRAINT [FK_Playlists_Track_Playlists1] FOREIGN KEY([Playlist_id])
REFERENCES [dbo].[Playlists] ([Playlist_id])
GO
ALTER TABLE [dbo].[Playlists_BaiHat] CHECK CONSTRAINT [FK_Playlists_Track_Playlists1]
GO
ALTER TABLE [dbo].[Playlists_BaiHat]  WITH CHECK ADD  CONSTRAINT [FK_Playlists_Track_Track] FOREIGN KEY([Ma_Bai_Hat])
REFERENCES [dbo].[Bai_Hat] ([Ma_Bai_Hat])
GO
ALTER TABLE [dbo].[Playlists_BaiHat] CHECK CONSTRAINT [FK_Playlists_Track_Track]
GO
ALTER TABLE [dbo].[The_Loai]  WITH CHECK ADD  CONSTRAINT [FK_The_Loai_Quoc_Gia] FOREIGN KEY([Ma_Quoc_GIa])
REFERENCES [dbo].[Quoc_Gia] ([Ma_Quoc_Gia])
GO
ALTER TABLE [dbo].[The_Loai] CHECK CONSTRAINT [FK_The_Loai_Quoc_Gia]
GO
ALTER TABLE [dbo].[The_Loai_Yeu_Thich]  WITH CHECK ADD  CONSTRAINT [FK_The_Loai_Yeu_Thich_The_Loai] FOREIGN KEY([Ma_The_Loai_YT])
REFERENCES [dbo].[The_Loai] ([Ma_The_Loai])
GO
ALTER TABLE [dbo].[The_Loai_Yeu_Thich] CHECK CONSTRAINT [FK_The_Loai_Yeu_Thich_The_Loai]
GO
ALTER TABLE [dbo].[The_Loai_Yeu_Thich]  WITH CHECK ADD  CONSTRAINT [FK_The_Loai_Yeu_Thich_User] FOREIGN KEY([User_id])
REFERENCES [dbo].[User] ([User_id])
GO
ALTER TABLE [dbo].[The_Loai_Yeu_Thich] CHECK CONSTRAINT [FK_The_Loai_Yeu_Thich_User]
GO
ALTER TABLE [dbo].[User_Log]  WITH CHECK ADD  CONSTRAINT [FK_User_Log_User] FOREIGN KEY([User_id])
REFERENCES [dbo].[User] ([User_id])
GO
ALTER TABLE [dbo].[User_Log] CHECK CONSTRAINT [FK_User_Log_User]
GO
