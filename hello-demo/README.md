# hello-demo

`hello-demo` 是一个最小化的 OpenWrt 自定义软件包模板，安装后会生成 `/usr/bin/hello-demo`。

## 目录结构

```text
hello-demo/
├── Makefile
├── README.md
└── files/
    └── hello-demo
```

## 编译方法

在 OpenWrt 根目录下执行：

```bash
# 更新并安装 feeds（如尚未执行）
./scripts/feeds update -a
./scripts/feeds install -a

# 选择软件包
make menuconfig
# 进入 Utilities，选中 hello-demo

# 编译该软件包
make package/hello-demo/compile V=s
```

编译完成后可在 `bin/packages/*/*/` 下找到生成的 ipk 包。
