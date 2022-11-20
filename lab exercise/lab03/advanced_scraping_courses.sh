#!/bin/bash
case $# in
2)
  YEAR=$1
  CODE=$2
  ;;
*)
	echo "Usage: $0 <year> <course-prefix>" >& 2
	exit 1
esac

if [ $YEAR -ge 2005 ] 2> /dev/null && [ $YEAR -le 2018 ] 2> /dev/null
then
(
 curl --cipher 'DEFAULT:!DH' -sL "http://legacy.handbook.unsw.edu.au/vbook${YEAR}/brCoursesByAtoZ.jsp?StudyLevel=Undergraduate&descr=${CODE}"

 curl --cipher 'DEFAULT:!DH' -sL "http://legacy.handbook.unsw.edu.au/vbook${YEAR}/brCoursesByAtoZ.jsp?StudyLevel=Postgraduate&descr=${CODE}"

)| pup -p 'table.tabluatedInfo td text{}' | tr -d '\240' | sed 's/\xC2//g' | tr -s '\n'| sed -E ' 3~3d; N;s/\n/ /'|sort|uniq

elif [ $YEAR -ge 2019 ] 2> /dev/null && [ $YEAR -le 2022 ] 2> /dev/null
then
(
 curl -sL "https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:$1%20+unsw_psubject.studyLevel:undergraduate%20+unsw_psubject.educationalArea:$2*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:ugrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0"

 curl -sL "https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:$1%20+unsw_psubject.studyLevel:postgraduate%20+unsw_psubject.educationalArea:$2*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:pgrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0"

) | 2041 jq -r '.["contentlets"][] | (.code + " " + .title)' | sort | uniq | sed -e "s/\([ ]\)\1\+/\1/g"
else
	echo "$0: argument 1 must be an integer between 2005 and 2022" >& 2
	exit 1
fi
