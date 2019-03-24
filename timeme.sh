#!/bin/bash
# Get rid of gpg "Unsafe directory" warnings
chmod 700 .
export TIMEFORMAT=%3R
# Use keys here
export GNUPGHOME=.
for i in 85F7216BBF556933ABCFB61E0C491BC55333E8BF 99CEB0C7DF2C6B9D1F0D7F18436839B3D9F64BEC 4D08E1413ABAC74651887FF438F0590D6FF6E19F F1F1F694DCC50123D782E0192E45864BB2F3F24B E9846B1E6260FAF41AAECC97A1A1B649B6F7B8C8 15135317E4A49C76F95C97E25F5F0F003A37AC80
do
	gpg --list-keys $i
	for t in 0 1 2 3 4 5 6 7 8 9
	do
		echo -n $i | (time gpg --sign -u $i > /dev/null) 2>&1
	done | tee $i.time | (tr \\012 +; echo 0) | (echo -n " ----> "; bc)
	echo =================================
done
