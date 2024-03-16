# memreport

Audit memory usage of your processes and hunt memory leaks.

## Usage

Download the script, make it executable and give it a process name you want to monitor:

```bash
./memreport.sh nginwho
```

This will create a file named `nginwho_memreport.log` in the same directory as the script, checks the given program every second and whenever there is an increase in memory consumption it will be logged in the log file. For instance:

```text
2024-03-06 17:55:18 -> 3 MB
2024-03-06 17:55:28 -> 5 MB
2024-03-06 17:56:49 -> 6 MB
2024-03-06 17:58:19 -> 7 MB
2024-03-06 18:00:21 -> 8 MB
2024-03-06 18:02:11 -> 9 MB
2024-03-06 18:03:32 -> 10 MB
2024-03-06 18:05:23 -> 11 MB
2024-03-06 18:07:14 -> 12 MB
2024-03-06 18:08:44 -> 13 MB
2024-03-06 18:10:25 -> 14 MB
```
