#!/bin/bash

eslint_file="/Users/mslawins/work/trip-planner-front/.eslintrc.json"
backup_file="/Users/mslawins/temp/backup_file.json"
working_file="/Users/mslawins/temp/working_file.json"


mv "$eslint_file" "$backup_file"
cp "$working_file" "$eslint_file"
