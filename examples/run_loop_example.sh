nag=200
nleads=72
kmax=50
thresholds='0.1 0.2 0.3 0.4 0.5'
runs=10

res_dir=$(pwd)/results
mkdir -p $res_dir
for threshold in $thresholds ; do
    output=${res_dir}/speed_th${threshold}.dat
    order="threshold_mean_speed($nag, $nleads, $kmax , $runs, $threshold)"
    octave --silent --eval "$order" > $output
done
echo "Done"
