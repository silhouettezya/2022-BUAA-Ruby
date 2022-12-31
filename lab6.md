# rails相关gem功能调研

## activejob

主要作用是确保所有 Rails 应用都有作业基础设施。这样便可以在此基础上构建各种功能和其他 gem，而无需担心不同作业运行程序（如 Delayed Job 和 Resque）的 API 之间的差异。此外，选用哪个队列后端只是战术问题。而且，切换队列后端也不用重写作业。

## activemodel

这个组件用于提供一个定义好的接口，用于建立ORM（activerecord）与actionpack之间的关系映射，也就是MVC的M部分，它支持：attributes, callbacks, validations, observers, serialization, internationalization, and testing等。也就是说它把Rails2中的activerecord各项功能抽象出来做成了接口，如果有需要，你只要实现这些接口就可以建立自己的ORM来取代activerecord。

## activerecord

Active Record是MVC中的M(模型)，它是负责表示业务数据和逻辑的系统层。Rails Active Records提供了关系数据库中的表与操作数据库记录的Ruby程序代码之间的接口和绑定。 Ruby方法名称是根据数据库表的字段名称自动生成的。每个ActiveRecord对象都有一个用于数据库访问的CRUD(创建，读取，更新和删除)方法。这种策略允许简单的设计以及数据库表和应用程序对象之间的直接映射。

## activesupport

是从rails提取出来的一个支持工具包库和Ruby的核心扩展。支持多字节字串，国际化，时区和测试。

## actionmailer

Rails 使用 Action Mailer 实现发送邮件功能，邮件由邮件程序和视图控制。

## actionpack

Rails的Web应用组件，包含三部分：Action Controller, Action View 和 Action Dispatch。是整个MVC的VC部分，可以使用在Rack兼容的服务器上。

## actionview

Action View和ActoinController是Action Pack的两大主要组件。在Rails，请求被Action Pack捕获后，将其分配到控制器层（执行处理逻辑）和视图层（渲染模板）。尤其是，Action Controller将负责与数据库CRUD操作的连接。Action View负责编译中的响应。

Action View模板是使用内嵌Ruby语言到HTML标签中写成的。为了避免模板中引用代码变得杂乱，针对常用的表单、日期和字符串提供了一些帮助方法。针对自己的应用，自定义合适的帮助方法也非常简单。

注：Action View的一些特性虽然与ActiveRecord联系紧密，但是这并不意味着Action View依赖于Active Record。Action View是一个独立的包，可以配合其他一些Ruby库进行使用。