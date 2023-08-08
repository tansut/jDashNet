

/****** Object:  Table [dbo].[Dashboard]    Script Date: 13.6.2013 11:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dashboard](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](250) NULL,
	[layout] [ntext] NOT NULL,
	[config] [ntext] NULL,
	[paneConfig] [ntext] NULL,
	[style] [ntext] NULL,
	[cls] [ntext] NULL,
	[attr] [ntext] NULL,
	[groupName] [nvarchar](150) NULL,
	[description] [nvarchar](max) NULL,
	[createdBy] [nvarchar](150) NOT NULL,
	[modifiedBy] [nvarchar](150) NULL,
	[sharedBy] [nvarchar](150) NULL,
	[created] [datetime] NOT NULL,
	[modified] [datetime] NULL,
	[shared] [datetime] NULL,
	[userData] [ntext] NULL,
	[viewOrder] [int] NULL,
	[groupOrder] [int] NULL,
	[UserProperty1] [nvarchar](250) NULL,
	[UserProperty2] [nvarchar](250) NULL,
	[UserProperty3] [nvarchar](250) NULL,
 CONSTRAINT [PK_Dashboard] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dashlet]    Script Date: 13.6.2013 11:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dashlet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dashboardId] [int] NOT NULL,
	[dashletModuleId] [int] NOT NULL,
	[title] [nvarchar](255) NULL,
	[config] [ntext] NULL,
	[paneConfig] [ntext] NULL,
	[position] [ntext] NOT NULL,
	[style] [ntext] NULL,
	[cls] [ntext] NULL,
	[attr] [ntext] NULL,
	[groupName] [nvarchar](150) NULL,
	[description] [nvarchar](max) NULL,
	[createdBy] [nvarchar](150) NOT NULL,
	[modifiedBy] [nvarchar](150) NULL,
	[sharedBy] [nvarchar](150) NULL,
	[created] [datetime] NOT NULL,
	[modified] [datetime] NULL,
	[shared] [datetime] NULL,
	[userData] [ntext] NULL,
	[UserProperty1] [nvarchar](250) NULL,
	[UserProperty2] [nvarchar](250) NULL,
	[UserProperty3] [nvarchar](250) NULL,
 CONSTRAINT [PK_Dashlets] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DashletModule]    Script Date: 13.6.2013 11:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DashletModule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[path] [nvarchar](max) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[config] [ntext] NOT NULL,
	[paneConfig] [ntext] NOT NULL,
	[dashletConfig] [ntext] NOT NULL,
	[style] [ntext] NULL,
	[cls] [ntext] NULL,
	[attr] [ntext] NULL,
	[description] [nvarchar](max) NULL,
	[createdBy] [nvarchar](150) NOT NULL,
	[modifiedBy] [nvarchar](150) NULL,
	[sharedBy] [nvarchar](150) NULL,
	[created] [datetime] NOT NULL,
	[modified] [datetime] NULL,
	[shared] [datetime] NULL,
	[groupName] [nvarchar](150) NULL,
	[userData] [ntext] NULL,
	[viewOrder] [int] NULL,
	[groupOrder] [int] NULL,
	[UserProperty1] [nvarchar](250) NULL,
	[UserProperty2] [nvarchar](250) NULL,
	[UserProperty3] [nvarchar](250) NULL,
 CONSTRAINT [PK_DashletModules] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EntityAuth]    Script Date: 13.6.2013 11:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntityAuth](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entityType] [nvarchar](50) NOT NULL,
	[entityId] [int] NOT NULL,
	[roleOrUser] [nvarchar](50) NOT NULL,
	[permission] [nvarchar](50) NOT NULL,
	[authType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EntityAuth] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tag]    Script Date: 13.6.2013 11:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tagName] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TagRelation]    Script Date: 13.6.2013 11:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagRelation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tagId] [int] NOT NULL,
	[controlId] [int] NOT NULL,
	[controller] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_TagRelation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Dashboard]    Script Date: 13.6.2013 11:39:06 ******/
