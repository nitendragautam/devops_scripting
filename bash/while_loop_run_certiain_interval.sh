## Run Function in Loop for certain interval every 5 minutes
```
#!/bash/bin

## It will run for 863 Seconds
MAX_VALUE=863
sleep_time=5

s_count_value=0
## Here lt means less than
while [ $s_count_value -lt $MAX_VALUE ];

  do

  echo "Starting the process"

  s_count_value=$($s_count_value +1)

    echo "Starting the process"
  #Sleep for 5 minutes

  sleep ${sleep_time}m
  done

```
