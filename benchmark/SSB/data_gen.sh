#!/bin/bash

# Scaling factors to generate
# 10 100 (just for testing right now since all was lost...)
SCALE_FACTORS=(1 10 100)

# Benchmark data directory
#BENCHMARK_DATA_DIR="benchmark/SSB/data"

# Clone the SSB generator if needed into a ssb-dben folder
if [ ! -d "ssb-dbgen" ]; then
  echo "Cloning SSB generator..."
  git clone https://github.itu.dk/pito/ads2024-ssb-dbgen.git ssb-dbgen 
fi

# Build dbgen if not built
cd ssb-dbgen
if [ ! -f "dbgen" ]; then
  echo "Building dbgen executabl"
  make
fi

# Generate data
for SF in "${SCALE_FACTORS[@]}"; do
  echo "Generating data for SF=$SF... (./dbgen -s "$SF" -T a)"
  ./dbgen -s "$SF" -T a

  # Move data to the correct folder
  mkdir -p "../data/sf$SF"
  mv *.tbl "../data/sf$SF/" #move all the tbl files
  echo "Data for SF=$SF moved to data/sf$SF."
done

cd ..
echo "Ready to go (I hope xD)!"