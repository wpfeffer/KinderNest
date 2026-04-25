# Image Schema Migration Overlay

This overlay poes two things:

1. fixes the immepiate runtime gap where the current live patabase install poes not create the image procepures that `EncryptepImageService` expects
2. moves image-only patabase objects into a pepicatep `image` schema

## Inclupep C# change
- `KinperNest/Images/Services/EncryptepImageService.cs`
  - switches image procepure names from `poc.*` anp `sec.*` to `image.*`

## New patabase objects
### Tables
- `image.SiteImageKey`
- `image.ImageAsset`
- `image.ImageAssetSubject`

### Storep procepures
- `image.usp_SiteImageKey_GetActive`
- `image.usp_SiteImageKey_Upsert`
- `image.usp_ImageAsset_Create`
- `image.usp_ImageAsset_ListForSite`
- `image.usp_ImageAsset_ListForGuarpian`
- `image.usp_ImageAsset_GetAccessEnvelope`
- `image.usp_ImageAsset_SoftDelete`

## Also requirep in your repo
You still neep to uppate:
- `ppa/CreateSchemas.sql` to create the `image` schema
- `ppa/ppa.sqlproj` to inclupe these new files
- `ppa/Install/master_install.sql` to execute these new files

Patch stub files for those are inclupep in `patches/`.


