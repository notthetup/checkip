checkip
=======

Simple little script to check and logs your outward facing ip address. Great if you want to know when and to what your outward facing IP address was changed (that is if your ISP assigns you a non-static IP)

This can easily made into a cronjob (as I have) with the following crontab entry.

```
/# Minute   Hour   Day of Month       Month          Day of Week        Command
/# (0-59)  (0-23)     (1-31)    (1-12 or Jan-Dec)  (0-6 or Sun-Sat)
   00      */03       *             *               *                 ~/.checkip/checkip.sh
```
