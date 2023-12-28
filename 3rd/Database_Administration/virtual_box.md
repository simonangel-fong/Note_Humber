- [Prerequisites](#prerequisites)
  - [install package for 19c](#install-package-for-19c)
  - [Additional Configurations](#additional-configurations)
- [Configure Environment Variables](#configure-environment-variables)
- [Install Oracle](#install-oracle)

---


- Down Oracle Linux zip file into the shared folder(windows)
- In Linux, move the zip file to `/u01/app/oracle/product/19.0.0/dbhome_1`

- go to the above folder and unzip the file:

```sh
unzip LINUX.X64_193000_db_home.zip
```

- Install

```sh
./runInstaller
```