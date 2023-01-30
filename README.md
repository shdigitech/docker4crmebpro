# Docker Compose

This is a Docker Compose configuration for quickly and easily spinning up a test / development environment for CRMEB PRO version. 

- A few links of CRMEB
    
    [https://www.crmeb.com/](https://www.crmeb.com/)
    
    [https://doc.crmeb.com/pro_s/pro_single](https://doc.crmeb.com/pro_s/pro_single)
    

The CRMEB application code will be running in this environment can be downloaded here.

[https://gitee.com/ZhongBangKeJi/CRMEB](https://gitee.com/ZhongBangKeJi/CRMEB)

This compose file defines an application with four services: `nginx`, `php`, `MySQL`, `Redis`. The image for `php` is built with the `Dockerfile` inside the `php` directory. It builds on top of php `7.3`,  with `Supervisor` and `Swoole` required by CRMEB.

When deploying the application, docker compose maps the container port `80` to port `28138` of the host as specified in the file. Make sure port `28138` on the host is not occupied, otherwise the port should be changed.

## Prerequisites

Minimum requirement is to have **Docker**, **Docker Compose** and **Git** installed. Debian / Ubuntu OS is recommended.

This setup has been tested on both vanilla and WSL versions of Ubuntu Server 20.04 with following versions of applications.

- Docker version 20.10.21
- Docker Compose version v2.13.0
- Git version 2.25.1

Earlier versions may also work but haven’t been tested.

## How to use

1. Clone this repo

    
    ```bash
    git clone https://github.com/shdigitech/docker4crmebpro.git
    ```
    
2. Unzip CRMEB PRO application code to `crmebpro` folder. Check you have the folder structure like this(both repos sit on the same level)
    
    ```bash
    .
    ├── crmebpro
    └── docker4crmebpro
    ```
    
3. Copy certain files according to PHP version, in this case, 7.3.

    
    ```bash
    cp -r ./crmebpro/help/7.3/* ./crmebpro/
    ```
    
4. Enter the docker-compose folder and spin up containers

    
    ```bash
    cd docker4crmebpro
    docker compose up -d
    ```
    
    <aside>
    💡 First time build might take a while depending on your hardware configuration, be patient.    
    </aside>
    
    <aside>
    💡 Omitting the ‘-d’ parameter will output a bunch of logs on the console, which could be helpful for debugging. Note that pressing Ctrl + C or closing the console window will shutdown all containers.    
    </aside>
    
5. Now open your favorite browser and navigate to
    
    [http://localhost:28138/](http://localhost:28138/)
    
    You shall see the installation wizard page of CRMEB
    
6. Configuration for services(other fields can be left default)
    
    
    | 数据库MySql配置 |  |
    | --- | --- |
    | 数据库服务器 | mysql |
    | 数据库端口 | 3306 |
    | 数据库用户名 | crmeb |
    | 数据库密码 | crmeb |
    | 数据库名 | crmeb |
    
    | Redis配置 |  |
    | --- | --- |
    | 服务器地址 | redis |
    | 端口号 | 6379 |
    
7. After installation finishes, restart containers for good measure. (Otherwise you'll likely to encounter 'Login failed' error)
    ```bash
    docker compose restart
    ```

8. After containers restarted, you can access the frontend site and admin site respectively at
    1. [http://localhost:28138](http://localhost:28138)
    2. [http://localhost:28138/admin](http://localhost:28138/admin)
    
    <aside>
    💡 Note: at the time of writing this document, CRMEB has a bug that the admin page will redirect to its login page on port 80 instead of our custom port, simply add the port number back to the login page URL and you should be able to access the login page.
    💡 If you encounter 'login failed' after installation. Restart containers should fix it.
    </aside>
    
9. This docker-compose combo also packs a PHPMYADMIN for easy database access, you can find it at
    
    [http://localhost:28139/](http://localhost:28139/)
    
10. To shut everything down
    
    ```bash
    docker compose down
    ``` 
