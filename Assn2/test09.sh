#!/bin/dash

# ==============================================================================
# test09.sh
# Test the subset1 , commands.
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
seq 10 22 | slippy '3,/2/d' > "$act_output" 2>&1

#exp_ouput
cat > "$exp_output" <<EOF
10
11
21
22
EOF

if ! diff "$act_output" "$exp_output"
then
    echo "Test1 Failed!!!"
    exit 1
else
    echo "Test1 Pass..."
fi

#Test2
seq 10 22 | slippy '2,/2/d' > "$act_output" 2>&1

#exp_ouput
cat > "$exp_output" <<EOF
10
13
14
15
16
17
18
19
20
21
22
EOF

if ! diff "$act_output" "$exp_output"
then
    echo "Test2 Failed!!!"
    exit 1
else
    echo "Test2 Pass..."
fi

#Test3
seq 10 15| slippy '3,5d' > "$act_output" 2>&1

#exp_ouput
cat > "$exp_output" <<EOF
10
11
15
EOF

if ! diff "$act_output" "$exp_output"
then
    echo "Test3 Failed!!!"
    exit 1
else
    echo "Test3 Pass..."
fi

#Test4
seq 10 22| slippy '/2/,4d'> "$act_output" 2>&1

#exp_ouput
cat > "$exp_output" <<EOF
10
11
14
15
16
17
18
19
EOF

if ! diff "$act_output" "$exp_output"
then
    echo "Test4 Failed!!!"
    exit 1
else
    echo "Test4 Pass..."
fi

#Test5
seq 10 22| slippy '/2/,3d' > "$act_output" 2>&1

#exp_ouput
cat > "$exp_output" <<EOF
10
11
13
14
15
16
17
18
19
EOF

if ! diff "$act_output" "$exp_output"
then
    echo "Test5 Failed!!!"
    exit 1
else
    echo "Test5 Pass..."
fi

#Test6
seq 10 22| slippy '/1$/,/^2/d' > "$act_output" 2>&1

#exp_ouput
cat > "$exp_output" <<EOF
10
EOF

if ! diff "$act_output" "$exp_output"
then
    echo "Test6 Failed!!!"
    exit 1
else
    echo "Test6 Pass..."
fi

#Test7
seq 10 33| slippy '/1$/,/^2/d' > "$act_output" 2>&1

#exp_ouput
cat > "$exp_output" <<EOF
10
23
24
25
26
27
28
29
30
EOF

if ! diff "$act_output" "$exp_output"
then
    echo "Test7 Failed!!!"
    exit 1
else
    echo "Test7 Pass..."
fi

#Test8
seq 190 210| slippy '/1$/,/^2/d' > "$act_output" 2>&1

#exp_ouput
cat > "$exp_output" <<EOF
190
203
204
205
206
207
208
209
210
EOF

if ! diff "$act_output" "$exp_output"
then
    echo "Test8 Failed!!!"
    exit 1
else
    echo "Test8 Pass..."
fi


echo  "All Test09 Passed!!!"
exit 0
