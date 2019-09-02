import subprocess
import os
import os.path

from i3pystatus import Status

status = Status()

status.register("clock",
    format="  %a %-d %b %H:%M:%S",
    color='#61AEEE',
    interval=1,)

status.register("pulseaudio",
    color_unmuted='#98C379',
    color_muted='#E06C75',
    format_muted=' [muted]',
    format=" {volume}%")

status.register("temp",
    color='#78EAF2',
    format="\uf2c9 {temp:.0f} °C",)

status.register("cpu_usage",
    format=" {usage:02}%")

status.register("network",
    interface="wlp3s0",
    color_up="#8AE234",
    color_down="#EF2929",
    format_up=" {essid} ({quality:.0f}%)  {kbs} kbs",
    format_down="",)

status.register("backlight",
    interval=1,
    format=" {percentage:.0f}%",
    backlight="intel_backlight",)

# Internal battery
status.register("battery"
    ,battery_ident="BAT0",
    interval=5,
    format="{status} {consumption:.1f}W {percentage:.0f}% {remaining:%E%hh:%Mm}",
    alert=True,
    alert_percentage=15,
    color="#FFFFFF",
    critical_color="#FF1919",
    charging_color="#E5E500",
    full_color="#D19A66",
    status={
        "DIS": "\uf241",
        "CHR": "\uf240",
        "FULL": "\uf240",
    },)

# External battery
status.register("battery"
    ,battery_ident="BAT1",
    interval=5,
    format="{status} {consumption:.1f}W {percentage:.0f}% {remaining:%E%hh:%Mm}",
    alert=True,
    alert_percentage=15,
    color="#FFFFFF",
    critical_color="#FF1919",
    charging_color="#E5E500",
    full_color="#D19A66",
    status={
        "DIS": "\uf241",
        "CHR": "\uf240",
        "FULL": "\uf240",
    },)

status.register("mem",
    color="#999999",
    warn_color="#E5E500",
    alert_color="#FF1919",
    format=" {avail_mem:.1f} GB",
    divisor=1073741824,)

status.register("disk"
    ,color='#ABB2BF',
    path="/",
    format="\uf07b {avail:.0f} GB",)

status.register("disk",
    color='#56B6C2',
    path="/home",
    format=" {avail:.0f} GB",)

status.run()
