#!/bin/bash
QDIR='queries/'
OUTFILE='testResults.txt'
if [[ ! -f $OUTFILE ]]
then
    touch $OUTFILE
    echo "Test of PSQL Queries" > $OUTFILE
else
    echo "Test of PSQL Queries" > $OUTFILE
fi

STARTTIME=0
ENDTIME=0
for i in $(ls $QDIR)
do
    q=$(echo $i | cut -d '.' -f 1)
    echo "Query $q" >> $OUTFILE
    STARTTIME=$(perl -MTime::HiRes=time -e 'printf "%f\n", time')
    echo "  Start: $STARTTIME" >> $OUTFILE
    heroku pg:psql -f "$QDIR/$i" >> $OUTFILE
    ENDTIME=$(perl -MTime::HiRes=time -e 'printf "%f\n", time')
    echo "  End: $ENDTIME" >> $OUTFILE
    ELAPSED=$(perl -e "printf $ENDTIME-$STARTTIME")
    echo "  Elapsed: $ELAPSED" >> $OUTFILE
done
cat $OUTFILE