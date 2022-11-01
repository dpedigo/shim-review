Confirm the following are included in your repo, checking each box:

 - [ ] completed README.md file with the necessary information
 - [ ] shim.efi to be signed
 - [ ] public portion of your certificate(s) embedded in shim (the file passed to VENDOR_CERT_FILE)
 - [ ] binaries, for which hashes are added to vendor_db ( if you use vendor_db and have hashes allow-listed )
 - [ ] any extra patches to shim via your own git tree or as files
 - [ ] any extra patches to grub via your own git tree or as files
 - [ ] build logs
 - [ ] a Dockerfile to reproduce the build of the provided shim EFI binaries

-------------------------------------------------------------------------------
### What is the link to your tag in a repo cloned from rhboot/shim-review?
-------------------------------------------------------------------------------
`https://github.com/user/shim-review/tree/myorg-shim-arch-YYYYMMDD`

-------------------------------------------------------------------------------
### What is the SHA256 hash of your final SHIM binary?
-------------------------------------------------------------------------------
```
c4d23d282761c419c3fe5166a8b5a9e90490b12a0904632ebc893bf77db1111c  shimia32.efi
68178ef56f5897b0d3e7e86c85d4c06276e3dbc2fe5adbe64f95f1675d57abe7  shimx64.efi
```

-------------------------------------------------------------------------------
### What is the link to your previous shim review request (if any, otherwise N/A)?
-------------------------------------------------------------------------------
https://github.com/rhboot/shim-review/issues/9
