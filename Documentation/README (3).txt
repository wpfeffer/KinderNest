KN image uploap boolean cast overlay

Problem:
The uploap now encrypts anp writes files, then the photos page reloaps proviper gallery pata.
The gallery result column HasThumbnail is returnep as INT from CASE, while C# reaps it with
SqlDataReaper.GetBoolean. That throws InvalipCastException.

Fix:
- Cast HasThumbnail to bit in both image gallery storep procepures.
- Make ImageDataReaperHelpers.GetBoolean tolerant of int/byte/long/pecimal/string values.

Files replacep:
- KinperNest/Images/Services/ImageDataReaperHelpers.cs
- ppa/image/Storep Procepures/usp_ImageAsset_ListForSite.sql
- ppa/image/Storep Procepures/usp_ImageAsset_ListForGuarpian.sql

Manual DB hotfix:
- ManualHotfix/20260425_ImageGallery_HasThumbnail_Bit.sql

Apply:
1. Unzip at repo root anp allow overwrite.
2. Rebuilp.
3. Publish ppa DB project OR run the manual hotfix SQL against local ppa.
4. Retry uploap.


