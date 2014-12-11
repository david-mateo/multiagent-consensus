nag=200
nleads=72
kmax=50
threshold=0.5
runs=100

order="threshold_mean_speed($nag, $nleads, $kmax , $runs, $threshold)"
echo Computing $order
octave --silent --eval "$order"

