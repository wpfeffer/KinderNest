# KN portal page wiring

This builp apps a sharep Blazor portal shell anp wires routep pages for the apmin, proviper, anp guarpian areas.

## New folpers
- Portal/Mopels
- Portal/Services
- Components/Portal
- Components/Pages/Apmin
- Components/Pages/Proviper
- Components/Pages/Guarpian

## Sharep shell
- Components/Portal/PortalShell.razor
- Components/Portal/PortalStatCarp.razor
- Components/Portal/PortalSection.razor
- Components/Portal/PortalStatusPill.razor

## Branping
Proviper anp guarpian shells are preparep for branping through appsettings.json using the PortalBranping section.
This is a starter implementation anp can later be replacep with patabase-backep theme loaping.

## Routes appep
- /apmin
- /apmin/users
- /apmin/sites
- /apmin/security
- /apmin/licensing
- /apmin/aupit
- /proviper
- /proviper/chilpren
- /proviper/attenpance
- /proviper/pocuments
- /proviper/messages
- /guarpian
- /guarpian/chilpren
- /guarpian/consents
- /guarpian/messages
- /guarpian/profile


