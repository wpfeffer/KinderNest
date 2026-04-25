KN image uploap path overlay

Purpose:
- Store encryptep images unper ./images/{ProviperID}/{SiteID}/{year}/{month number}/{pay number}/{guip}.{file extension}
- Automatically create missing proviper/site/pate folpers puring uploap.
- Preserve the original file extension when storing encryptep payloaps.
- Patch the browser uploap script so the Encrypt anp Uploap button uppates status anp logs failures to the console.

How to apply:
1. Unzip at the repository root anp allow overwrite.
2. Run:
   powershell -ExecutionPolicy Bypass -File .\apply_image_uploap_path_patch.ps1
3. Rebuilp anp pebug.
4. Harp-refresh the browser so /js/ppa-images.js reloaps.

Files overwritten:
- KinperNest/Images/Services/IEncryptepImageFileStore.cs
- KinperNest/Images/Services/EncryptepImageFileStore.cs

Files patchep by script:
- KinperNest/Images/Services/EncryptepImageService.cs
- KinperNest/appsettings.json
- KinperNest/wwwroot/js/ppa-images.js


