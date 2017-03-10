# -*- coding: utf-8 -*-

import numpy as np
import matplotlib.pyplot as plt
import matplotlib as mpl

# 设置中文字体
mpl.rcParams['font.sans-serif'] = ['SimHei']
mpl.rcParams['axes.unicode_minus'] = False

data = np.loadtxt("example.out")

# 设置图像大小。单位：英寸
plt.figure(figsize=(6, 3))

# subplot 1
plt.subplot(1, 2, 1)

# 画线
plt.plot(data[:, 1], data[:, 0] * 100)

# 设置坐标轴的范围
plt.xlim([0, 6])
plt.ylim([0, 1200])

# 设置坐标轴标题
plt.xlabel("displacement(in)")
plt.ylabel("force(kip)")

# 设置子图标题
plt.title("x direction")

# subplot 2
plt.subplot(1, 2, 2)

# 设置画线的颜色、标记和线型
plt.plot(data[:, 2], data[:, 0] * -50, "ro--")

# 中文坐标轴标题
plt.xlabel(u"位移(英寸)")

# 加入LaTeX公式的文字
plt.ylabel(r"Force$(\mathrm{kip})$")

plt.title(u"y方向")  

# 设置横坐标分隔
plt.xticks([-2, -1, 0])
plt.yticks([-500, -400, -300, -200, -100, 0]) 

# 调整布局尺寸
plt.subplots_adjust(bottom=0.2, top=0.85, left=0.12, right=0.95,
                    wspace=0.4, hspace=0.2)

# 保存图片
plt.savefig("myfigure", dpi=300)