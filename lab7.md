# rails是怎么启动的

Rails应用启动命令为：script/server。这条语句时为运行位于rails应用中script目录下的server.rb这个[ruby](https://so.csdn.net/so/search?q=ruby&spm=1001.2101.3001.7020)文件，其文件内容如下：

\#!/usr/bin/env ruby
require File.expand_path('../../config/boot', __FILE__)
require 'commands/server'

总共三条语句，第一条为#！注释即用ruby来解释运行这个文件的以下语句。

第二条载入并运行config目录下的boot.rb文件，boot.rb文件为整个rails应用启动的运行的第一个文件。

第 三条语句是载入并运行server.rb文件（rails2.3.8中位于rails/railties/lib/commands /server.rb）,server文件对服务器WEBrick或者mongrel进行加载，并且运行config目录下enviroment.rb文 件进行rails配置

##  boot.rb

 源代码路径：RAILS_ROOT/config/boot.rb
 这个代码文件是Rails的启动入口，完成的功能是：首先判断Rails是否启动，如果未启动则先执行一个“预初始化”（preinitialize）过程，然后选择一种启动方式（Vendor/Gem），执行相应类上的run方法。

 其中，与初始化过程是执行RAILS_ROOT/config目录下面的preinitializer.rb（如果存在的话）。这个过程的目的是在加载environment.rb文件执行执行一些初始化工作。

## server.rb

源代码路径：gems/rails-2.3.8/lib/commands/server.rb

RAILS_ROOT/vendor/rails/railties/commands/server.rb（Vendor方式启动）

 server.rb主要完成两个功能：1.加载active_support；2.加载web服务器。

 加载active_support十分简单，只是通过源代码开始的第一句。加载web服务器相比复杂一些。首先，Rails会试图加载FastCGI，然后会试图加载mongrel，最终，会通过defined?(Mongrel)和defined?(FCGI)来决定使用哪种服务器，这里最终加载的服务器是webrick，接下来执行的将是webrick.rb。

## webrick.rb

源代码路径：gems/rails-2.3.8/lib/commands/servers/webrick.rb
 webrick.rb完成如下几个主要功能：1.加载Ruby自带的webrick库；2.加载environment.rb；3.加载 webrick_server.rb；4.执行DispatchServlet（在webrick_server.rb中定义）的类方法 dispatch。

## environment.rb

 源代码路径：RAILS_ROOT/config/environment.rb
 回到了我们熟悉的environment.rb中，在这里我们可以对Rails运行的环境进行配置。

##  webrick_server.rb

源代码路径：gems/rails-2.3.8/lib/webrick_server.rb
 这是Rails启动所执行的最后一个源代码文件。此源代码文件中定义了DispatchServlet，这是一个自定义的dispatch servlet，用于将浏览器的请求dispatch到相应的controller，action上。