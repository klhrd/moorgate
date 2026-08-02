live_loop :bass do
  use_synth :bass_foundation
  
  chords=[chord(:d4,:maj),chord(:f4,:min),chord(:a4,:min),chord(:g4,:maj)]
  
  chords.each do |target_chord|
    play target_chord, attack: 0.5, sustain: 3, release: 0.5
    sleep 4
  end
end

live_loop :lead do
  use_synth :piano
  
  chords_a=[:G5, :a5, :fs5, :b4, ]
  chords_b=[:G5, :a5, :cs6, :b5, ]
  
  # aaab
  3.times do
    chords_a.each do |target_chord|
      play target_chord, attack: 0.05, sustain: 0.8, release: 0.2
      sleep 1
    end
  end
  
  1.times do
    chords_b.each do |target_chord|
      play target_chord, attack: 0.05, sustain: 0.8, release: 0.2
      sleep 1
    end
  end
end