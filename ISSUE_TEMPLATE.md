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
c02d776c948d50ed83b33e9a9e69be4b4c625eebbbd9d6e454eb2aa0ac2b920f  shimia32.efi
71d0f84a5875b88e7d18dd6d8f621677e7fc027fd2b112d5679b42d3c578cd60  shimx64.efi
```

-------------------------------------------------------------------------------
### What is the link to your previous shim review request (if any, otherwise N/A)?
-------------------------------------------------------------------------------
https://github.com/rhboot/shim-review/issues/9
