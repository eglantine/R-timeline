#!/bin/bash
#!/usr/bin/env Rscript

# Add the following line to your crontab using "$ crontab -e"
# * /15 * * * * cd ~/R/R-timeline && /bin/bash LaunchSaveTimeline.sh

echo "LaunchSaveTimeline : $(date)" >> ~/R/R-timeline/saveTimeline.log
Rscript ~/R/saveTimeline.R
