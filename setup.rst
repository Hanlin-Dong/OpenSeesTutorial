安装和运行
==========================

本教程帮助读者下载、安装OpenSees到个人电脑，并运行OpenSees。

安装
------

本文中介绍Windows用户和Mac用户安装OpenSees的方法。OpenSees提供了以上两种操作系统的程序发行版。也就是说，您可以像使用其它软件一样，通过下载程序包来安装OpenSees。OpenSees并没有提供安装包，而是类似绿色软件，只提供了两进制文件，可以直接运行。


进入 OpenSees下载页面_ 即可获得OpenSees发行版。如果你没有注册成为OpenSees用户，请点击页面中的 Registration_ 按钮注册。注册是免费的。

.. _OpenSees下载页面: http://opensees.berkeley.edu/OpenSees/user/download.php
.. _Registration: http://opensees.berkeley.edu/community/ucp.php?mode=register

注册好后，输入注册邮箱，即可进入下载页面。下面分Windows用户和Mac用户介绍安装OpenSees的方法。对于Linux用户，由于OpenSees没有提供Linux的发行版，所以需要用户下载源代码编译。我们将在后面的章节中介绍。

Windows用户
~~~~~~~~~~~~~

Windows用户需要根据自己操作系统是32位还是64位选择下载的程序。首先需要下载安装的是 ``Active Tcl`` 。Tcl是一种脚本语言，OpenSees的计算引擎是使用Tcl语言驱动的。在安装过程中要特殊注意的是，系统默认的安装路径是 **C:\\Tcl** ，需要将其改为 **C:\\Program Files\\Tcl** ，以防止OpenSees搜索Tcl出错。

.. warning:: 在运行 ``Active Tcl`` 安装包时，请使用管理员模式运行，否则将出现错误提示。

安装好了 ``Active Tcl`` 之后，把OpenSees.exe程序下载好，就可以使用了。

Mac用户
~~~~~~~~~~~

Mac用户同样也需要先安装 ``Active Tcl`` 。OpenSees提供的是DMG文件，下载后把应用拖入 ``Applications`` 文件夹，再把OpenSeesMac压缩包下载和解压，就可以使用了。

运行
-------

OpenSees程序是通过执行Tcl代码来完成与用户的交互的，这一点与Ansys的APDL语言类似。OpenSees项目中并不包含图形界面，但是有一系列 其它项目_ 可以实现一些图形化操作。在本教程中，主要介绍原始的代码调用方式。为了演示如何运行OpenSees，请用户新建一个文本文件，在其中输入一行代码，并保存为 ``Hello.tcl`` ，与你的OpenSees程序放在同一目录下。 ::

    puts "Hello, OpenSees!"

*注意* ：Windows用户请不要使用系统的 ``记事本`` 来输入代码，请选用其它文本编辑器。有很多文本编辑器可供选择，本文档中推荐使用 `Sublime Text 3`_ 作为编辑器。如果你对文本编辑器不熟悉，具体的使用方法可参考 `Sublime Text 3 使用方法`_ 。

这一语句表示把 ``Hello, OpenSees!`` 这一字符串在控制台中打印说来。其中 ``puts`` 为Tcl语言的保留字。更多有关Tcl语言的帮助，请参考 ``第三章`` 。

.. _Sublime Text 3: http://www.sublimetext.com/
.. _其它项目: http://opensees.berkeley.edu/OpenSees/user/tools.php

下面分Windows用户和Mac用户介绍OpenSees的使用方法。

Windows用户
~~~~~~~~~~~~~~

有三种方法可以在OpenSees中运行 ``Hello.tcl`` 中的命令。

1. 直接输入命令
^^^^^^^^^^^^^^^^^^^^^^^^^

