# CRT Keyword Highlight

面向**网络设备 / 防火墙 / 邮件网关**排障场景的统一关键字高亮方案，覆盖三个层面：

| 层面 | 工具 | 文件 |
|------|------|------|
| SecureCRT 会话输出 | SecureCRT Keyword Highlighting | `Paul_Network_optimized.ini` |
| zsh 命令行输入 | zsh-syntax-highlighting | `zsh_keyword_colors.zsh` |
| zsh 命令输出（stdout） | grc | `conf.paul_network` / `grc_commands.conf` |

---

## 文件说明

| 文件 | 说明 |
|------|------|
| `Paul_Network_optimized.ini` | SecureCRT 关键字集，规则数 20，名称 `Paul_Network_Optimized` |
| `zsh_keyword_colors.zsh` | zsh 命令行输入着色，适配 Clear Dark 主题 |
| `conf.paul_network` | grc 输出着色规则，与 SecureCRT 规则语义一致 |
| `grc_commands.conf` | grc 命令自动映射表（ssh/ping/curl/netstat 等） |

---

## 颜色语义对照

适用于以上三套配置，语义统一。

| 颜色 | 语义 | 典型关键词 |
|------|------|-----------|
| **红色加粗** | 严重错误 / 安全威胁 | ERROR / DROP / DENY / FAIL / spam / virus / malware |
| **黄色加粗** | 告警 / IP 地址 / 邮件 | WARN / TIMEOUT / IPv4 地址 / SMTP / queue / bounce |
| **绿色加粗** | 成功 / 连通 | UP / SUCCESS / PERMIT / ALLOWED / ESTABLISHED |
| 青色 | DOWN / HA 状态 / 时间戳 | DOWN / Standby / Primary / `HH:MM:SS` |
| **蓝色加粗** | VPN / 加密隧道 | IPsec / IKEv2 / Phase 1 / Phase 2 / ISAKMP |
| 黄色 | 路由 / 防火墙策略 | OSPF / BGP / ACL / NAT / PAT / access-list |
| 蓝色 | 传输层协议 / MAC 地址 | tcp / udp / icmp / `AA:BB:CC:DD:EE:FF` |
| **青色加粗** | IPv6 地址 | `2001:db8::1/64` |
| 品红 | 接口错误 / 链路质量 | CRC / duplex mismatch / loss / latency / err-disable |
| 品红 | 特权账号 | admin / root |

---

## 一、SecureCRT 关键字高亮

### 安装

```bash
cp Paul_Network_optimized.ini \
  "$HOME/Library/Application Support/VanDyke/SecureCRT/Config/Keywords/"
```

### 启用

> **关键**：会话 Keyword Set 选的是规则集名称 `Paul_Network_Optimized`，不是文件名。

1. 打开 SecureCRT → 会话 Session Options。
2. Terminal → Appearance → Keyword Highlighting。
3. 启用高亮，Keyword Set 选 `Paul_Network_Optimized`，保存。

### 让所有新会话默认生效

1. Session Manager 中打开 `Default` 会话配置。
2. 按上述方式设置 Keyword Set。
3. 保存后新建会话自动继承。

---

## 二、zsh 命令行输入着色

> 作用范围：你**正在输入**的命令行（非输出内容）。  
> 已针对 macOS Terminal **Clear Dark** 主题优化。

### 前置依赖

```zsh
brew install zsh-syntax-highlighting
```

### 安装

```zsh
cp zsh_keyword_colors.zsh ~/.zsh_keyword_colors.zsh
```

### 配置 ~/.zshrc

在 `~/.zshrc` **末尾**按顺序追加（顺序不能颠倒）：

```zsh
# zsh-syntax-highlighting must be loaded last
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh_keyword_colors.zsh
```

生效：

```zsh
source ~/.zshrc
```

---

## 三、grc 命令输出着色

> 作用范围：命令的 **stdout 输出内容**（IP 地址、ERROR、日志行等）。  
> `zsh-syntax-highlighting` 不处理这部分，必须用 grc。

### 前置依赖

```zsh
brew install grc
```

### 安装

```zsh
mkdir -p ~/.grc

# 规则文件
cp conf.paul_network ~/.grc/conf.paul_network

# 命令自动映射（首次）
cp grc_commands.conf ~/.grc/grc.conf
```

### 配置 ~/.zshrc

在 `~/.zshrc` 末尾追加：

```zsh
# grc - colorize command output
source /opt/homebrew/etc/grc.zsh
```

生效：

```zsh
source ~/.zshrc
```

### 使用方式

自动着色（配置 grc.conf 后，ssh/ping/curl 等自动生效）：

```zsh
ping 8.8.8.8
curl -I https://example.com
```

手动对任意命令着色：

```zsh
grc ssh user@host
grc netstat -an
cat system.log | grcat ~/.grc/conf.paul_network
```

---

## 快速完整部署（一次性）

```zsh
DIR="/Users/paulxu/Local_Data/git_work/CRT_keyword_highlight"

# SecureCRT
cp "$DIR/Paul_Network_optimized.ini" \
  "$HOME/Library/Application Support/VanDyke/SecureCRT/Config/Keywords/"

# zsh 输入着色
cp "$DIR/zsh_keyword_colors.zsh" ~/.zsh_keyword_colors.zsh

# grc 输出着色
mkdir -p ~/.grc
cp "$DIR/conf.paul_network" ~/.grc/conf.paul_network
cp "$DIR/grc_commands.conf" ~/.grc/grc.conf

# 重新加载
source ~/.zshrc
```
