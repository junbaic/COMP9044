#!/bin/dash

# ==============================================================================
# test03.sh
# Test the s command.
# Written by: Jun Bai
# For COMP9044 Assignment 2
# ==============================================================================

#start testing
echo "===========Test start============"

# Add the current directory to the PATH so scripts.
PATH="$PATH:$(pwd)"

# Create a temporary directory for the test.
test_directory="$(mktemp -d)"
cd "$test_directory" || exit 1

# Create some files to hold output.
exp_output="$(mktemp)"
act_output="$(mktemp)"

# Remove the temporary directory when the test is done.
trap 'rm "$exp_output" "$act_output" -rf "$test_directory"' INT HUP QUIT TERM EXIT


#Test1
seq 1 6 | slippy 's/[12]/xxx/' > "$act_output" 2>&1

#exp_ouput
cat > "$exp_output" <<EOF
xxx
xxx
3
4
5
6
EOF

if ! diff "$act_output" "$exp_output"
then
    echo "Test1 Failed!!!"
    exit 1
else
    echo "Test1 Pass..."
fi

#Test2
seq 1 11 | slippy 's/[14]/yyy/' > "$act_output" 2>&1

#exp_ouput
cat > "$exp_output" <<EOF
yyy
2
3
yyy
5
6
7
8
9
yyy0
yyy1
EOF

if ! diff "$act_output" "$exp_output"
then
    echo "Test2 Failed!!!"
    exit 1
else
    echo "Test2 Pass..."
fi

#Test3
seq 1 5 | slippy 's/^2/7/' > "$act_output" 2>&1

#exp_ouput
cat > "$exp_output" <<EOF
1
7
3
4
5
EOF

if ! diff "$act_output" "$exp_output"
then
    echo "Test3 Failed!!!"
    exit 1
else
    echo "Test3 Pass..."
fi

#Test4
echo Ni Hao Ma| slippy 's/a/X/' > "$act_output" 2>&1

#exp_ouput
cat > "$exp_output" <<EOF
Ni HXo Ma
EOF

if ! diff "$act_output" "$exp_output"
then
    echo "Test4 Failed!!!"
    exit 1
else
    echo "Test4 Pass..."
fi

#Test5
echo Ni Hao Ma| slippy 's/a/X/g' > "$act_output" 2>&1

#exp_ouput
cat > "$exp_output" <<EOF
Ni HXo MX
EOF

if ! diff "$act_output" "$exp_output"
then
    echo "Test5 Failed!!!"
    exit 1
else
    echo "Test5 Pass..."
fi


echo  "All Test03 Passed!!!"
exit 0
