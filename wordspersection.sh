#!/usr/bin/bash
# counting the number of words in each section of PDFFILE
# remove line numbers to avoid problems

PDFFILE='ArticlePassosetal2022_draft3.pdf'
eval "pdftotext ${PDFFILE} textoutput.txt" 
HEADINGS=('Introduction' 'Methods (Online)' 'Results' 'Discussion' 'Conclusion')
NEXTHEADING=('Methods (Online)' 'Results' 'Discussion' 'Conclusion' 'References')
L=0
for SEC in 'Introduction' 'Methods' 'Results' 'Discussion' 'Conclusion'
do
	STR_SUF=${HEADINGS[${L}]}
	STARTING_COM="grep -n '${STR_SUF}' textoutput.txt | cut -d':' -f 1"
	STARTING_STR=$(eval ${STARTING_COM})
	STARTING=`expr $STARTING_STR + 1`

	STR_SUF=${NEXTHEADING[${L}]}
	ENDING_COM="grep -n '${STR_SUF}' textoutput.txt | cut -d':' -f 1"
	ENDING_STR=$(eval ${ENDING_COM})
	ENDING=`expr $ENDING_STR - 1`

	SECTION_COM="sed -n '${STARTING},${ENDING}p' textoutput.txt | wc -w"
	SECTION_WC=$(eval ${SECTION_COM})
	echo "The $SEC has $SECTION_WC words."	
	L=`expr $L + 1`
done
eval "rm textoutput.txt"
