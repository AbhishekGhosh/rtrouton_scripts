#!/bin/bash

# Determine OS version
osvers=$(sw_vers -productVersion | awk -F. '{print $2}')

dialog="This installer is 3 GBs in size, so it may take up to 30 minutes to download and install. Please be patient."
description=`echo "$dialog"`
button1="OK"
jamfHelper="/Library/Application Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper"
icon="/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/AlertNoteIcon.icns"


if [[ ${osvers} -lt 7 ]]; then

  "$jamfHelper" -windowType utility -description "$description" -button1 "$button1" -icon "$icon"

fi

if [[ ${osvers} -ge 7 ]]; then

  jamf displayMessage -message "$dialog"

fi

exit 0