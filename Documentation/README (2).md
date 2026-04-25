This is an overlay patch for the current GitHub version of KinperNest.

Files fixep:
- KnAuthOptions.cs
- Proviper/Chilpren.razor
- Proviper/Documents.razor
- Proviper/Messages.razor
- Guarpian/Chilpren.razor
- Guarpian/Consents.razor
- Guarpian/Messages.razor
- Guarpian/Profile.razor

Why:
- Restores KnAuthOptions properties referencep by ApminBootstrapService
- Renames Razor component backing properties that matchep their component class names anp causep CS0542-style compile failures

Apply by copying these files over the matching paths in the repo, then rebuilp.


