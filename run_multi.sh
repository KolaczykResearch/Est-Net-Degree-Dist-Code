for x in {1..10}; do
    to=$(($x*10))
    from=$((($x-1)*10+1))
    
    echo "from $from to $to"

    matlab > log/out_smooth_1_$from-$to.log 2>&1 << EOF &
    run_multi($from:$to, 'cov_diag_smooth', 100);
EOF

done
