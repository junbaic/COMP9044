#!/bin/dash

# ==============================================================================
# test04.sh
# Test the subset2 a c i command.
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
seq 1 6 | slippy '4a nihao' > "$act_output" 2>&1

#exp_ouput
cat > "$exp_output" <<EOF
1
2
3
4
nihao
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
seq 1 6 | slippy '4i nihao' > "$act_output" 2>&1

#exp_ouput
cat > "$exp_output" <<EOF
1
2
3
nihao
4
5
6
EOF

if ! diff "$act_output" "$exp_output"
then
    echo "Test2 Failed!!!"
    exit 1
else
    echo "Test2 Pass..."
fi

#Test3
seq 1 6 | slippy '4c nihao' > "$act_output" 2>&1

#exp_ouput
cat > "$exp_output" <<EOF
1
2
3
nihao
5
6
EOF

if ! diff "$act_output" "$exp_output"
then
    echo "Test3 Failed!!!"
    exit 1
else
    echo "Test3 Pass..."
fi

#Test4
seq 1 3 | slippy 'a ni hao' > "$act_output" 2>&1

#exp_ouput
cat > "$exp_output" <<EOF
1
ni hao
2
ni hao
3
ni hao
EOF

if ! diff "$act_output" "$exp_output"
then
    echo "Test4 Failed!!!"
    exit 1
else
    echo "Test4 Pass..."
fi

#Test5
seq 1 3 | slippy 'c ni hao'  > "$act_output" 2>&1

#exp_ouput
cat > "$exp_output" <<EOF
ni hao
ni hao
ni hao
EOF

if ! diff "$act_output" "$exp_output"
then
    echo "Test5 Failed!!!"
    exit 1
else
    echo "Test5 Pass..."
fi


echo  "All Test04 Passed!!!"
exit 0
