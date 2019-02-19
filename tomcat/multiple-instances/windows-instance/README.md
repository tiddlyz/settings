## Sample instance on Windows [Tomcat 9]

### How to create a new instance
1. Make a copy of sample instance.
2. Set proper `%CATALINA_HOME%` value in `bin\tomcat.bat` if not present.
3. Modify environment values in `bin\setenv.bat` if necessary.
4. Modify ports in `conf\server.xml` to avoid port conflicts.
5. Deploy your web applications in `webapps` folder 

### Usage
* start Tomcat
    ```
    > starup.bat
    ```

* stop Tomcat
    ```
    > shutdown.bat
    ```

* use catalina.bat: `catalina.bat ( commands... )`

    start Tomcat in the current windows

    ```
    > catalina.bat run
    ```
* use tomcat.bat: `tomcat.bat ( start|stop|catalina )`

    start Tomcat in the separate windows

    ```
    > tomcat.bat start
    ```

### Files
* `bin\tomcat.bat`:            Core batch file. Set proper environment values then execute `%CATALINA_HOME%\bin\catalina.bat`
* `bin\startup.bat`:           Shortcut to execute `\bin\tomcat.bat start`
* `bin\stop.bat`:              Shortcut to execute `\bin\tomcat.bat stop`
* `bin\catalina.bat`:          Shortcut to execute `\bin\tomcat.bat catalina`
* `bin\setenv.bat`:            (Optional) Set local environment variables for catalina.bat. See `%CATALINA_HOME%\bin\catalina.bat` 
* `bin\startup_directly.bat`:  (Optional) Run `%CATALINA_HOME%\bin\catalina.bat` without call `bin\tomcat.bat`
* `bin\shutdown_directly.bat`: (Optional) Run `%CATALINA_HOME%\bin\catalina.bat` without call `bin\tomcat.bat`