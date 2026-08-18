#!/bin/bash
# ---------------------------------------
# Handle failures during script execution
# ---------------------------------------
set -u 
set -o pipefail

LOGFILE="$1"
REPORT="Security_report.txt"
ERRORS=0

#-----------------------------------------------------------
# Validate the suppied log file
#-----------------------------------------------------------

if [ -z "$LOGFILE" ]; then
    echo "No logfile supplied."
    exit 1
fi

if [ ! -f "$LOGFILE" ]; then
    echo "The logfile does not exist: $LOGFILE"
    exit 1
fi

echo "Starting security evidence collection..."
echo "Log file: $LOGFILE"
echo

#------------------------------------------------------------
# 1. Start a new report
# -----------------------------------------------------------

echo "======== SECURITY EVIDENCE REPORT =========" > "$REPORT"
echo "Log file: $LOGFILE" >>  "$REPORT"
echo "Date: $(date)" >> "$REPORT"
echo >> "$REPORT"

# ----------------------------------------------------------
# 2. Collect running processes
# ----------------------------------------------------------
echo "Collecting running processes..."

if ps aux >> "$REPORT"; then
    echo "Processes: OK"
else
    echo "ERROR: Could not collect running processes."
    echo "ERROR: Process collection failed." >> "$REPORT"
    ERRORS=1
fi

echo >> "$REPORT"

# ----------------------------------------------------------
# 3. Collect listening ports
# ----------------------------------------------------------
echo "Collecting listening ports ..."

if sudo ss -tulnp >> "$REPORT"; then
    echo "Listening ports: OK"
else
    echo "ERROR: Could not collect listening ports."
    echo "ERROR: Port collection failed." >> "$REPORT"
    ERRORS=1
fi

echo >> "$REPORT"

# ----------------------------------------------------------
# 4. Collect recent  journal entries
# ----------------------------------------------------------
echo "Collection recent journal entries ..."

if journalctl --since "10 minutes ago" --no-pager >> "$REPORT"; then
    echo "Journal entries: OK"
else
    echo "ERROR: Could not collect journal entries."
    echo "ERROR: Journal collection failed." >> "$REPORT"
    ERRORS=1
fi

echo >> "$REPORT"

# ----------------------------------------------------------
# Analyse failed login attempts
# ----------------------------------------------------------
FAILED=$(grep -ic "failed" "$LOGFILE")
STATUS=$?

if [ "$STATUS" -gt 1 ]; then
    echo "ERROR: grep failed during analysing the log."
    echo "ERROR: Failed-login analysis failed." >> "$REPORT"
    ERRORS=1
   
else
    echo "Failed login entries: $FAILED"
    echo "Failed login entries: $FAILED" >> "$REPORT"
fi

echo >> "$REPORT"

# ---------------------------------------------------------
# Final result
# ---------------------------------------------------------

echo "=================================================" >> "$REPORT"

if [ "$ERRORS" -eq 0 ]; then
    echo "Investigation completed successfully."
    echo "Report: $REPORT"
    exit 0
else
    echo "Investigation completed with errors."
    echo "Report is INCOMPLETE: $REPORT"
    exit 1
fi

