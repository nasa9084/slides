## Now, beginning "systemd"
## @nasa9084

---

## at first:

this slide:

https://gitpitch.com/nasa9084/slides/osc17hiroshima

---

## $ whoami

![](assets/pika.jpg)
* nasa9084
* VirtualTech Japan Inc.
* emacs! emacs! emacs!

---

## systemd System and Service Manager

- replacing init/Upstart
  + Fedora v15 or later
  + openSUSE v12.2 or later
  + RHEL/CentOS 7 or later
  + Ubuntu 15.04 or later
  + Debian v8 or later
- managing system and services
- LGPL version 2.1 or later

+++

### components

- **systemd**
- networkd
  + networking service
- **journald**
  + logging service
- logind
  + user login management service
- user sessions
  + controls user logins
- nspawn
  + enhanced `chroot`

+++

### commands

- `systemctl`

+++

#### systemctl

- starting service
  + `systemctl start UNIT`
- stop service
  + `systemctl stop UNIT`
- start service on boot
  + `systemctl enable UNIT`
- show status
  + `systemctl status UNIT`

Note:
- `service`/`chkconfig` is redirect to `systemctl`

+++

#### power management

- `systemctl reboot`
- `systemctl poweroff`

Note:
- `reboot`/`shutdown` is aliased to `systemctl`

+++

### unit file

- configuration file
  + syntax like `.ini` files
  + `usr/lib/systemd/system`
    * default configs (**DO NOT EDIT**)
  + `/etc/systemd/system`
    * user configs
- services, devices, sockets, timers, ...

Note:
- when edit default config, copy to `/etc/systemd/system`
- prior `/etc/systemd/system`

+++

### general section

- `[Unit]` section
- `[Install]` section

+++

### `[Unit]` section

generic information about the unit

- `Description`
- `Wants`/`Requires`
  + dependency
- `Before`/`After`
  + run order

Note:
- `Wants` is weaker than `Requires`
- Require is **NOT INCLUDE** `Before`/`After`

+++

### `[Install]` section

used by `enable` and `disable` commands

- `Alias`
- `WantedBy`/`RequiredBy`
  + symlink is created in .wants/ or .requires/ dir
  + usually, specify some target

+++

## target

- serving a similar purpose as runlevels
- can have multiple targets at the same time

+++

### vs. SysV init Run Level

| SysV Lv.     | systemd target        |
|:------------:|:---------------------:|
| 0            | poweroff.target       |
| 1, s, single | rescure.target        |
| 2, 3, 4      | **multi-user.target** |
| 5            | graphical.target      |
| 6            | reboot.target         |
| emergency    | emergency.target      |

---

## service

- configure `.service` file
- process controlled by systemd
- write `[Service]` section

+++

### `[Service]` section

- `Type`
- `ExecStart`
- `ExecReload`
- `ExecStop`
- `Restart`

+++

### e.g.) nginx

``` ini
[Unit]
Description=The nginx HTTP and reverse proxy server
After=network.target remote-fs.target nss-lookup.target

[Service]
Type=forking
PIDFile=/run/nginx.pid
# Nginx will fail to start if /run/nginx.pid already exists but has the wrong
# SELinux context. This might happen when running `nginx -t` from the cmdline.
# https://bugzilla.redhat.com/show_bug.cgi?id=1268621
ExecStartPre=/usr/bin/rm -f /run/nginx.pid
ExecStartPre=/usr/sbin/nginx -t
ExecStart=/usr/sbin/nginx
ExecReload=/bin/kill -s HUP $MAINPID
KillSignal=SIGQUIT
TimeoutStopSec=5
KillMode=process
PrivateTmp=true

[Install]
WantedBy=multi-user.target
```

---

## timer

- configure `.timer` file
- timer-based service activation
- write `[Timer]` section
- use instead of `cron`
- `foo.timer` activates `foo.service` by default
- `WantedBy=timers.target`

+++

### `[Timer]` section

- `OnCalendar`
  + realtime timers with calendar event expressions
- `OnXXXSec`
  + XXX=Active/Boot/Startup/UnitActive/UnitInactive
  + monotonic timers
- `AccuracySec`
  + accucary the time shall elapse with (defaults to 1min)
- `Unit`
  + the unit to activate when this timer elapses

+++

### OnCalendar

- [WEEKDAY] [[YEAR-]MONTH-DAY] [HOUR:MINUTE[:SECOND]] ["UTC" | TIMEZONE]
  + e.g.) `Thu,Fri 2012-*-1,5 11:12:13`

- separatad by comma or ".." refers to a range
- WEEKDAY: in English like Wed or Wednesday
- date and time
  + wildcard: `*`
  + repetation value: `/n`
- DAY:  `~` indicates the last day(s) in a month
  + `Mon *-05~07/1` means "the last Monday in May"

+++

#### special expressions

- `minutely`: `*-*-* *:*:00`
- `hourly`: `*-*-* *:00:00`
- `daily`: `*-*-* 00:00:00`
- `monthly`: `*-*-01 00:00:00`
- `weekly`: `Mon *-*-* 00:00:00`
- `yearly`: `*-01-01 00:00:00`
- `quarterly`: `*-01,04,07,10-01 00:00:00`
- `semiannually`: `*-01,07-01 00:00:00`

+++

#### Examples

https://www.freedesktop.org/software/systemd/man/systemd.time.html

+++

### OnXXXSec

- OnActiveSec: the moment the time itself is activated
- OnBootSec: when the machine was booted up
- OnStartupSec: when systemd was first started
- OnUnitActiveSec: when the unit was lastActivated
- OnUnitInactiveSec: when the unit was last deactivated

+++

#### expressions

- usec, us
- msec, ms
- seconds, second, sec, s (default)
- minutes, minute, min, m
- hours, hour, hr, h
- days, day, d
- weeks, week, w
- months, month, M (defined as 30.44d)
- years, year, y (defined as 365.25d)

---

## journald

- logging service for systemd
- saved on `/var/run/log/journal`
  + removed at reboot
- collect from:
  + stdout/stderr managed by systemd
  + syslog
  + journald API
- `journalctl` command

Note:
- `/var/log/journal`
- `journalctl` pipes to `less`

---

## DO YOU HAVE ANY QUESTIONS?
