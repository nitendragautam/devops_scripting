#!/bash/bin
#Here Date Range is like 20190608,20190609,20190609
DATE_RANGE=$1

for i in $(echo $DATE_RANGE |tr ',' '\n');
  do p_date=$i

  echo "passed_date $p_date"

  done
