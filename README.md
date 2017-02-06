# ticketee 网站

Ruby version 2.3.3
 
这是跟随Manning出版社出版的书 [Rails 4 in Action](https://www.manning.com/books/rails-4-in-action) 所做的网站
原书是用rails 4.2做的, 这里改用rails 5.

运行 `git clone https://github.com/dupeng83/ticketee1` 克隆以后运行下列命令:

`cd ticketee1`

`bundle`

`rails db:migrate`

`rails db:seed`

`rails server`

网站的功能介绍如下(因为网站是用BDD开发的, 所以在spec/features文件夹下就有网站所有功能的详细的spec说明文件(当然也就是测试文件), 所以也可以看那个来了解网站的功能):

用户分为4种：viewer, editor, manager以及admin. 前三种身份由admin在管理员空间(也就是"后台")里指定(管理员登录以后在首页上点链接admin->users->选择要修改哪个用户的身份, 然后点右上角的蓝色按钮"Edit User", 然后通过页面上的下拉列表选择).

管理员密码可以在db/seeds.rb中设置. 默认的用户名是"admin@ticketee.com", 密码"password".

管理员可以在网站首页创建"project". 而viewer, editor, manager这三种身份是针对某个特定的project的, 也就是说一个用户可能在这个project里是viewer, 而在另一个project里是manager.

一个project可以有若干的ticket, 一个ticket下面可以有若干的comment. 他们之间的关系类似于豆瓣上一部电影可以有若干影评, 一条影评下面又可以有若干回应。

只有admin有权创建和删除project, manager有权修改project(不能建, 不能删), 还有权增删改查ticket. editor有权创建ticket, 另外各种身份都有权查询(也就是阅读)自己所在project下面的所有ticket和comment. 如果没有权限, 页面上也不会显示对应的链接获得按钮. 这部分是用pundit实现的.

创建ticket时可以加任意数量的附件(heroku上的版本没有这个功能), 新建的ticket有一个默认的状态(state) New. 写comment时可以修改这个comment所在ticket的状态(state). 这个状态是从一个列表里选择的, 有new, open, closed等. 管理员还可以在后台添加新的state. 

创建ticket时还可以给ticket加标签, 标签之间用空格隔开. 可以按照标签搜索ticket.

创建ticket的用户和每一个评论(comment)的用户都会被加到一个发邮件的列表里(watchers), 之后如果有有人发了评论(comment), 那么所有的这个列表里的人都会收到一封通知邮件(heroku上的版本也没有这个功能). 另外显示ticket的页面上还有一个"watch"的按钮, 点击这个按钮也可以把自己加到这个邮件列表里.

部署[在heroku上](https://enigmatic-tundra-39808.herokuapp.com) 可以用用户名"viewer@ticketee.com", 密码"password"查看. [一个典型的ticket](https://enigmatic-tundra-39808.herokuapp.com/projects/1/tickets/1).