双击打开 ``OpenSees.exe`` ，出现以下界面 ::


             OpenSees -- Open System For Earthquake Engineering Simulation
                     Pacific Earthquake Engineering Research Center
                            Version 2.5.0 (rev 6228) 32-Bit

          (c) Copyright 1999-2016 The Regents of the University of California
                                  All Rights Reserved
      (Copyright and Disclaimer @ http://www.berkeley.edu/OpenSees/copyright.html)


    OpenSees > 

其中  ``OpenSees >`` 提示符表示你可以在后面输入OpenSees命令了。用文本编辑器打开 ``Hello.tcl`` ，复制其中所有文本，回到 ``命令提示符`` ，粘贴，会发现出现如下响应。（如果没有出现请按回车键） ::

    OpenSees > puts "Hello, OpenSees!"
    Hello, OpenSees!
    OpenSees > 

出现第二行的 ``Hello, OpenSees!`` 表示执行成功。

2. 从文件中读取命令
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

上一种方法相当于直接在控制台中输入命令代码。另一种方法是从文件中读取代码。可以用Tcl语言中的 ``source`` 命令。方法如下 ::

    OpenSees > source Hello.tcl
    Hello, OpenSees!
    OpenSees >


用 ``source`` 命令可以直接从文件中读取命令并执行。得到和直接输入一样的结果。

3. 从控制台运行命令
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

还有一种更便捷的方法，也是最常使用的方法，就是在控制台中直接输入 ``opensees`` 命令，并把你编写的命令文件名作为其参数输入。注意，这里不输要双击打开 ``OpenSees.exe`` 。

首先打开OpenSees.exe所在的文件夹，然后在文件浏览器的 ``地址栏`` 中复制文件夹的地址。然后打开 ``程序`` - ``附件`` - ``命令提示符`` （可理解为一种Windows控制台）。假设你的 ``OpenSees.exe`` 放在 ``C:\opensees\`` 文件夹中，则输入 ::

    cd C:\opensees\

即 ``cd`` 加上你复制的路径。这样可以把工作路径切换到你的 ``OpenSees.exe`` 和 ``Hello.tcl`` 所在的目录下。然后输入 ::

    opensees Hello.tcl

这里 ``opensees`` 表示调用 ``OpenSees.exe`` 程序。 ``Hello.tcl`` 表示在opensees程序中读入 ``Hello.tcl`` 中的命令。可以看到，控制台中输出了和上两种方法一样的结果。

.. note:: 有时你并不想把OpenSees程序和命令文件放在同一个文件夹中，这时你可以把 ``OpenSees.exe`` 所在的目录加入系统的 ``Path环境变量`` 。打开 ``控制面板`` - ``系统和安全`` - ``系统`` - ``高级`` - ``环境变量``，在 ``系统环境变量`` 中找到 ``Path`` ，请把刚才复制的OpenSees程序所在文件夹附加在 ``Path`` 环境变量值的后面，注意很多路径之间用 ``;`` 分隔。重启系统，再进入 ``命令提示符`` ，输入 ``opensees`` ，可以发现不论在什么文件夹，都可以运行OpenSees程序了。

Mac用户
~~~~~~~~~~~~

与Windows用户相似，Mac用户也有三种方法可以在OpenSees中运行 ``Hello.tcl`` 中的命令。

1. 直接输入命令
^^^^^^^^^^^^^^^^^^

双击打开 ``OpenSees`` 程序，出现以下界面 ::


             OpenSees -- Open System For Earthquake Engineering Simulation
                     Pacific Earthquake Engineering Research Center
                            Version 2.5.0 (rev 6228) 32-Bit

          (c) Copyright 1999-2016 The Regents of the University of California
                                  All Rights Reserved
      (Copyright and Disclaimer @ http://www.berkeley.edu/OpenSees/copyright.html)


    OpenSees > 

其中  ``OpenSees >`` 提示符表示你可以在后面输入OpenSees命令了。用文本编辑器打开 ``Hello.tcl`` ，复制其中所有文本，回到 ``命令提示符`` ，粘贴，会发现出现如下响应。（如果没有出现请按回车键） ::

    OpenSees > puts "Hello, OpenSees!"
    Hello, OpenSees!
    OpenSees > 

出现第二行的 ``Hello, OpenSees!`` 表示执行成功。

2. 从文件中读取命令
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

上一种方法相当于直接在控制台中输入命令代码。另一种方法是从文件中读取代码。可以用Tcl语言中的 ``source`` 命令。方法如下 ::

    OpenSees > source Hello.tcl
    Hello, OpenSees!
    OpenSees >


用 ``source`` 命令可以直接从文件中读取命令并执行。得到和直接输入一样的结果。

3. 从控制台运行命令
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

还有一种更便捷的方法，也是最常使用的方法，就是在控制台中直接输入 ``opensees`` 命令，并把你编写的命令文件名作为其参数输入。注意，这里不输要双击打开 ``OpenSees`` 。

首先打开终端。终端在 ``Launchpad`` - ``其它`` - ``终端`` 。然后进入opensees所在的文件夹。假设你把opensees程序放在 ``Documents/opensees`` 文件夹中，那么在终端中输入 ::

    cd ~/Documents/opensees/

即 ``cd`` 加上opensees的路径。这样可以把工作路径切换到你的 ``OpenSees`` 和 ``Hello.tcl`` 所在的目录下。然后输入 ::

    opensees Hello.tcl

这里 ``opensees`` 表示调用Opensees程序。 ``Hello.tcl`` 表示在opensees程序中读入 ``Hello.tcl`` 中的命令。可以看到，控制台中输出了和上两种方法一样的结果。

.. note:: 有时你并不想把OpenSees程序和命令文件放在同一个文件夹中，这时你可以把 ``OpenSees.exe`` 所在的目录加入系统的 ``Path环境变量`` 。打开 ``Finder`` ，在菜单栏中选择 ``Go`` - ``Go to Folder`` ，在弹出的对话框中输入 ``/etc/`` ，在打开的文件夹中找到 ``paths`` 文件，双击打开，在最下面一行中加入你的opensees程序文件夹路径。重启系统，再进入终端，输入 ``opensees`` ，可以发现不论在什么文件夹，都可以运行OpenSees程序了。