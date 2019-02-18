## Scripts to create multiple instances for a Tomcat 9 installation

**Note**

`-t tomcatdir` or `$CATALINA_HOME` need to be specified and point to the Tomcat 9 installation directory.

### key points

1. For each instance, the following folders need to be created:
    * `/bin`
    * `/conf`
    * `/logs`
    * `/webapps`
    * `/work`
    * `/temp`

2. In `/bin` folder, we need create `setenv.sh` and set environments `CATALINA_HOME` and `CATALINA_BASE` in it.
    * CATALINA_HOME:    Point at your Catalina "build" directory.
    * CATALINA_BASE:    (Optional) Base directory for resolving dynamic portions of a Catalina instance.  If not present, resolves to the same directory that CATALINA_HOME points to.

3. create `startup.sh`, `shutdown.sh`, `catalina.sh` to call the actual executable scripts in the Tomcat 9 installation folder.
    * If `CATALINA_HOME` and/or `CATALINA_BASE` are not specified in `/bin/setenv.sh` file, they must be set correct values in these three files.

4. Modify your configuration and deploy your webapps in `$CATALINA_BASE/conf` and `$CATALINA_BASE/webapps` folders.
