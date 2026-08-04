define :play_bar do |notes, durations, accents|
  notes.each_with_index do |n, i|
    d=durations[i]
    a=accents[i]
    
    if n!=:r && a>0
      play n,release: d*0.8, amp: a
    end
    sleep d
  end
end

live_loop :bass do
  use_synth :bass_foundation
  
  chords=[chord(:d4,:maj),chord(:f4,:min),chord(:a4,:min),chord(:g4,:maj)]
  
  chords.each do |target_chord|
    play target_chord, attack: 0.5, sustain: 3, release: 0.5
    sleep 4
  end
end

live_loop :melogy do
  use_synth :piano
  
  notes_a=[:G5, :a5, :fs5, :b4, ]
  notes_b=[:G5, :a5, :cs6, :b5, ]
  
  # aaab
  3.times do
    notes_a.each do |target_chord|
      play target_chord, attack: 0.1, sustain: 0.8, release: 0.2
      sleep 1
    end
  end
  
  1.times do
    notes_b.each do |target_chord|
      play target_chord, attack: 0.1, sustain: 0.8, release: 0.2
      sleep 1
    end
  end
end


bar1_notes=[:a6 ,:r  ,:r  ,:g6 ,:gs6,:r  ,:f6 ,:r  ]
bar1_durrs=[0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ]
bar1_acces=[0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ]


live_loop :accent do
  use_synth :dull_bell
  with_fx :pan, pan: 0 do
    play_bar bar1_notes, bar1_durrs, bar1_acces

  end
end