CREATE NONCLUSTERED INDEX [IX_Dashboard] ON [dbo].[Dashboard]
(
	[UserProperty1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Dashboard_1]    Script Date: 13.6.2013 11:39:06 ******/
CREATE NONCLUSTERED INDEX [IX_Dashboard_1] ON [dbo].[Dashboard]
(
	[UserProperty2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Dashboard_2]    Script Date: 13.6.2013 11:39:06 ******/
CREATE NONCLUSTERED INDEX [IX_Dashboard_2] ON [dbo].[Dashboard]
(
	[UserProperty3] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Dashlet]    Script Date: 13.6.2013 11:39:06 ******/
CREATE NONCLUSTERED INDEX [IX_Dashlet] ON [dbo].[Dashlet]
(
	[UserProperty1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Dashlet_1]    Script Date: 13.6.2013 11:39:06 ******/
CREATE NONCLUSTERED INDEX [IX_Dashlet_1] ON [dbo].[Dashlet]
(
	[UserProperty2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Dashlet_2]    Script Date: 13.6.2013 11:39:06 ******/
CREATE NONCLUSTERED INDEX [IX_Dashlet_2] ON [dbo].[Dashlet]
(
	[UserProperty3] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DashletModule]    Script Date: 13.6.2013 11:39:06 ******/
CREATE NONCLUSTERED INDEX [IX_DashletModule] ON [dbo].[DashletModule]
(
	[UserProperty1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DashletModule_1]    Script Date: 13.6.2013 11:39:06 ******/
CREATE NONCLUSTERED INDEX [IX_DashletModule_1] ON [dbo].[DashletModule]
(
	[UserProperty2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DashletModule_2]    Script Date: 13.6.2013 11:39:06 ******/
CREATE NONCLUSTERED INDEX [IX_DashletModule_2] ON [dbo].[DashletModule]
(
	[UserProperty3] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_EntityAuth]    Script Date: 13.6.2013 11:39:06 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_EntityAuth] ON [dbo].[EntityAuth]
(
	[entityType] ASC,
	[entityId] ASC,
	[roleOrUser] ASC,
	[authType] ASC,
	[permission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Dashlet]  WITH CHECK ADD  CONSTRAINT [FK_Dashlets_Dashboard] FOREIGN KEY([dashboardId])
REFERENCES [dbo].[Dashboard] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Dashlet] CHECK CONSTRAINT [FK_Dashlets_Dashboard]
GO
ALTER TABLE [dbo].[Dashlet]  WITH CHECK ADD  CONSTRAINT [FK_Dashlets_DashletModules] FOREIGN KEY([dashletModuleId])
REFERENCES [dbo].[DashletModule] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Dashlet] CHECK CONSTRAINT [FK_Dashlets_DashletModules]
GO
ALTER TABLE [dbo].[TagRelation]  WITH NOCHECK ADD  CONSTRAINT [FK_TagRelation_Dashboard] FOREIGN KEY([controlId])
REFERENCES [dbo].[Dashboard] ([id])
GO
ALTER TABLE [dbo].[TagRelation] NOCHECK CONSTRAINT [FK_TagRelation_Dashboard]
GO
ALTER TABLE [dbo].[TagRelation]  WITH NOCHECK ADD  CONSTRAINT [FK_TagRelation_DashletModule] FOREIGN KEY([controlId])
REFERENCES [dbo].[DashletModule] ([id])
GO
ALTER TABLE [dbo].[TagRelation] NOCHECK CONSTRAINT [FK_TagRelation_DashletModule]
GO
ALTER TABLE [dbo].[TagRelation]  WITH NOCHECK ADD  CONSTRAINT [FK_TagRelation_Dashlets] FOREIGN KEY([controlId])
REFERENCES [dbo].[Dashlet] ([id])
GO
ALTER TABLE [dbo].[TagRelation] NOCHECK CONSTRAINT [FK_TagRelation_Dashlets]
GO
ALTER TABLE [dbo].[TagRelation]  WITH CHECK ADD  CONSTRAINT [FK_TagRelation_Tags] FOREIGN KEY([tagId])
REFERENCES [dbo].[Tag] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TagRelation] CHECK CONSTRAINT [FK_TagRelation_Tags]
