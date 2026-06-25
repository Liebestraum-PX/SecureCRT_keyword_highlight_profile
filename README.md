# CRT Keyword Highlight

SecureCRT 关键字高亮规则（网络设备 / 防火墙 / 邮件网关）。

## 文件

- `Paul_Network_optimized.ini`
  - 关键字集名称：`Paul_Network_Optimized`
  - 规则数：20
  - 支持 `IP:端口` 与 `IP.端口`
  - 不再单独匹配裸端口数字（避免误高亮时间 `HH:MM`）

## 安装（macOS）

将文件复制到 SecureCRT 关键字目录：

`~/Library/Application Support/VanDyke/SecureCRT/Config/Keywords/`

例如：

```bash
cp Paul_Network_optimized.ini \
"$HOME/Library/Application Support/VanDyke/SecureCRT/Config/Keywords/"
```

## 使用方法（修正版）

> 关键点：会话里要选的值是 **`Paul_Network_Optimized`**（不是文件名）。

1. 打开 SecureCRT，进入任意会话的 Session Options。
2. 打开 Terminal -> Appearance -> Keyword Highlighting。
3. 启用关键字高亮，并选择 Keyword Set：`Paul_Network_Optimized`。
4. 保存会话。

## 让新会话默认生效（推荐）

1. 打开 `Default` 会话（Session Manager 中的 Default）配置。
2. 按上面的方式设置 Keyword Set 为 `Paul_Network_Optimized`。
3. 保存后，新建会话会继承该设置。
