#!/bin/dash

# ==============================================================================
# test05.sh
# Test the -n and subset0:Address command.
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
seq 12 24| slippy '4s/1/2/' > "$act_output" 2>&1

#exp_ouput
cat > "$exp_output" <<EOF
12
13
14
25
16
17
18
19
20
21
22
23
24
EOF

if ! diff "$act_output" "$exp_output"
then
    echo "Test1 Failed!!!"
    exit 1
else
    echo "Test1 Pass..."
fi

#Test2
seq 10 14| slippy '2s/1/2/' > "$act_output" 2>&1

#exp_ouput
cat > "$exp_output" <<EOF
10
21
12
13
14
EOF

if ! diff "$act_output" "$exp_output"
then
    echo "Test2 Failed!!!"
    exit 1
else
    echo "Test2 Pass..."
fi

#Test3
seq 1 4| slippy '2s/1/2/' > "$act_output" 2>&1

#exp_ouput
cat > "$exp_output" <<EOF
1
2
3
4
EOF

if ! diff "$act_output" "$exp_output"
then
    echo "Test3 Failed!!!"
    exit 1
else
    echo "Test3 Pass..."
fi

#Test4
seq 50 54| slippy '4s/5/8/g' > "$act_output" 2>&1

#exp_ouput
cat > "$exp_output" <<EOF
50
51
52
83
54
EOF

if ! diff "$act_output" "$exp_output"
then
    echo "Test4 Failed!!!"
    exit 1
else
    echo "Test4 Pass..."
fi

#Test5
seq 1 6 | slippy -n '4p' > "$act_output" 2>&1

#exp_ouput
cat > "$exp_output" <<EOF
4
EOF

if ! diff "$act_output" "$exp_output"
then
    echo "Test5 Failed!!!"
    exit 1
else
    echo "Test5 Pass..."
fi

#Test6
seq 1 7 | slippy -n '2p' > "$act_output" 2>&1

#exp_ouput
cat > "$exp_output" <<EOF
2
EOF

if ! diff "$act_output" "$exp_output"
then
    echo "Test6 Failed!!!"
    exit 1
else
    echo "Test6 Pass..."
fi

#Test7
seq 1 7 | slippy -n '/^1/p' > "$act_output" 2>&1

#exp_ouput
cat > "$exp_output" <<EOF
1
EOF

if ! diff "$act_output" "$exp_output"
then
    echo "Test7 Failed!!!"
    exit 1
else
    echo "Test7 Pass..."
fi

#Test8
seq 1 6| slippy -n '4d' > "$act_output" 2>&1

#exp_ouput
cat > "$exp_output" <<EOF
EOF

if ! diff "$act_output" "$exp_output"
then
    echo "Test8 Failed!!!"
    exit 1
else
    echo "Test8 Pass..."
fi

#Test9
seq 1 5| slippy -n '4q' > "$act_output" 2>&1

#exp_ouput
cat > "$exp_output" <<EOF
EOF

if ! diff "$act_output" "$exp_output"
then
    echo "Test9 Failed!!!"
    exit 1
else
    echo "Test9 Pass..."
fi

#Test10
seq 10 1999| slippy -n '6q' > "$act_output" 2>&1

#exp_ouput
cat > "$exp_output" <<EOF
EOF

if ! diff "$act_output" "$exp_output"
then
    echo "Test10 Failed!!!"
    exit 1
else
    echo "Test10 Pass..."
fi

echo  "All Test05 Passed!!!"
exit 0
