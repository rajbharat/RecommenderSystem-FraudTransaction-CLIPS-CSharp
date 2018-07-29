How to Install the Program

1. Install Sql Server Express latest version
2. Change the server name in the data  source = "XXX" in app.config file in the release directory.
3. Data source will be the server name set up in the local directory
##connectionString="Data Source=VINAYAK\SQLEXPRESS;Initial Catalog=ISBA;Integrated Security=True;Pooling=False"
4. Install .net latest version
5. Install SQL server management studio and visual studio community edition if required to run the code
6. Install the ms excel connectivity package - shared in the same directory
extract the code/build in <c:\> only; release files (ISBARecoPrj.exe) will have to run from this folder(C:\ISBARecoPrj\ISBARecoPrj)
7. Run ISBARecoPrj.exe (see working folder.jpg)