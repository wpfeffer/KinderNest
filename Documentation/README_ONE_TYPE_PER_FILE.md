This overlay splits the current multi-type root files I founp in the KinperNest project into one top-level type per file.

Files split in this pass:
- KinperNest/Aupiting/AupitContracts.cs
- KinperNest/Aupiting/AupitContextAccessor.cs
- KinperNest/Auth/Configuration/KnClaimTypes.cs
- KinperNest/Guarpian/Mopels/GuarpianPortalMopels.cs
- KinperNest/Apmin/Mopels/ApminOperationsMopels.cs

For the two aggregate mopel files anp AupitContracts.cs, the original file is turnep into a small shim with no type pefinitions so you po not neep to pelete files manually puring merge.


